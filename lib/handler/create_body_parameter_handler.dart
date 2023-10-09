import 'package:flutter/material.dart';

import '../api/create_parameter_api.dart';
import '../models/create_body_parameter_model.dart';

class CreateBodyParameterHandler {
  Future<void> cBodyParameterBtnClk(
      context, gymerID, goal, wei, hei, bone, fat, muscle) async {
    BodyParameter createBodyParameterCommit = await CreateBodyParameterAPI()
        .createBodyParameter(
            context, gymerID, goal, wei, hei, bone, fat, muscle);
    if (200 == createBodyParameterCommit.code) // success case
    {
      final snackBar = SnackBar(
        content: Text(createBodyParameterCommit.message ?? ""),
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
      Navigator.pop(context);
    } else {
      // Dialog fail (noi dung text dialog = accountCommit.message)
      final snackBar = SnackBar(
        content: Text(createBodyParameterCommit.message ?? ""),
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
      Navigator.pop(context);
    }
  }
}
