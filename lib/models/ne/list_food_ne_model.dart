class ListFoodNe {
  int? code;
  String? message;
  List<DataFood>? dataFoods;

  ListFoodNe({this.code, this.message, this.dataFoods});

  ListFoodNe.fromJson(Map<String, dynamic> json) {
    if (json["code"] is int) {
      code = json["code"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["data"] is List) {
      dataFoods = json["data"] == null
          ? null
          : (json["data"] as List).map((e) => DataFood.fromJson(e)).toList();
    }
  }

  static List<ListFoodNe> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => ListFoodNe.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["code"] = code;
    data["message"] = message;
    data["data"] = dataFoods?.map((e) => e.toJson()).toList();
    return data;
  }

  ListFoodNe copyWith({
    int? code,
    String? message,
    List<DataFood>? dataFoods,
  }) =>
      ListFoodNe(
        code: code ?? this.code,
        message: message ?? this.message,
        dataFoods: dataFoods ?? this.dataFoods,
      );
}

class DataFood {
  String? id;
  String? neid;
  String? name;
  int? ammount;
  String? unitOfMesuament;
  int? calories;
  String? createDate;
  bool? isDelete;

  DataFood(
      {this.id,
      this.neid,
      this.name,
      this.ammount,
      this.unitOfMesuament,
      this.calories,
      this.createDate,
      this.isDelete});

  DataFood.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["neid"] is String) {
      neid = json["neid"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["ammount"] is int) {
      ammount = json["ammount"];
    }
    if (json["unitOfMesuament"] is String) {
      unitOfMesuament = json["unitOfMesuament"];
    }
    if (json["calories"] is int) {
      calories = json["calories"];
    }
    if (json["createDate"] is String) {
      createDate = json["createDate"];
    }
    if (json["isDelete"] is bool) {
      isDelete = json["isDelete"];
    }
  }

  static List<DataFood> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => DataFood.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["neid"] = neid;
    data["name"] = name;
    data["ammount"] = ammount;
    data["unitOfMesuament"] = unitOfMesuament;
    data["calories"] = calories;
    data["createDate"] = createDate;
    data["isDelete"] = isDelete;
    return data;
  }

  DataFood copyWith({
    String? id,
    String? neid,
    String? name,
    int? ammount,
    String? unitOfMesuament,
    int? calories,
    String? createDate,
    bool? isDelete,
  }) =>
      DataFood(
        id: id ?? this.id,
        neid: neid ?? this.neid,
        name: name ?? this.name,
        ammount: ammount ?? this.ammount,
        unitOfMesuament: unitOfMesuament ?? this.unitOfMesuament,
        calories: calories ?? this.calories,
        createDate: createDate ?? this.createDate,
        isDelete: isDelete ?? this.isDelete,
      );
}
