import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommonData {
  static List<String> roleAll = [];
  static List<String> rolesPTNE = ['pt', 'ne'];

  double getScreenWidth(context, {double resize = 0}) {
    return MediaQuery.of(context).size.width - resize;
  }

  bool isMatchRolePTNE(String? role) {
    // for (String r in rolesPTNE) {
    //   if (r == role?.toLowerCase()) {
    //     return true;
    //   }
    // }
    // return false;
    return rolesPTNE
        .any((element) => element.toLowerCase() == role?.toLowerCase());
  }

  bool isPT(String? role) {
    return role?.toLowerCase() == 'pt';
  }

  bool isNE(String? role) {
    return role?.toLowerCase() == 'ne';
  }

  bool isMatchDate(String date1, String date2) {
    date1 = date1.substring(0, 10);
    date2 = date2.substring(0, 10);

    return date1 == date2;
  }

  String convertDate(String date2) {
    date2 = date2.substring(0, 10);
    return "${date2}T00:00:00";
  }

  String parsePrice(price) {
    String converted = price.toString().replaceAllMapped(
        RegExp(r"(?<=\d)(?=(\d\d\d)+(?!\d))"), (match) => "${match.group(0)}.");
    return converted;
  }

  Future<bool> setUserID(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("userID", value);
  }

  Future<String> getUserID() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("userID") ?? "000";
  }

  Future<bool> setUserName(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("userName", value);
  }

  Future<String> getUserName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("userName") ?? "000";
  }

  Future<bool> setGymerID(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("gymerID", value);
  }

  Future<String> getGymerID() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("gymerID") ?? "000";
  }

  Future<bool> setGymerName(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("gymerName", value);
  }

  Future<String> getGymerName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("gymerName") ?? "000";
  }

  Future<bool> setGymerAcceptID(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("gymerAcceptID", value);
  }

  Future<String> getGymerAcceptID() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("gymerAcceptID") ?? "000";
  }

  Future<bool> setExcerciseID(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("excerciseID", value);
  }

  Future<String> getExcerciseID() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("excerciseID") ?? "000";
  }

  Future<bool> setRequestID(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("requestID", value);
  }

  Future<String> getRequestID() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("requestID") ?? "000";
  }

  Future<bool> setPackageGymerID(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("packageGymerID", value);
  }

  Future<String> getPackageGymerID() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("packageGymerID") ?? "000";
  }
}
