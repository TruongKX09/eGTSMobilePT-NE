import 'package:egtspt/models/ne/create_food_ne_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../common_data.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../router.dart';

class CreateFoodNEAPI {
  Future<CreateFoodNe> callCreateFoodNE(
      name, ammount, unitOfMesuament, calories) async {
    String? token = await const FlutterSecureStorage().read(key: 'token');
    String neID = await CommonData().getUserID();

    try {
      http.Response response = await http.post(
        Uri.parse("$sPreApiUrl/FoodAndSuppliments/CreateFoodAndSuppliment"),
        body: jsonEncode({
          'neid': neID,
          'name': name,
          'amount': ammount,
          'unitOfMesuament': unitOfMesuament,
          'calories': calories
        }),
        headers: <String, String>{
          'accept': 'text/plain',
          'Content-Type': 'application/json',
          'token': 'Bearer $token'
        },
      );

      if (response.statusCode == 200) {}

      final parsed =
          CreateFoodNe.fromJson(jsonDecode(response.body.toString()));
      return parsed;
    } catch (e) {
      rethrow;
    }
  }
}
