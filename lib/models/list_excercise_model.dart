class ListExcercisePt {
  int? code;
  String? message;
  List<DataExcercisePt>? dataExcercisePTs;

  ListExcercisePt({this.code, this.message, this.dataExcercisePTs});

  ListExcercisePt.fromJson(Map<String, dynamic> json) {
    if (json["code"] is int) {
      code = json["code"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["data"] is List) {
      dataExcercisePTs = json["data"] == null
          ? null
          : (json["data"] as List)
              .map((e) => DataExcercisePt.fromJson(e))
              .toList();
    }
  }

  static List<ListExcercisePt> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => ListExcercisePt.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["code"] = code;
    data["message"] = message;
    data["data"] = dataExcercisePTs?.map((e) => e.toJson()).toList();
    return data;
  }

  ListExcercisePt copyWith({
    int? code,
    String? message,
    List<DataExcercisePt>? dataExcercisePTs,
  }) =>
      ListExcercisePt(
        code: code ?? this.code,
        message: message ?? this.message,
        dataExcercisePTs: dataExcercisePTs ?? this.dataExcercisePTs,
      );
}

class DataExcercisePt {
  String? id;
  String? ptid;
  String? name;
  String? description;
  String? video;
  int? calorieCumsumption;
  int? repTime;
  String? unitOfMeasurement;
  String? createDate;
  bool? isDelete;

  DataExcercisePt(
      {this.id,
      this.ptid,
      this.name,
      this.description,
      this.video,
      this.calorieCumsumption,
      this.repTime,
      this.unitOfMeasurement,
      this.createDate,
      this.isDelete});

  DataExcercisePt.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["ptid"] is String) {
      ptid = json["ptid"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["video"] is String) {
      video = json["video"];
    }
    if (json["calorieCumsumption"] is int) {
      calorieCumsumption = json["calorieCumsumption"];
    }
    if (json["repTime"] is int) {
      repTime = json["repTime"];
    }
    if (json["unitOfMeasurement"] is String) {
      unitOfMeasurement = json["unitOfMeasurement"];
    }
    if (json["createDate"] is String) {
      createDate = json["createDate"];
    }
    if (json["isDelete"] is bool) {
      isDelete = json["isDelete"];
    }
  }

  static List<DataExcercisePt> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => DataExcercisePt.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["ptid"] = ptid;
    data["name"] = name;
    data["description"] = description;
    data["video"] = video;
    data["calorieCumsumption"] = calorieCumsumption;
    data["repTime"] = repTime;
    data["unitOfMeasurement"] = unitOfMeasurement;
    data["createDate"] = createDate;
    data["isDelete"] = isDelete;
    return data;
  }

  DataExcercisePt copyWith({
    String? id,
    String? ptid,
    String? name,
    String? description,
    String? video,
    int? calorieCumsumption,
    int? repTime,
    String? unitOfMeasurement,
    String? createDate,
    bool? isDelete,
  }) =>
      DataExcercisePt(
        id: id ?? this.id,
        ptid: ptid ?? this.ptid,
        name: name ?? this.name,
        description: description ?? this.description,
        video: video ?? this.video,
        calorieCumsumption: calorieCumsumption ?? this.calorieCumsumption,
        repTime: repTime ?? this.repTime,
        unitOfMeasurement: unitOfMeasurement ?? this.unitOfMeasurement,
        createDate: createDate ?? this.createDate,
        isDelete: isDelete ?? this.isDelete,
      );
}
