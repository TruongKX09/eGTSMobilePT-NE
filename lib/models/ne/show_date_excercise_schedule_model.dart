class ExcerciseScheduleNE {
  int? code;
  String? message;
  List<DataShowDate>? dataShowDate;

  ExcerciseScheduleNE({this.code, this.message, this.dataShowDate});

  ExcerciseScheduleNE.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      dataShowDate = <DataShowDate>[];
      json['data'].forEach((v) {
        dataShowDate!.add(DataShowDate.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (dataShowDate != null) {
      data['data'] = dataShowDate!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataShowDate {
  String? id;
  String? gymerId;
  String? ptid;
  String? packageGymerId;
  String? from;
  String? to;
  bool? isDeleted;

  DataShowDate(
      {this.id,
      this.gymerId,
      this.ptid,
      this.packageGymerId,
      this.from,
      this.to,
      this.isDeleted});

  DataShowDate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gymerId = json['gymerId'];
    ptid = json['ptid'];
    packageGymerId = json['packageGymerId'];
    from = json['from'];
    to = json['to'];
    isDeleted = json['isDeleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['gymerId'] = gymerId;
    data['ptid'] = ptid;
    data['packageGymerId'] = packageGymerId;
    data['from'] = from;
    data['to'] = to;
    data['isDeleted'] = isDeleted;
    return data;
  }
}
