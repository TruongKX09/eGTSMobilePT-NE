class CreateExcercise {
  int? code;
  String? message;
  DataExcercise? dataCtExcercise;

  CreateExcercise({this.code, this.message, this.dataCtExcercise});

  CreateExcercise.fromJson(Map<String, dynamic> json) {
    if (json["code"] is int) {
      code = json["code"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["data"] is Map) {
      dataCtExcercise =
          json["data"] == null ? null : DataExcercise.fromJson(json["data"]);
    }
  }

  static List<CreateExcercise> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => CreateExcercise.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["code"] = code;
    data["message"] = message;
    data["data"] = dataCtExcercise;
    return data;
  }

  CreateExcercise copyWith({
    int? code,
    String? message,
    DataExcercise? dataCtExcercise,
  }) =>
      CreateExcercise(
        code: code ?? this.code,
        message: message ?? this.message,
        dataCtExcercise: dataCtExcercise ?? this.dataCtExcercise,
      );
}

class DataExcercise {
  String? ptid;
  String? name;
  String? description;
  String? video;
  int? calorieCumsumption;
  int? repTime;
  String? unitOfMeasurement;

  DataExcercise(
      {this.ptid,
      this.name,
      this.description,
      this.video,
      this.calorieCumsumption,
      this.repTime,
      this.unitOfMeasurement});

  DataExcercise.fromJson(Map<String, dynamic> json) {
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
  }

  static List<DataExcercise> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => DataExcercise.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["ptid"] = ptid;
    data["name"] = name;
    data["description"] = description;
    data["video"] = video;
    data["calorieCumsumption"] = calorieCumsumption;
    data["repTime"] = repTime;
    data["unitOfMeasurement"] = unitOfMeasurement;
    return data;
  }

  DataExcercise copyWith({
    String? ptid,
    String? name,
    String? description,
    String? video,
    int? calorieCumsumption,
    int? repTime,
    String? unitOfMeasurement,
  }) =>
      DataExcercise(
        ptid: ptid ?? this.ptid,
        name: name ?? this.name,
        description: description ?? this.description,
        video: video ?? this.video,
        calorieCumsumption: calorieCumsumption ?? this.calorieCumsumption,
        repTime: repTime ?? this.repTime,
        unitOfMeasurement: unitOfMeasurement ?? this.unitOfMeasurement,
      );
}
