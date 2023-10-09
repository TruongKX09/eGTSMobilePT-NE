class ShowPackageFeedBack {
  int? code;
  String? message;
  List<DataPackageFeedBack>? dataPackageFeedBack;

  ShowPackageFeedBack({this.code, this.message, this.dataPackageFeedBack});

  ShowPackageFeedBack.fromJson(Map<String, dynamic> json) {
    if (json["code"] is int) {
      code = json["code"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["data"] is List) {
      dataPackageFeedBack = json["data"] == null
          ? null
          : (json["data"] as List)
              .map((e) => DataPackageFeedBack.fromJson(e))
              .toList();
    }
  }

  static List<ShowPackageFeedBack> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => ShowPackageFeedBack.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["code"] = code;
    _data["message"] = message;
    if (dataPackageFeedBack != null) {
      _data["data"] = dataPackageFeedBack?.map((e) => e.toJson()).toList();
    }
    return _data;
  }

  ShowPackageFeedBack copyWith({
    int? code,
    String? message,
    List<DataPackageFeedBack>? data,
  }) =>
      ShowPackageFeedBack(
        code: code ?? this.code,
        message: message ?? this.message,
        dataPackageFeedBack: data ?? dataPackageFeedBack,
      );
}

class DataPackageFeedBack {
  String? id;
  String? ptidorNeid;
  String? packageGymerId;
  String? packageName;
  String? gymerName;
  String? ptOrNeName;
  int? rate;
  String? feedback1;
  bool? isDelete;

  DataPackageFeedBack(
      {this.id,
      this.ptidorNeid,
      this.packageGymerId,
      this.packageName,
      this.gymerName,
      this.ptOrNeName,
      this.rate,
      this.feedback1,
      this.isDelete});

  DataPackageFeedBack.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["ptidorNeid"] is String) {
      ptidorNeid = json["ptidorNeid"];
    }
    if (json["packageGymerId"] is String) {
      packageGymerId = json["packageGymerId"];
    }
    if (json["packageName"] is String) {
      packageName = json["packageName"];
    }
    if (json["gymerName"] is String) {
      gymerName = json["gymerName"];
    }
    if (json["ptOrNeName"] is String) {
      ptOrNeName = json["ptOrNeName"];
    }
    if (json["rate"] is int) {
      rate = json["rate"];
    }
    if (json["feedback1"] is String) {
      feedback1 = json["feedback1"];
    }
    if (json["isDelete"] is bool) {
      isDelete = json["isDelete"];
    }
  }

  static List<DataPackageFeedBack> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => DataPackageFeedBack.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["ptidorNeid"] = ptidorNeid;
    _data["packageGymerId"] = packageGymerId;
    _data["packageName"] = packageName;
    _data["gymerName"] = gymerName;
    _data["ptOrNeName"] = ptOrNeName;
    _data["rate"] = rate;
    _data["feedback1"] = feedback1;
    _data["isDelete"] = isDelete;
    return _data;
  }

  DataPackageFeedBack copyWith({
    String? id,
    String? ptidorNeid,
    String? packageGymerId,
    String? packageName,
    String? gymerName,
    String? ptOrNeName,
    int? rate,
    String? feedback1,
    bool? isDelete,
  }) =>
      DataPackageFeedBack(
        id: id ?? this.id,
        ptidorNeid: ptidorNeid ?? this.ptidorNeid,
        packageGymerId: packageGymerId ?? this.packageGymerId,
        packageName: packageName ?? this.packageName,
        gymerName: gymerName ?? this.gymerName,
        ptOrNeName: ptOrNeName ?? this.ptOrNeName,
        rate: rate ?? this.rate,
        feedback1: feedback1 ?? this.feedback1,
        isDelete: isDelete ?? this.isDelete,
      );
}
