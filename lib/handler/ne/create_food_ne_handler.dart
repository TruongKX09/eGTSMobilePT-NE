import 'package:egtspt/api/ne/create_food_ne_api.dart';
import 'package:egtspt/models/ne/create_food_ne_model.dart';

import 'package:flutter/material.dart';

class CreateFoodNEHandler {
  Future<void> cFoodNEBtnClk(context, String name, String ammount,
      String unitOfMesuament, String calories) async {
    // String ptid = await CommonData().getUserID();
    CreateFoodNe createFoodNECommit = await CreateFoodNEAPI()
        .callCreateFoodNE(name, ammount, unitOfMesuament, calories);

    if (200 == createFoodNECommit.code) // success case
    {
      //Them  dialog (noi dung text dialog = accountCommit.message)
      //Icon dialog = thanh cong

      final snackBar = SnackBar(
        content: Text(createFoodNECommit.message ?? ""),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 100,
          left: 10,
          right: 10,
        ),
        action: SnackBarAction(
          label: 'Đóng',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      // Dialog fail (noi dung text dialog = accountCommit.message)
      final snackBar = SnackBar(
        content: Text(createFoodNECommit.message ?? ""),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 100,
          left: 10,
          right: 10,
        ),
        action: SnackBarAction(
          label: 'Đóng',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
