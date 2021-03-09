import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:mycart/models/addresses/delivery_locations.dart';
import 'package:mycart/models/addresses/user_addresses.dart';
import 'package:mycart/models/main_menu/main_menu_category.dart';
import 'package:mycart/models/main_menu/main_menu_item.dart';
import 'package:mycart/models/recent_orders/recent_orders.dart';
import 'package:mycart/models/recent_orders/recent_orders_item.dart';
import 'package:mycart/models/sub_menu/sub_menu_item.dart';
import 'package:mycart/services/data_manager.dart';

class FirebaseManager {
  static final Future<FirebaseApp> _future = Firebase.initializeApp();
  static final databaseRef = FirebaseDatabase.instance.reference();
  static const url = 'https://my-cart-4f654-default-rtdb.firebaseio.com/data/';

  static Future<List> getDeliveryLocations() async {
    var path = 'delivery_locations.json';
    final List<DeliveryLocationsClass> items = [];
    try {
      final response = await http.get(url + path);
      final dbData = json.decode(response.body) as Map<String, dynamic>;
      dbData.forEach((key, data) {
        items.add(
          DeliveryLocationsClass(
            key.toString(),
            data["name"].toString(),
            double.parse(data["fees"].toString()),
            int.parse(data['time'].toString()),
          ),
        );
      });
    } on Exception catch (e) {
      print(e.toString());
      throw (e);
    }
    return items;
  }

  static Future<List> getUserAddresses() async {
    var path = 'addresses.json';
    final List<UserAddressesClass> items = [];
    try {
      final response = await http.get(url + path);
      final dbData = json.decode(response.body) as Map<String, dynamic>;
      if (dbData != null) {
        dbData.forEach((key, data) {
          if (data['user_id'] == DataManager.mPrefManager.id) {
            items.add(
              UserAddressesClass(
                key.toString(),
                data["user_id"].toString(),
                data["location_id"].toString(),
                data['street_name'].toString(),
                data['building_number'].toString(),
                int.parse(data['floor_number'].toString()),
                int.parse(data['apartment_number'].toString()),
                data['phone_number'].toString(),
              ),
            );
          }
        });
      }
    } on Exception catch (e) {
      print(e.toString());
      //throw (e);
    }
    return items;
  }

  static Future<List> getMainMenuCategories() async {
    var path = 'main_menu_categories.json';
    final List<MainMenuCategoryClass> items = [];
    try {
      final response = await http.get(url + path);
      final dbData = json.decode(response.body) as Map<String, dynamic>;
      dbData.forEach((key, data) {
        items.add(
            MainMenuCategoryClass(key.toString(), data['name'].toString()));
      });
    } on Exception catch (e) {
      print(e.toString());
      throw (e);
    }
    return items;
  }

  static Future<List> getMainMenuItems() async {
    var path = 'main_menu_items.json';
    final List<MainMenuItemClass> items = [];
    try {
      final response = await http.get(url + path);
      final dbData = json.decode(response.body) as Map<String, dynamic>;
      dbData.forEach((key, data) {
        items.add(MainMenuItemClass(
          key.toString(),
          data['category_id'].toString(),
          data['name'].toString(),
          data['image'].toString(),
          (int.parse(data['is_active'].toString()) == 1),
        ));
      });
    } on Exception catch (e) {
      print(e.toString());
      throw (e);
    }
    return items;
  }

  static Future<List> getSubMenuItems(String menuId) async {
    var path = 'sub_menu_items.json';
    final List<SubMenuItemClass> items = [];
    try {
      final response = await http.get(url + path);
      final dbData = json.decode(response.body) as Map<String, dynamic>;
      dbData.forEach((key, data) {
        if (data['menu_id'].toString() == menuId) {
          items.add(SubMenuItemClass(
            key.toString(),
            data['name'].toString(),
            data['description'].toString(),
            data['image'].toString(),
            double.parse(data['price'].toString()),
            int.parse(data['discount'].toString()),
            (int.parse(data['is_active'].toString()) == 1),
          ));
        }
      });
    } on Exception catch (e) {
      print(e.toString());
      throw (e);
    }

    print('SUB MENU COUNT ' + items.length.toString());
    return items;
  }

  static Future<List> getSearchItems(String searchKey) async {
    var path = 'sub_menu_items.json';
    final List<SubMenuItemClass> items = [];
    try {
      final response = await http.get(url + path);
      final dbData = json.decode(response.body) as Map<String, dynamic>;
      dbData.forEach((key, data) {
        if (data['name'].toString().contains(searchKey)) {
          items.add(SubMenuItemClass(
            key.toString(),
            data['name'].toString(),
            data['description'].toString(),
            data['image'].toString(),
            double.parse(data['price'].toString()),
            int.parse(data['discount'].toString()),
            (int.parse(data['is_active'].toString()) == 1),
          ));
        }
      });
    } on Exception catch (e) {
      print(e.toString());
      throw (e);
    }
    return items;
  }

  static Future<List> getRecentOrders() async {
    var path = 'recent_orders.json';
    final List<RecentOrdersClass> items = [];
    String deliveryAddressDetails = "";
    String deliveryAddressPhoneNumber = "";
    try {
      final response = await http.get(url + path);
      final dbData = json.decode(response.body) as Map<String, dynamic>;
      dbData.forEach((key, data) async {
        if (data['user_id'].toString() == DataManager.mPrefManager.id) {
          var addressPath =
              'addresses/' + data['delivery_address_id'].toString() + '.json';
          try {
            final responseAddress = await http.get(url + addressPath);
            final List dbAddressData =
                (json.decode(responseAddress.body) as Map<String, dynamic>)
                    .values
                    .toList();
            deliveryAddressDetails = dbAddressData[5].toString() +
                ', ' +
                dbAddressData[2].toString() +
                ', ' +
                dbAddressData[0].toString();
            deliveryAddressPhoneNumber = dbAddressData[4].toString();
          } on Exception catch (e) {
            print(e.toString());
            throw (e);
          }
          List items2 = new List();
          for (var i in (data['items'])) {
            List ix = i.values.toList();
            items2.add(RecentOrdersItemClass(
              ix[0].toString(),
              key.toString(),
              ix[0].toString(),
              ix[1].toString(),
              int.parse(ix[3].toString()),
              double.parse(ix[2].toString()),
            ));
          }
          items.add(RecentOrdersClass(
            key.toString(),
            double.parse(data['sub_total'].toString()),
            double.parse(data['delivery_fees'].toString()),
            data['promocode'].toString(),
            double.parse(data['discount'].toString()),
            double.parse(data['total_price'].toString()),
            data['delivery_address_id'].toString(),
            deliveryAddressDetails,
            deliveryAddressPhoneNumber,
            data['order_note'].toString(),
            int.parse(data['status'].toString()),
            int.parse(data['time'].toString()),
            items2.toList(),
          ));
        }
      });
    } on Exception catch (e) {
      print(e.toString());
      throw (e);
    }
    return items;
  }

  static Future<bool> submitAddress(locationId, streetName, buildingNumber,
      floorNumber, apartmentNumber, phoneNumber,
      [String addressId = ""]) async {
    var dbRef2 = databaseRef.child('data').child('addresses');
    if (addressId == "") {
      dbRef2 = dbRef2.push();
    } else {
      dbRef2 = dbRef2.child(addressId.toString());
    }
    await dbRef2.set({
      'user_id': DataManager.mPrefManager.getId().toString(),
      'location_id': locationId.toString(),
      'street_name': streetName,
      'building_number': buildingNumber,
      'floor_number': floorNumber.toString(),
      'apartment_number': apartmentNumber.toString(),
      'phone_number': phoneNumber.toString(),
    }).then((value) {
      if (locationId == "") {
        Fluttertoast.showToast(
          msg: "Address is successfully added.",
          toastLength: Toast.LENGTH_LONG,
        );
      } else {
        Fluttertoast.showToast(
          msg: "Address is successfully updated.",
          toastLength: Toast.LENGTH_LONG,
        );
      }
    });
    return true;
  }

  static Future<bool> placeOrder(myOrder) async {
    var dbRef2 = databaseRef.child('data').child('recent_orders');
    await dbRef2.push().set(myOrder);
    return true;
  }
}
