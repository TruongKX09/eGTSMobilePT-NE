import '../../api/ne/session_result_gymer_api.dart';
import '../../models/ne/session_result_gymer_model.dart';

class NESessionResultHandler {
  Future<NESessionResultModel> onfetSessionResult(sessionId) async {
    NESessionResultModel onfetSessionResult =
        await SessionResultAPI().fetSessionResult(sessionId);
    if (200 == onfetSessionResult.code) {
      return onfetSessionResult;
    }
    return NESessionResultModel();
  }
}
