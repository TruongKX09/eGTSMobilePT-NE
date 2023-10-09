class UpdateSchedule {
  int? code;
  String? message;
  DataUpdateSchedule? dataUpdateSchedule;

  UpdateSchedule({this.code, this.message, this.dataUpdateSchedule});

  UpdateSchedule.fromJson(Map<String, dynamic> json) {
    if (json["code"] is int) {
      code = json["code"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["data"] is Map) {
      dataUpdateSchedule = json["data"] == null
          ? null
          : DataUpdateSchedule.fromJson(json["data"]);
    }
  }

  static List<UpdateSchedule> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => UpdateSchedule.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["code"] = code;
    data["message"] = message;
    data["data"] = dataUpdateSchedule;
    return data;
  }

  UpdateSchedule copyWith({
    int? code,
    String? message,
    DataUpdateSchedule? dataUpdateSchedule,
  }) =>
      UpdateSchedule(
        code: code ?? this.code,
        message: message ?? this.message,
        dataUpdateSchedule: dataUpdateSchedule ?? this.dataUpdateSchedule,
      );
}

class DataUpdateSchedule {
  String? dateTime;
  String? from;
  String? to;
  List<String>? listExcercise;

  DataUpdateSchedule({this.dateTime, this.from, this.to, this.listExcercise});

  DataUpdateSchedule.fromJson(Map<String, dynamic> json) {
    if (json["dateTime"] is String) {
      dateTime = json["dateTime"];
    }
    if (json["from"] is String) {
      from = json["from"];
    }
    if (json["to"] is String) {
      to = json["to"];
    }
    if (json["listExcercise"] is List) {
      listExcercise = json["listExcercise"] == null
          ? null
          : List<String>.from(json["listExcercise"]);
    }
  }

  static List<DataUpdateSchedule> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => DataUpdateSchedule.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["dateTime"] = dateTime;
    data["from"] = from;
    data["to"] = to;
    if (listExcercise != null) {
      data["listExcercise"] = listExcercise;
    }
    return data;
  }

  DataUpdateSchedule copyWith({
    String? dateTime,
    String? from,
    String? to,
    List<String>? listExcercise,
  }) =>
      DataUpdateSchedule(
        dateTime: dateTime ?? this.dateTime,
        from: from ?? this.from,
        to: to ?? this.to,
        listExcercise: listExcercise ?? this.listExcercise,
      );
}
