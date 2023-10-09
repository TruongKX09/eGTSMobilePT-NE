class WorkPtSchedule {
  int? code;
  String? message;
  List<DataWorkPT>? dataWorkPTs;

  WorkPtSchedule({this.code, this.message, this.dataWorkPTs});

  WorkPtSchedule.fromJson(Map<String, dynamic> json) {
    if (json["code"] is int) {
      code = json["code"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["data"] is List) {
      dataWorkPTs = json["data"] == null
          ? null
          : (json["data"] as List).map((e) => DataWorkPT.fromJson(e)).toList();
    }
  }

  static List<WorkPtSchedule> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => WorkPtSchedule.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["code"] = code;
    _data["message"] = message;
    if (dataWorkPTs != null) {
      _data["data"] = dataWorkPTs?.map((e) => e.toJson()).toList();
    }
    return _data;
  }

  WorkPtSchedule copyWith({
    int? code,
    String? message,
    List<DataWorkPT>? data,
  }) =>
      WorkPtSchedule(
        code: code ?? this.code,
        message: message ?? this.message,
        dataWorkPTs: data ?? dataWorkPTs,
      );
}

class DataWorkPT {
  String? id;
  String? gymerId;
  String? gymerName;
  String? from;
  String? to;
  List<Excercises>? excercises;

  DataWorkPT(
      {this.id,
      this.gymerId,
      this.gymerName,
      this.from,
      this.to,
      this.excercises});

  DataWorkPT.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["gymerID"] is String) {
      gymerId = json["gymerID"];
    }
    if (json["gymerName"] is String) {
      gymerName = json["gymerName"];
    }
    if (json["from"] is String) {
      from = json["from"];
    }
    if (json["to"] is String) {
      to = json["to"];
    }
    if (json["excercises"] is List) {
      excercises = json["excercises"] == null
          ? null
          : (json["excercises"] as List)
              .map((e) => Excercises.fromJson(e))
              .toList();
    }
  }

  static List<DataWorkPT> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => DataWorkPT.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["gymerID"] = gymerId;
    _data["gymerName"] = gymerName;
    _data["from"] = from;
    _data["to"] = to;
    if (excercises != null) {
      _data["excercises"] = excercises?.map((e) => e.toJson()).toList();
    }
    return _data;
  }

  DataWorkPT copyWith({
    String? id,
    String? gymerId,
    String? gymerName,
    String? from,
    String? to,
    List<Excercises>? excercises,
  }) =>
      DataWorkPT(
        id: id ?? this.id,
        gymerId: gymerId ?? this.gymerId,
        gymerName: gymerName ?? this.gymerName,
        from: from ?? this.from,
        to: to ?? this.to,
        excercises: excercises ?? this.excercises,
      );
}

class Excercises {
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

  Excercises(
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

  Excercises.fromJson(Map<String, dynamic> json) {
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

  static List<Excercises> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Excercises.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["ptid"] = ptid;
    _data["name"] = name;
    _data["description"] = description;
    _data["video"] = video;
    _data["calorieCumsumption"] = calorieCumsumption;
    _data["repTime"] = repTime;
    _data["unitOfMeasurement"] = unitOfMeasurement;
    _data["createDate"] = createDate;
    _data["isDelete"] = isDelete;
    return _data;
  }

  Excercises copyWith({
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
      Excercises(
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
