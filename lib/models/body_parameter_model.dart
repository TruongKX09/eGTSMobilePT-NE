class BodyParameter {
  int? code;
  String? message;
  List<DataBodyParameter>? dataBodyParameters;

  BodyParameter({this.code, this.message, this.dataBodyParameters});

  BodyParameter.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      dataBodyParameters = <DataBodyParameter>[];
      json['data'].forEach((v) {
        dataBodyParameters!.add(DataBodyParameter.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (dataBodyParameters != null) {
      data['data'] = dataBodyParameters!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataBodyParameter {
  String? id;
  String? gymerId;
  String? goal;
  int? weight;
  int? height;
  double? bmi;
  int? bone;
  int? fat;
  int? muscle;
  String? createDate;
  bool? isDelete;

  DataBodyParameter(
      {this.id,
      this.gymerId,
      this.goal,
      this.weight,
      this.height,
      this.bmi,
      this.bone,
      this.fat,
      this.muscle,
      this.createDate,
      this.isDelete});

  DataBodyParameter.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gymerId = json['gymerId'];
    goal = json['goal'];
    weight = json['weight'];
    height = json['height'];
    bmi = json['bmi'];
    bone = json['bone'];
    fat = json['fat'];
    muscle = json['muscle'];
    createDate = json['createDate'];
    isDelete = json['isDelete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['gymerId'] = gymerId;
    data['goal'] = goal;
    data['weight'] = weight;
    data['height'] = height;
    data['bmi'] = bmi;
    data['bone'] = bone;
    data['fat'] = fat;
    data['muscle'] = muscle;
    data['createDate'] = createDate;
    data['isDelete'] = isDelete;
    return data;
  }
}
