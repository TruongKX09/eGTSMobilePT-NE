class CreateCalendarPt {
  int? code;
  String? message;
  DataCalendar? dataCalendar;

  CreateCalendarPt({this.code, this.message, this.dataCalendar});

  CreateCalendarPt.fromJson(Map<String, dynamic> json) {
    if (json["code"] is int) {
      code = json["code"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["data"] is Map) {
      dataCalendar =
          json["data"] == null ? null : DataCalendar.fromJson(json["data"]);
    }
  }

  static List<CreateCalendarPt> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => CreateCalendarPt.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["code"] = code;
    data["message"] = message;
    data["data"] = dataCalendar;
    return data;
  }

  CreateCalendarPt copyWith({
    int? code,
    String? message,
    DataCalendar? dataCalendar,
  }) =>
      CreateCalendarPt(
        code: code ?? this.code,
        message: message ?? this.message,
        dataCalendar: dataCalendar ?? this.dataCalendar,
      );
}

class DataCalendar {
  String? packageGymerId;
  String? from;
  String? to;
  List<String>? listSession;

  DataCalendar({this.packageGymerId, this.from, this.to, this.listSession});

  DataCalendar.fromJson(Map<String, dynamic> json) {
    if (json["packageGymerID"] is String) {
      packageGymerId = json["packageGymerID"];
    }
    if (json["from"] is String) {
      from = json["from"];
    }
    if (json["to"] is String) {
      to = json["to"];
    }
    if (json["listSession"] is List) {
      listSession = json["listSession"] == null
          ? null
          : List<String>.from(json["listSession"]);
    }
  }

  static List<DataCalendar> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => DataCalendar.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["packageGymerID"] = packageGymerId;
    data["from"] = from;
    data["to"] = to;
    if (listSession != null) {
      data["listSession"] = listSession;
    }
    return data;
  }

  DataCalendar copyWith({
    String? packageGymerId,
    String? from,
    String? to,
    List<String>? listSession,
  }) =>
      DataCalendar(
        packageGymerId: packageGymerId ?? this.packageGymerId,
        from: from ?? this.from,
        to: to ?? this.to,
        listSession: listSession ?? this.listSession,
      );
}
