import 'dart:convert';

import 'package:egtspt/models/ne/list_food_ne_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../../common_data.dart';
import '../../router.dart';

class ListFoodNEAPI {
  Future<ListFoodNe> fetchListFoodNE() async {
    String? token = await const FlutterSecureStorage().read(key: 'token');
    String sSearchId = await CommonData().getUserID();
    try {
      http.Response response = await http.get(
        Uri.parse(
            "$sPreApiUrl/FoodAndSuppliments/GetFoodAndSupplimentsBYNE/$sSearchId"),
        headers: <String, String>{
          'accept': 'text/plain',
          'Content-Type': 'application/json',
          'token': 'Bearer $token'
        },
      );
      final parsed = ListFoodNe.fromJson(jsonDecode(response.body.toString()));

      return parsed;
    } catch (e) {
      rethrow;
    }
  }
}
