import 'package:egtspt/api/body_parameter_api.dart';
import 'package:egtspt/models/body_parameter_model.dart';

class BodyParameterHandler {
  Future<BodyParameter> onFetchBodyParameter() async {
    BodyParameter advBodyParameter =
        await BodyParameterAPI().fetchBodyParameter();
    if (200 == advBodyParameter.code) {
      return advBodyParameter;
    }
    return BodyParameter();
  }
}
