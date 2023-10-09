// class ListGymerAcceptNe {
//   int? code;
//   String? message;
//   List<DataGymerAcceptNe>? dataGymerAcceptNeList;

//   ListGymerAcceptNe({this.code, this.message, this.dataGymerAcceptNeList});

//   ListGymerAcceptNe.fromJson(Map<String, dynamic> json) {
//     if (json["code"] is int) {
//       code = json["code"];
//     }
//     if (json["message"] is String) {
//       message = json["message"];
//     }
//     if (json["data"] is List) {
//       dataGymerAcceptNeList = json["data"] == null
//           ? null
//           : (json["data"] as List)
//               .map((e) => DataGymerAcceptNe.fromJson(e))
//               .toList();
//     }
//   }

//   static List<ListGymerAcceptNe> fromList(List<Map<String, dynamic>> list) {
//     return list.map((map) => ListGymerAcceptNe.fromJson(map)).toList();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data["code"] = code;
//     data["message"] = message;
//     data["data"] = dataGymerAcceptNeList?.map((e) => e.toJson()).toList();
//     return data;
//   }

//   ListGymerAcceptNe copyWith({
//     int? code,
//     String? message,
//     List<DataGymerAcceptNe>? dataGymerAcceptNeList,
//   }) =>
//       ListGymerAcceptNe(
//         code: code ?? this.code,
//         message: message ?? this.message,
//         dataGymerAcceptNeList:
//             dataGymerAcceptNeList ?? this.dataGymerAcceptNeList,
//       );
// }

// class DataGymerAcceptNe {
//   String? gymerId;
//   String? gymerName;
//   String? packageGymerId;
//   String? packageName;

//   DataGymerAcceptNe(
//       {this.gymerId, this.gymerName, this.packageGymerId, this.packageName});

//   DataGymerAcceptNe.fromJson(Map<String, dynamic> json) {
//     if (json["gymerId"] is String) {
//       gymerId = json["gymerId"];
//     }
//     if (json["gymerName"] is String) {
//       gymerName = json["gymerName"];
//     }
//     if (json["packageGymerId"] is String) {
//       packageGymerId = json["packageGymerId"];
//     }
//     if (json["packageName"] is String) {
//       packageName = json["packageName"];
//     }
//   }

//   static List<DataGymerAcceptNe> fromList(List<Map<String, dynamic>> list) {
//     return list.map((map) => DataGymerAcceptNe.fromJson(map)).toList();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data["gymerId"] = gymerId;
//     data["gymerName"] = gymerName;
//     data["packageGymerId"] = packageGymerId;
//     data["packageName"] = packageName;
//     return data;
//   }

//   DataGymerAcceptNe copyWith({
//     String? gymerId,
//     String? gymerName,
//     String? packageGymerId,
//     String? packageName,
//   }) =>
//       DataGymerAcceptNe(
//         gymerId: gymerId ?? this.gymerId,
//         gymerName: gymerName ?? this.gymerName,
//         packageGymerId: packageGymerId ?? this.packageGymerId,
//         packageName: packageName ?? this.packageName,
//       );
// }

class ListGymerAcceptNe {
  int? code;
  String? message;
  List<DataGymerAcceptNe>? dataGymerAcceptNeList;

  ListGymerAcceptNe({this.code, this.message, this.dataGymerAcceptNeList});

  ListGymerAcceptNe.fromJson(Map<String, dynamic> json) {
    if (json["code"] is int) {
      code = json["code"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["data"] is List) {
      dataGymerAcceptNeList = json["data"] == null
          ? null
          : (json["data"] as List)
              .map((e) => DataGymerAcceptNe.fromJson(e))
              .toList();
    }
  }

  static List<ListGymerAcceptNe> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => ListGymerAcceptNe.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["code"] = code;
    _data["message"] = message;
    if (dataGymerAcceptNeList != null) {
      _data["data"] = dataGymerAcceptNeList?.map((e) => e.toJson()).toList();
    }
    return _data;
  }

  ListGymerAcceptNe copyWith({
    int? code,
    String? message,
    List<DataGymerAcceptNe>? data,
  }) =>
      ListGymerAcceptNe(
        code: code ?? this.code,
        message: message ?? this.message,
        dataGymerAcceptNeList: data ?? dataGymerAcceptNeList,
      );
}

class DataGymerAcceptNe {
  String? gymerId;
  String? gymerName;
  List<GymerPackagesNE>? gymerPackages;

  DataGymerAcceptNe({this.gymerId, this.gymerName, this.gymerPackages});

  DataGymerAcceptNe.fromJson(Map<String, dynamic> json) {
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
              .map((e) => GymerPackagesNE.fromJson(e))
              .toList();
    }
  }

  static List<DataGymerAcceptNe> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => DataGymerAcceptNe.fromJson(map)).toList();
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

  DataGymerAcceptNe copyWith({
    String? gymerId,
    String? gymerName,
    List<GymerPackagesNE>? gymerPackages,
  }) =>
      DataGymerAcceptNe(
        gymerId: gymerId ?? this.gymerId,
        gymerName: gymerName ?? this.gymerName,
        gymerPackages: gymerPackages ?? this.gymerPackages,
      );
}

class GymerPackagesNE {
  String? packageGymerId;
  String? packageName;
  String? from;
  String? status;
  dynamic numberOfSession;
  bool? isUpdate;

  GymerPackagesNE(
      {this.packageGymerId,
      this.packageName,
      this.from,
      this.status,
      this.numberOfSession,
      this.isUpdate});

  GymerPackagesNE.fromJson(Map<String, dynamic> json) {
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
    numberOfSession = json["numberOfSession"];
    if (json["isUpdate"] is bool) {
      isUpdate = json["isUpdate"];
    }
  }

  static List<GymerPackagesNE> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => GymerPackagesNE.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["packageGymerId"] = packageGymerId;
    _data["packageName"] = packageName;
    _data["from"] = from;
    _data["status"] = status;
    _data["numberOfSession"] = numberOfSession;
    _data["isUpdate"] = isUpdate;
    return _data;
  }

  GymerPackagesNE copyWith({
    String? packageGymerId,
    String? packageName,
    String? from,
    String? status,
    dynamic numberOfSession,
    bool? isUpdate,
  }) =>
      GymerPackagesNE(
        packageGymerId: packageGymerId ?? this.packageGymerId,
        packageName: packageName ?? this.packageName,
        from: from ?? this.from,
        status: status ?? this.status,
        numberOfSession: numberOfSession ?? this.numberOfSession,
        isUpdate: isUpdate ?? this.isUpdate,
      );
}
