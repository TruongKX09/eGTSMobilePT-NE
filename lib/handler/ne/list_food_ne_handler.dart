import 'package:egtspt/api/ne/list_food_ne_api.dart';

import 'package:egtspt/models/ne/list_food_ne_model.dart';

class ListFoodNEHandler {
  Future<ListFoodNe> onFetchListRequest() async {
    ListFoodNe advListFoodNE = await ListFoodNEAPI().fetchListFoodNE();
    if (200 == advListFoodNE.code) {
      return advListFoodNE;
    }
    return ListFoodNe();
  }
}
