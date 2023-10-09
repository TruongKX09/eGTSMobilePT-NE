class CalendarPt {
  int? code;
  String? message;
  List<DataUpdateCalendar>? dataUpdateCalendar;

  CalendarPt({this.code, this.message, this.dataUpdateCalendar});

  CalendarPt.fromJson(Map<String, dynamic> json) {
    if (json["code"] is int) {
      code = json["code"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["data"] is List) {
      dataUpdateCalendar = json["data"] == null
          ? null
          : (json["data"] as List)
              .map((e) => DataUpdateCalendar.fromJson(e))
              .toList();
    }
  }

  static List<CalendarPt> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => CalendarPt.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["code"] = code;
    data["message"] = message;
    data["data"] = dataUpdateCalendar?.map((e) => e.toJson()).toList();
    return data;
  }

  CalendarPt copyWith({
    int? code,
    String? message,
    List<DataUpdateCalendar>? dataUpdateCalendar,
  }) =>
      CalendarPt(
        code: code ?? this.code,
        message: message ?? this.message,
        dataUpdateCalendar: dataUpdateCalendar ?? this.dataUpdateCalendar,
      );
}

class DataUpdateCalendar {
  String? id;
  String? scheduleId;
  String? date;

  DataUpdateCalendar({this.id, this.scheduleId, this.date});

  DataUpdateCalendar.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["scheduleId"] is String) {
      scheduleId = json["scheduleId"];
    }
    if (json["date"] is String) {
      date = json["date"];
    }
  }

  static List<DataUpdateCalendar> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => DataUpdateCalendar.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["scheduleId"] = scheduleId;
    data["date"] = date;
    return data;
  }

  DataUpdateCalendar copyWith({
    String? id,
    String? scheduleId,
    String? date,
  }) =>
      DataUpdateCalendar(
        id: id ?? this.id,
        scheduleId: scheduleId ?? this.scheduleId,
        date: date ?? this.date,
      );
}
