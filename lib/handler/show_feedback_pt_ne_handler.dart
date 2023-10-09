import 'package:egtspt/models/show_feedback_model.dart';

import '../api/show_feedback_pt_ne_api.dart';

class ShowPTNEFeedBackHandler {
  Future<ShowFeedBackPtne> showPTNEFeedBack() async {
    ShowFeedBackPtne advPTNEFeedback =
        await ShowPTNEFeedBackAPI().fetchShowPTNEFeedBack();
    if (200 == advPTNEFeedback.code) {
      return advPTNEFeedback;
    }
    return ShowFeedBackPtne();
  }
}
