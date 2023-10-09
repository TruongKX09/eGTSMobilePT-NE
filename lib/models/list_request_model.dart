class ListRequest {
  int? code;
  String? message;
  List<DataRequest>? dataRequests;

  ListRequest({this.code, this.message, this.dataRequests});

  ListRequest.fromJson(Map<String, dynamic> json) {
    if (json["code"] is int) {
      code = json["code"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["data"] is List) {
      dataRequests = json["data"] == null
          ? null
          : (json["data"] as List).map((e) => DataRequest.fromJson(e)).toList();
    }
  }

  static List<ListRequest> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => ListRequest.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["code"] = code;
    data["message"] = message;
    data["data"] = dataRequests?.map((e) => e.toJson()).toList();
    return data;
  }

  ListRequest copyWith({
    int? code,
    String? message,
    List<DataRequest>? dataRequests,
  }) =>
      ListRequest(
        code: code ?? this.code,
        message: message ?? this.message,
        dataRequests: dataRequests ?? this.dataRequests,
      );
}

class DataRequest {
  String? id;
  String? gymerId;
  String? gymerName;
  String? receiverId;
  String? packageGymerId;
  String? packageGymerName;
  int? numberOfSession;
  bool? isPt;
  dynamic isAccepted;

  DataRequest(
      {this.id,
      this.gymerId,
      this.gymerName,
      this.receiverId,
      this.packageGymerId,
      this.packageGymerName,
      this.numberOfSession,
      this.isPt,
      this.isAccepted});

  DataRequest.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["gymerId"] is String) {
      gymerId = json["gymerId"];
    }
    if (json["gymerName"] is String) {
      gymerName = json["gymerName"];
    }
    if (json["receiverId"] is String) {
      receiverId = json["receiverId"];
    }
    if (json["packageGymerId"] is String) {
      packageGymerId = json["packageGymerId"];
    }
    if (json["packageGymerName"] is String) {
      packageGymerName = json["packageGymerName"];
    }
    if (json["numberOfSession"] is int) {
      numberOfSession = json["numberOfSession"];
    }
    if (json["isPt"] is bool) {
      isPt = json["isPt"];
    }
    isAccepted = json["isAccepted"];
  }

  static List<DataRequest> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => DataRequest.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["gymerId"] = gymerId;
    data["gymerName"] = gymerName;
    data["receiverId"] = receiverId;
    data["packageGymerId"] = packageGymerId;
    data["packageGymerName"] = packageGymerName;
    data["numberOfSession"] = numberOfSession;
    data["isPt"] = isPt;
    data["isAccepted"] = isAccepted;
    return data;
  }

  DataRequest copyWith({
    String? id,
    String? gymerId,
    String? gymerName,
    String? receiverId,
    String? packageGymerId,
    String? packageGymerName,
    int? numberOfSession,
    bool? isPt,
    dynamic isAccepted,
  }) =>
      DataRequest(
        id: id ?? this.id,
        gymerId: gymerId ?? this.gymerId,
        gymerName: gymerName ?? this.gymerName,
        receiverId: receiverId ?? this.receiverId,
        packageGymerId: packageGymerId ?? this.packageGymerId,
        packageGymerName: packageGymerName ?? this.packageGymerName,
        numberOfSession: numberOfSession ?? this.numberOfSession,
        isPt: isPt ?? this.isPt,
        isAccepted: isAccepted ?? this.isAccepted,
      );
}
