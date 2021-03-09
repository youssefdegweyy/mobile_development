import 'package:mycart/models/cart/cart_item.dart';
import 'package:mycart/screens/admin/add_category.dart';
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

  static Future<bool> deleteAddress(addressId) async {
    return await FirebaseManager.deleteAddress(addressId);
  }

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
    DataManager.offersItems = await FirebaseManager.getOffersItems();
  }

  static Future<bool> sendMessage(String messageDetails) async {
    return await FirebaseManager.sendMessage(messageDetails);
  }

  static Future<bool> addCategory(String categoryName) async {
    return await FirebaseManager.addCategory(categoryName).then((value) async {
      await DataManager.iniMainMenuCategories();
    });
  }

  static Future<bool> addLocation(
      String locationName, int locationTime, double locationFees) async {
    return await FirebaseManager.addLocation(
            locationName, locationTime, locationFees)
        .then((value) async {
      await DataManager.iniUserAddresses();
    });
  }

  static Future<bool> addMainMenuItem(String categoryId, String itemName,
      String itemImageURL, int isActive) async {
    return await FirebaseManager.addMainMenuItem(
            categoryId, itemName, itemImageURL, isActive)
        .then((value) async {
      await DataManager.iniMainMenuItems();
    });
  }

  static Future<bool> addSubMenuItem(
      name, price, discount, description, checkBox) async {
    return await FirebaseManager.addSubMenuItem(
        name, price, discount, description, checkBox);
  }
}
