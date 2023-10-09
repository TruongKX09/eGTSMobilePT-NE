import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../common_data.dart';
import '../models/show_gymer_menu_model.dart';
import '../router.dart';

class MenuGymerAPI {
  Future<MenuGymerModel> fetchMenuGymerByDate(String date, mealTime) async {
    String? token = await const FlutterSecureStorage().read(key: 'token');
    String gymerID = await CommonData().getGymerAcceptID();

    try {
      http.Response response = await http.get(
        Uri.parse(
            "$sPreApiUrl/NutritionSchedules/GetMealByGymerIDAndDateAndMealTime/$gymerID?date=$date&MealTime=$mealTime"),
        headers: <String, String>{
          'accept': 'text/plain',
          'Content-Type': 'application/json',
          'token': 'Bearer $token'
        },
      );

      final parsed =
          MenuGymerModel.fromJson(jsonDecode(response.body.toString()));
      return parsed;
    } catch (e) {
      rethrow;
    }
  }
}
