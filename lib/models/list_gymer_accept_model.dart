class ListGymerAccept {
  int? code;
  String? message;
  List<DataGymerAccept>? dataGymerAccepts;

  ListGymerAccept({this.code, this.message, this.dataGymerAccepts});

  ListGymerAccept.fromJson(Map<String, dynamic> json) {
    if (json["code"] is int) {
      code = json["code"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["data"] is List) {
      dataGymerAccepts = json["data"] == null
          ? null
          : (json["data"] as List)
              .map((e) => DataGymerAccept.fromJson(e))
              .toList();
    }
  }

  static List<ListGymerAccept> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => ListGymerAccept.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["code"] = code;
    _data["message"] = message;
    if (dataGymerAccepts != null) {
      _data["data"] = dataGymerAccepts?.map((e) => e.toJson()).toList();
    }
    return _data;
  }

  ListGymerAccept copyWith({
    int? code,
    String? message,
    List<DataGymerAccept>? data,
  }) =>
      ListGymerAccept(
        code: code ?? this.code,
        message: message ?? this.message,
        dataGymerAccepts: data ?? dataGymerAccepts,
      );
}

class DataGymerAccept {
  String? gymerId;
  String? gymerName;
  List<GymerPackages>? gymerPackages;

  DataGymerAccept({this.gymerId, this.gymerName, this.gymerPackages});

  DataGymerAccept.fromJson(Map<String, dynamic> json) {
    if (json["gymerId"] is String) {
      gymerId = json["gymerId"];
    }
    if (json["gymerName"] is String) {
      gymerName = json["gymerName"];
    }
    if (json["gymerPackages"] is List) {
      gymerPackages = json["gymerPackages"] == null
          ? null
          : (json["gymerPackages"] as List)
              .map((e) => GymerPackages.fromJson(e))
              .toList();
    }
  }

  static List<DataGymerAccept> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => DataGymerAccept.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["gymerId"] = gymerId;
    _data["gymerName"] = gymerName;
    if (gymerPackages != null) {
      _data["gymerPackages"] = gymerPackages?.map((e) => e.toJson()).toList();
    }
    return _data;
  }

  DataGymerAccept copyWith({
    String? gymerId,
    String? gymerName,
    List<GymerPackages>? gymerPackages,
  }) =>
      DataGymerAccept(
        gymerId: gymerId ?? this.gymerId,
        gymerName: gymerName ?? this.gymerName,
        gymerPackages: gymerPackages ?? this.gymerPackages,
      );
}

class GymerPackages {
  String? packageGymerId;
  String? packageName;
  String? from;
  String? status;
  int? numberOfSession;
  bool? isUpdate;

  GymerPackages(
      {this.packageGymerId,
      this.packageName,
      this.from,
      this.status,
      this.numberOfSession,
      this.isUpdate});

  GymerPackages.fromJson(Map<String, dynamic> json) {
    if (json["packageGymerId"] is String) {
      packageGymerId = json["packageGymerId"];
    }
    if (json["packageName"] is String) {
      packageName = json["packageName"];
    }
    if (json["from"] is String) {
      from = json["from"];
    }
    if (json["status"] is String) {
      status = json["status"];
    }
    if (json["numberOfSession"] is int) {
      numberOfSession = json["numberOfSession"];
    }
    if (json["isUpdate"] is bool) {
      isUpdate = json["isUpdate"];
    }
  }

  static List<GymerPackages> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => GymerPackages.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["packageGymerId"] = packageGymerId;
    data["packageName"] = packageName;
    data["from"] = from;
    data["status"] = status;
    data["numberOfSession"] = numberOfSession;
    data["isUpdate"] = isUpdate;
    return data;
  }

  GymerPackages copyWith({
    String? packageGymerId,
    String? packageName,
    String? from,
    String? status,
    int? numberOfSession,
    bool? isUpdate,
  }) =>
      GymerPackages(
        packageGymerId: packageGymerId ?? this.packageGymerId,
        packageName: packageName ?? this.packageName,
        from: from ?? this.from,
        status: status ?? this.status,
        numberOfSession: numberOfSession ?? this.numberOfSession,
        isUpdate: isUpdate ?? this.isUpdate,
      );
}
