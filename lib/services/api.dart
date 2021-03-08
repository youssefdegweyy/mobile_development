import 'package:mycart/services/data_manager.dart';
import 'package:http/http.dart' as http;

const url = "http://freshnfit.lxdev.net/api/api2.php";

class API {
  static Future<String> login(email, password) async {
    var response = await http.post(Uri.dataFromString(url),
        body: {'type': 'login', 'email': '$email', 'password': '$password'});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode != 200) {
      return "Error";
    }
    return response.body;
  }

  static Future<String> register(name, phone, email, password) async {
    var response = await http.post(Uri.dataFromString(url), body: {
      'type': 'register',
      'name': '$name',
      'phone': '$phone',
      'email': '$email',
      'password': '$password'
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode != 200) {
      return "Error";
    }
    return response.body;
  }

  static Future<String> submitAddress(locationId, streetName, buildingNumber,
      floorNumber, apartmentNumber, phoneNumber,
      [isPhoneVerified = 0, addressId = 0]) async {
    var response = await http.post(Uri.dataFromString(url), body: {
      'type': 'submit_address',
      'uid': DataManager.mPrefManager.getId().toString(),
      'address_id': addressId.toString(),
      'location_id': locationId.toString(),
      'street_name': streetName,
      'building_number': buildingNumber,
      'floor_number': floorNumber.toString(),
      'apartment_number': apartmentNumber.toString(),
      'phone_number': phoneNumber.toString(),
      'is_phone_verified': isPhoneVerified.toString(),
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode != 200) {
      return "Error";
    }
    return response.body;
  }

  static Future<String> deleteAddress(addressId) async {
    var response = await http.post(Uri.dataFromString(url), body: {
      'type': 'delete_address',
      'uid': DataManager.mPrefManager.getId().toString(),
      'address_id': addressId.toString(),
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode != 200) {
      return "Error";
    }
    return response.body;
  }

  static Future<String> getUserAddresses() async {
    var response = await http.post(Uri.dataFromString(url), body: {
      'type': 'user_addresses',
      'uid': DataManager.mPrefManager.getId().toString(),
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode != 200) {
      return "Error";
    }
    return response.body;
  }

  static Future<String> getMainMenuCategories() async {
    var response = await http.post(Uri.dataFromString(url), body: {'type': 'main_menu_categories'});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode != 200) {
      return "Error";
    }
    return response.body;
  }

  static Future<String> getMainMenuItems() async {
    var response = await http.post(Uri.dataFromString(url), body: {'type': 'main_menu_items'});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode != 200) {
      return "Error";
    }
    return response.body;
  }

  static Future<String> getSubMenuItems(int id) async {
    var response = await http
        .post(Uri.dataFromString(url), body: {'type': 'sub_menu_items', 'mid': id.toString()});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode != 200) {
      return "Error";
    }
    return response.body;
  }

  static Future<String> getSearchItems(String searchKey) async {
    var response =
        await http.post(Uri.dataFromString(url), body: {'type': 'search_items', 'skey': searchKey});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode != 200) {
      return "Error";
    }
    return response.body;
  }

  static Future<String> getRecentOrders() async {
    var response = await http.post(Uri.dataFromString(url), body: {
      'type': 'recent_orders',
      'uid': DataManager.mPrefManager.getId().toString()
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode != 200) {
      return "Error";
    }
    return response.body;
  }

  static Future<String> placeOrder(String jsonOrder) async {
    var response = await http.post(Uri.dataFromString(url), body: {
      'type': 'place_order',
      'uid': DataManager.mPrefManager.getId().toString(),
      'order': jsonOrder,
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode != 200) {
      return "Error";
    }
    return response.body;
  }

  static Future<String> getRecentOrderItems(int recentOrderId) async {
    var response = await http.post(Uri.dataFromString(url), body: {
      'type': 'recent_order_items',
      'uid': DataManager.mPrefManager.getId().toString(),
      'order_id': recentOrderId.toString(),
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode != 200) {
      return "Error";
    }
    return response.body;
  }

  static Future<String> getOffersItems() async {
    var response = await http.post(Uri.dataFromString(url), body: {'type': 'offers_items'});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode != 200) {
      return "Error";
    }
    return response.body;
  }

  static Future<String> sendMessage(String message) async {
    var response = await http.post(Uri.dataFromString(url), body: {
      'type': 'send_message',
      'uid': DataManager.mPrefManager.getId().toString(),
      'message_details': message,
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode != 200) {
      return "Error";
    }
    return response.body;
  }
}
