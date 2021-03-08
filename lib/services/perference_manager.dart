import 'package:mycart/models/addresses/user_addresses.dart';
import 'package:mycart/services/cart_manager.dart';
import 'package:mycart/services/data_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefManager {
  var id = 0;
  var name = "Guest";
  var phone = "";
  var email = "";
  var password = "";
  var lang = 0;
  var pref;
  var selectedAddress = 0;

  PrefManager() {
    //loadDataFromLocalMemory();
  }

  Future<bool> setLoggedInData(
      int id, String name, String phone, String email, String password) async {
    if (pref == null) {
      pref = await SharedPreferences.getInstance();
    }
    this.id = id;
    this.name = name;
    this.phone = phone;
    this.email = email;
    this.password = password;
    pref.setInt("id", id);
    pref.setString("name", name);
    pref.setString("phone", phone);
    pref.setString("email", email);
    pref.setString("password", password);
    print("Saved! - {$id} - {$name} - {$email}");
    return true;
  }

  Future<void> loadDataFromLocalMemory() async {
    if (pref == null) {
      pref = await SharedPreferences.getInstance();
    }
    lang = pref.getInt("lang") ?? lang;
    id = pref.getInt("id") ?? id;
    name = pref.getString("name") ?? name;
    phone = pref.getString("phone") ?? phone;
    email = pref.getString("email") ?? email;
    password = pref.getString("password") ?? password;
    selectedAddress = pref.getInt("address") ?? selectedAddress;
    print(
        "Loaded - {$id} - {$name} - {$email} - {Lang: $lang} - {Add: $selectedAddress}");
  }

  Future<void> saveDataToLocalMemory() async {
    if (pref == null) {
      pref = await SharedPreferences.getInstance();
    }
    pref.setInt("id", id);
    pref.setString("name", name);
    pref.setString("phone", phone);
    pref.setString("email", email);
    pref.setString("password", password);
    pref.setInt("address", selectedAddress);
    print("Saved! - {$id} - {$name} - {$email} - {$selectedAddress}");
  }

  bool setId(int id) {
    this.id = id;
    return true;
  }

  bool setName(String name) {
    this.name = name;
    return true;
  }

  bool setPhone(String phone) {
    this.phone = phone;
    return true;
  }

  bool setEmail(String email) {
    this.email = email;
    return true;
  }

  bool setPassword(String password) {
    this.password = password;
    return true;
  }

  int getId() {
    return id;
  }

  String getName() {
    return name;
  }

  String getPhone() {
    return phone;
  }

  String getEmail() {
    return email;
  }

  bool isLoggedIn() {
    if (id != 0) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> logOut() async {
    this.id = 0;
    if (pref == null) {
      pref = await SharedPreferences.getInstance();
    }
    pref.setInt("id", 0);
    pref.setString("name", "Guest");
    pref.setString("phone", "");
    pref.setString("email", "");
    pref.setString("password", "");
    pref.setInt("address", 0);
  }

  Future<void> setLang(int lang) async {
    if (pref == null) {
      pref = await SharedPreferences.getInstance();
    }
    this.lang = lang;
    pref.setInt("lang", lang);
  }

  int getLang() {
    return this.lang;
  }

  bool isLangSet() {
    return (lang != 0);
  }

  Future<void> setSelectedAddress(int address) async {
    if (pref == null) {
      pref = await SharedPreferences.getInstance();
    }
    this.selectedAddress = address;
    pref.setInt("address", address);
    updateDeliveryFeesAndTime();
  }

  int getSelectedAddress() {
    return this.selectedAddress;
  }

  void updateDeliveryFeesAndTime() {
    if (selectedAddress != 0) {
      for (UserAddressesClass i in DataManager.userAddresses) {
        if (i.id == DataManager.mPrefManager.getSelectedAddress()) {
          CartManager.deliveryFees = i.locationData.deliveryFees;
          CartManager.deliveryTime = i.locationData.deliveryTime;
        }
      }
    } else {
      CartManager.deliveryFees = 0;
      CartManager.deliveryTime = 0;
    }
  }
}
