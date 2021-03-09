import 'dart:convert' as convert;
import 'package:mycart/models/addresses/delivery_locations.dart';
import 'package:mycart/models/addresses/user_addresses.dart';
import 'package:mycart/models/cart/cart_item.dart';
import 'package:mycart/models/main_menu/main_menu_category.dart';
import 'package:mycart/models/main_menu/main_menu_item.dart';
import 'package:mycart/models/recent_orders/recent_orders.dart';
import 'package:mycart/models/recent_orders/recent_orders_item.dart';
import 'package:mycart/models/sub_menu/sub_menu_item.dart';
import 'package:mycart/services/api.dart';
import 'package:mycart/services/cart_manager.dart';
import 'package:mycart/services/firebase_manager.dart';
import 'dart:async';
import 'package:mycart/services/perference_manager.dart';

class DataManager {
  static PrefManager mPrefManager = new PrefManager();
  static List deliveryLocations = new List();
  static List userAddresses = new List();
  static String mainMenuBanner =
      "http://freshnfit.lxdev.net/api/assets/images/banners/main_banner.png";
  static List mainMenuCategories = new List();
  static List mainMenuItems = new List();
  static List subMenuItems = new List();
  static List searchItems = new List();
  static List lastSearchKeywords = new List();
  static List recentOrders = new List();
  static List offersItems = new List();
  static bool isDarkMode = false;

  static Future<void> iniUserAddresses([Function callBackFunction]) async {
    DataManager.deliveryLocations =
        await FirebaseManager.getDeliveryLocations();
    DataManager.userAddresses = await FirebaseManager.getUserAddresses();
    if (DataManager.mPrefManager.getSelectedAddress() == "") {
      if (DataManager.deliveryLocations != null &&
          DataManager.userAddresses != null &&
          DataManager.userAddresses.length > 0) {
        DataManager.mPrefManager
            .setSelectedAddress(DataManager.userAddresses[0].id.toString());
      } else {}
    }
    if (DataManager.userAddresses != null) {
      DataManager.mPrefManager.updateDeliveryFeesAndTime();
    }
    if (callBackFunction != null) {
      callBackFunction();
    }
  }

/*
  static Future<void> iniUserAddresses([Function callBackFunction]) async {
    String response = await API.getUserAddresses();
    List locationsLoadedItems =
        convert.jsonDecode(response)["delivery_locations"];
    List addressesLoadedItems = convert.jsonDecode(response)["addresses"];
    DataManager.deliveryLocations.clear();
    DataManager.userAddresses.clear();
    for (var i in locationsLoadedItems) {
      DataManager.deliveryLocations.add(
        DeliveryLocationsClass(
          i["id"],
          i['location_name'],
          double.parse(i['delivery_fees']),
          int.parse(i["delivery_time"]),
        ),
      );
    }
    if (addressesLoadedItems != null) {
      for (var i in addressesLoadedItems) {
        DataManager.userAddresses.add(
          UserAddressesClass(
            i["id"],
            i["user_id"],
            i["location_id"],
            i['street_name'],
            i['building_number'],
            int.parse(i['floor_number']),
            int.parse(i['apartment_number']),
            i['phone_number'],
          ),
        );
      }
    }

    if (DataManager.mPrefManager.getSelectedAddress() == 0) {
      if (addressesLoadedItems != null) {
        DataManager.mPrefManager
            .setSelectedAddress(int.parse(addressesLoadedItems[0]["id"]));
      } else {}
    }
    if (DataManager.userAddresses != null) {
      DataManager.mPrefManager.updateDeliveryFeesAndTime();
    }
    
    if (callBackFunction != null) {
      callBackFunction();
    }
  }
*/
  static Future<void> iniMainMenuCategories() async {
    DataManager.mainMenuCategories =
        await FirebaseManager.getMainMenuCategories();
  }

  static Future<void> iniMainMenuItems() async {
    DataManager.mainMenuItems = await FirebaseManager.getMainMenuItems();
  }

  static Future<void> iniSubMenuItems(String id) async {
    DataManager.subMenuItems = await FirebaseManager.getSubMenuItems(id);
  }

  static Future<void> iniSearchItems(String searchKey) async {
    DataManager.searchItems = await FirebaseManager.getSearchItems(searchKey);
  }

  static Future<void> iniRecentOrders() async {
    DataManager.recentOrders = await FirebaseManager.getRecentOrders();
  }

  static Future<bool> submitAddress(locationId, streetName, buildingNumber,
      floorNumber, apartmentNumber, phoneNumber,
      [String addressId = ""]) async {
    return await FirebaseManager.submitAddress(locationId, streetName,
        buildingNumber, floorNumber, apartmentNumber, phoneNumber, addressId);
  }

  /*static Future<void> iniRecentOrders() async {
    DataManager.recentOrders.clear();
    String response = await API.getRecentOrders();
    List loadedItems = convert.jsonDecode(response)["orders"];
    for (var i in loadedItems) {
      List recentOrderItems = convert.jsonDecode(response)["orders"]
          [loadedItems.indexOf(i)]["items"];
      List recentOrderItemsList = new List();
      for (var y in recentOrderItems) {
        recentOrderItemsList.add(
          RecentOrdersItemClass(
            y['id'],
            y['order_id'],
            y['item_id'],
            y['item_name'],
            int.parse(y['qty']),
            double.parse(y['item_price']),
          ),
        );
      }
      DataManager.recentOrders.add(
        RecentOrdersClass(
          int.parse(i["id"]),
          double.parse(i['sub_total']),
          double.parse(i['delivery_fees']),
          i['promocode'],
          double.parse(i['discount']),
          double.parse(i['total_price']),
          i['delivery_address_id'],
          i['delivery_address_details'],
          i['delivery_address_phone_number'],
          i['order_note'],
          int.parse(i['status']),
          int.parse(i['time']),
          recentOrderItemsList,
        ),
      );
    }
  }
  */

  static Future<bool> placeOrder() async {
    List<dynamic> myCartItems = new List();
    for (CartItemClass x in CartManager.mCart) {
      myCartItems.add(x.getAsMap());
    }
    Map<String, dynamic> myOrder = {
      'sub_total': CartManager.subtotal,
      'delivery_fees': CartManager.deliveryFees,
      'promocode': CartManager.promocode,
      'discount': CartManager.discount,
      'order_note': CartManager.orderNote,
      'total_price': CartManager.getTotalPrice(),
      'delivery_address_id': DataManager.mPrefManager.getSelectedAddress(),
      'status': 0,
      'time': 0,
      'user_id': DataManager.mPrefManager.id,
      'items': myCartItems,
    };
    await FirebaseManager.placeOrder(myOrder);
    CartManager.clean();
    return true;
  }

  static Future<void> iniOffersItems() async {
    String response = await API.getOffersItems();
    List loadedItems = convert.jsonDecode(response)["items"];
    //DataManager.subMenuImagePath = convert.jsonDecode(response)["images_path"];
    DataManager.offersItems.clear();
    for (var i in loadedItems) {
      DataManager.offersItems.add(
        SubMenuItemClass(
          i["id"],
          i['name'],
          i['desc'],
          i['image'],
          double.parse(i['price']),
          int.parse(i['disc']),
          int.parse(i['is_active']) == 1,
        ),
      );
    }
  }
}
