class PTCreateSessionResultModel {
  int? code;
  String? message;
  DataSessionResult? dataSessionResult;

  PTCreateSessionResultModel({this.code, this.message, this.dataSessionResult});

  PTCreateSessionResultModel.fromJson(Map<String, dynamic> json) {
    if (json["code"] is int) {
      code = json["code"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["data"] is Map) {
      dataSessionResult = json["data"] == null
          ? null
          : DataSessionResult.fromJson(json["data"]);
    }
  }

  static List<PTCreateSessionResultModel> fromList(
      List<Map<String, dynamic>> list) {
    return list.map((map) => PTCreateSessionResultModel.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["code"] = code;
    _data["message"] = message;
    if (dataSessionResult != null) {
      _data["data"] = dataSessionResult?.toJson();
    }
    return _data;
  }

  PTCreateSessionResultModel copyWith({
    int? code,
    String? message,
    DataSessionResult? data,
  }) =>
      PTCreateSessionResultModel(
        code: code ?? this.code,
        message: message ?? this.message,
        dataSessionResult: data ?? dataSessionResult,
      );
}

class DataSessionResult {
  String? sessionId;
  int? caloConsump;
  String? note;

  DataSessionResult({this.sessionId, this.caloConsump, this.note});

  DataSessionResult.fromJson(Map<String, dynamic> json) {
    if (json["sessionId"] is String) {
      sessionId = json["sessionId"];
    }
    if (json["caloConsump"] is int) {
      caloConsump = json["caloConsump"];
    }
    if (json["note"] is String) {
      note = json["note"];
    }
  }

  static List<DataSessionResult> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => DataSessionResult.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["sessionId"] = sessionId;
    _data["caloConsump"] = caloConsump;
    _data["note"] = note;
    return _data;
  }

  DataSessionResult copyWith({
    String? sessionId,
    int? caloConsump,
    String? note,
  }) =>
      DataSessionResult(
        sessionId: sessionId ?? this.sessionId,
        caloConsump: caloConsump ?? this.caloConsump,
        note: note ?? this.note,
      );
}
