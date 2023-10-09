import 'package:egtspt/api/list_excercise_api.dart';
import 'package:egtspt/models/list_excercise_model.dart';

class ListExcerciseHandler {
  Future<ListExcercisePt> onFetchListExcercise() async {
    ListExcercisePt advListRequest =
        await ListExcerciseAPI().fetchListExcercise();
    if (200 == advListRequest.code) {
      return advListRequest;
    }
    return ListExcercisePt();
  }
}
