import 'dart:convert';

import 'package:egtspt/models/ne/showmenu_bypackagegymer_model.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../../router.dart';

class ShowMenuByPkGymerAPI {
  Future<ShowMenuByPackageGymerModel> fetchShowMenuByPkGymerAPI(
      String packageGymer, date, mealTime) async {
    String? token = await const FlutterSecureStorage().read(key: 'token');

    try {
      http.Response response = await http.get(
        Uri.parse(
            "$sPreApiUrl/NutritionSchedules/GetMealByPackageGymerIDAndDateAndMealTime/$packageGymer?date=$date&MealTime=$mealTime"),
        headers: <String, String>{
          'accept': 'text/plain',
          'Content-Type': 'application/json',
          'token': 'Bearer $token'
        },
      );

      final parsed = ShowMenuByPackageGymerModel.fromJson(
          jsonDecode(response.body.toString()));
      return parsed;
    } catch (e) {
      rethrow;
    }
  }
}
