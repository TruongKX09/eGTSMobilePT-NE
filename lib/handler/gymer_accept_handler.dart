import 'package:egtspt/api/gymer_accept_api.dart';

import '../models/list_gymer_accept_model.dart';

class ListGymerAcceptHandler {
  Future<ListGymerAccept> onFetchListGymerAccept() async {
    ListGymerAccept advListGymerAccept =
        await GymerAcceptAPI().fetchGymerAccept();

    return advListGymerAccept;
  }
}
