import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/admin_panel.dart';
import 'package:flutter_complete_guide/screens/admin_view_requests.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefManager {
  var username = "Guest";
  var email = "";
  var password = "";
  var phonenumber = "";
  var permission = 0;

  PrefManager() {
    loadDataFromLocalMemory();
  }

  Future<void> loadDataFromLocalMemory() async {
    var pref = await SharedPreferences.getInstance();
    username = pref.getString("username") ?? "Guest";
    email = pref.getString("email") ?? "";
    password = pref.getString("password") ?? "";
    phonenumber = pref.getString("phonenumber") ?? "";
    permission = pref.getInt("prmission") ?? 0;
  }

  Future<void> saveDataToLocalMemory() async {
    var pref = await SharedPreferences.getInstance();
    pref.setString("username", username);
    pref.setString("email", email);
    pref.setString("password", password);
    pref.setString("phonenumber", phonenumber);
    pref.setInt("permission", permission);
  }

  String getUsername() {
    return username;
  }

  String getEmail() {
    return email;
  }

  String getPhoneNumber() {
    return phonenumber;
  }

  int getPermission() {
    return permission;
  }

  bool setUserName(String username) {
    this.username = username;
  }

  bool setEmail(String email) {
    this.email = email;
  }

  bool setPhoneNumber(String phonenumber) {
    this.phonenumber = phonenumber;
  }

  bool setPermission(int permission) {
    this.permission = permission;
  }

  bool setPassword(String password) {
    this.password = password;
  }
}
