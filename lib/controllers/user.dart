import 'package:mycart/services/data_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mycart/services/api.dart';
import 'dart:convert' as convert;

class User {
  static Future<bool> login(email, password) async {
    return await API.login(email, password).then((response) {
      if (!response.contains("Error") && response != null) {
        if (convert.jsonDecode(response)["is_valid"] == true) {
          if (convert.jsonDecode(response)["is_email_verified"] == true) {
            return DataManager.mPrefManager.setLoggedInData(
                int.parse(convert.jsonDecode(response)["user_id"]),
                convert.jsonDecode(response)["user_name"],
                convert.jsonDecode(response)["user_phone"],
                email,
                password);
          } else {
            Fluttertoast.showToast(
              msg:
                  "You need to verify your email address, Please check your email inbox.",
              toastLength: Toast.LENGTH_SHORT,
            );
          }
        } else {
          Fluttertoast.showToast(
            msg: "Invalid Email or Password.",
            toastLength: Toast.LENGTH_SHORT,
          );
        }
      } else {
        Fluttertoast.showToast(
          msg: "An error has occurred, please try again later.",
          toastLength: Toast.LENGTH_SHORT,
        );
      }
      return false;
    });
  }

  static Future<bool> register(name, phone, email, password) async {
    return await API.register(name, phone, email, password).then((response) {
      if (!response.contains("Error") && response != null) {
        if (convert.jsonDecode(response)["response_title"] ==
            "registration success") {
          Fluttertoast.showToast(
            msg:
                "Sign Up success, You need to verify your email address, Please check your email inbox.",
            toastLength: Toast.LENGTH_SHORT,
          );
          return true;
        } else if (convert.jsonDecode(response)["response_title"] ==
            "email already exists") {
          Fluttertoast.showToast(
            msg: "This email address is already registered.",
            toastLength: Toast.LENGTH_SHORT,
          );
        } else if (convert.jsonDecode(response)["response_title"] ==
            "phone already exists") {
          Fluttertoast.showToast(
            msg: "This phone number is already registered.",
            toastLength: Toast.LENGTH_SHORT,
          );
        } else {
          Fluttertoast.showToast(
            msg: "Error: " +
                convert.jsonDecode(response)["response_title"].toString(),
            toastLength: Toast.LENGTH_SHORT,
          );
        }
      } else {
        Fluttertoast.showToast(
          msg: "An error has occurred, please try again later.",
          toastLength: Toast.LENGTH_SHORT,
        );
      }
      return false;
    });
  }

  static Future<bool> submitAddress(locationId, streetName, buildingNumber,
      floorNumber, apartmentNumber, phoneNumber,
      [isPhoneVerified = 0, addressId = 0]) async {
    return await API
        .submitAddress(locationId, streetName, buildingNumber, floorNumber,
            apartmentNumber, phoneNumber, isPhoneVerified, addressId)
        .then((response) {
      if (!response.contains("Error") && response != null) {
        if (convert.jsonDecode(response)["response_title"] ==
            "add address success") {
          Fluttertoast.showToast(
            msg: "Address is successfully added.",
            toastLength: Toast.LENGTH_LONG,
          );
          return true;
        } else if (convert.jsonDecode(response)["response_title"] ==
            "update address success") {
          Fluttertoast.showToast(
            msg: "Address is successfully updated.",
            toastLength: Toast.LENGTH_LONG,
          );
          return true;
        } else {
          Fluttertoast.showToast(
            msg: "Error: " +
                convert.jsonDecode(response)["response_title"].toString(),
            toastLength: Toast.LENGTH_SHORT,
          );
        }
      } else {
        Fluttertoast.showToast(
          msg: "An error has occurred, please try again later.",
          toastLength: Toast.LENGTH_SHORT,
        );
      }
      return false;
    });
  }

  static Future<bool> deleteAddress(addressId) async {
    return await API.deleteAddress(addressId).then((response) {
      if (!response.contains("Error") && response != null) {
        if (convert.jsonDecode(response)["response_title"] ==
            "delete address success") {
          if (DataManager.mPrefManager.getSelectedAddress() == addressId) {
            DataManager.mPrefManager.setSelectedAddress(0);
          }
          Fluttertoast.showToast(
            msg: "Address is successfully deleted.",
            toastLength: Toast.LENGTH_LONG,
          );
          return true;
        } else {
          Fluttertoast.showToast(
            msg: "Error: " +
                convert.jsonDecode(response)["response_title"].toString(),
            toastLength: Toast.LENGTH_SHORT,
          );
        }
      } else {
        Fluttertoast.showToast(
          msg: "An error has occurred, please try again later.",
          toastLength: Toast.LENGTH_SHORT,
        );
      }
      return false;
    });
  }

  static Future<bool> sendMessage(message) async {
    return await API.sendMessage(message).then((response) {
      if (!response.contains("Error") && response != null) {
        if (convert.jsonDecode(response)["response_title"] == "message sent") {
          Fluttertoast.showToast(
            msg:
                "We've received your message and we will reply to your email as soon as possible.",
            toastLength: Toast.LENGTH_LONG,
          );
          return true;
        } else {
          Fluttertoast.showToast(
            msg: "Error: " +
                convert.jsonDecode(response)["response_title"].toString(),
            toastLength: Toast.LENGTH_SHORT,
          );
        }
      } else {
        Fluttertoast.showToast(
          msg: "An error has occurred, please try again later.",
          toastLength: Toast.LENGTH_SHORT,
        );
      }
      return false;
    });
  }
}
