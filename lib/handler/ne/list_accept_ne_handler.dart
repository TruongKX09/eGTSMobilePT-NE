import '../../api/ne/list_accept_ne_api.dart';
import '../../models/ne/list_accept_ne_model.dart';

class ListGymerAcceptNEHandler {
  Future<ListGymerAcceptNe> onFetchListGymerAcceptNE() async {
    ListGymerAcceptNe advListGymerAcceptNE =
        await GymerAcceptNEAPI().fetchGymerAcceptNE();
    if (200 == advListGymerAcceptNE.code) {
      return advListGymerAcceptNE;
    }
    return ListGymerAcceptNe();
  }
}
