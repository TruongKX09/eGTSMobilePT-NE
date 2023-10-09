import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../common_data.dart';
import '../models/user_model.dart';
import '../router.dart';

class AuthenAPI {
  Future<RegisAccount> callRegister(
      phoneNo, password, image, fullname, gender) async {
    try {
      http.Response response = await http.post(
        Uri.parse("$sPreApiUrl/Accounts/CreateAccount"),
        body: jsonEncode({
          'phoneNo': phoneNo,
          'password': password,
          'fullname': fullname,
          'image': image,
          'gender': gender,
          'role': "Gymer"
        }),
        headers: <String, String>{
          'accept': 'text/plain',
          'Content-Type': 'application/json',
        },
      );
      final parsed =
          RegisAccount.fromJson(jsonDecode(response.body.toString()));
      return parsed;
    } catch (e) {
      rethrow;
    }
  }

  Future<LoginAccount> callLogin(phoneNo, password) async {
    try {
      http.Response response = await http.post(
        Uri.parse("$sPreApiUrl/Login/Login"),
        body: jsonEncode({
          'phoneNo': phoneNo,
          'password': password,
        }),
        headers: <String, String>{
          'accept': 'text/plain',
          'Content-Type': 'application/json',
        },
      );
      final parsed =
          LoginAccount.fromJson(jsonDecode(response.body.toString()));
      if (200 == parsed.code) {
        const FlutterSecureStorage().write(key: 'token', value: parsed.token);
        CommonData().setUserID(parsed.data!.id!);
        CommonData().setUserName(parsed.data!.fullname!);
      }

      return parsed;
    } catch (e) {
      rethrow;
    }
  }
}
