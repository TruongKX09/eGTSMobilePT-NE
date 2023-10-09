import '../api/show_package_feedback_api.dart';
import '../models/show_package_feedback_model.dart';

class ShowPackageFeedBackHandler {
  Future<ShowPackageFeedBack> showPackageFeedBack(packageGymerID) async {
    ShowPackageFeedBack advpkFeedback =
        await ShowPackageFeedBackAPI().fetchShowPackageFeedBack(packageGymerID);
    if (200 == advpkFeedback.code) {
      return advpkFeedback;
    }
    return ShowPackageFeedBack();
  }
}
