import 'package:egtspt/api/list_request_api.dart';
import 'package:egtspt/models/list_request_model.dart';

class ListRequestHandler {
  Future<ListRequest> onFetchListRequest() async {
    ListRequest advListRequest = await ListRequestAPI().fetchListRequest();
    return advListRequest;
  }
}
