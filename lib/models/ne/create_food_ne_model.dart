class CreateFoodNe {
  int? code;
  String? message;
  DataCreateFood? dataCreateFood;

  CreateFoodNe({this.code, this.message, this.dataCreateFood});

  CreateFoodNe.fromJson(Map<String, dynamic> json) {
    if (json["code"] is int) {
      code = json["code"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["data"] is Map) {
      dataCreateFood =
          json["data"] == null ? null : DataCreateFood.fromJson(json["data"]);
    }
  }

  static List<CreateFoodNe> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => CreateFoodNe.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["code"] = code;
    data["message"] = message;
    data["data"] = dataCreateFood;
    return data;
  }

  CreateFoodNe copyWith({
    int? code,
    String? message,
    DataCreateFood? dataCreateFood,
  }) =>
      CreateFoodNe(
        code: code ?? this.code,
        message: message ?? this.message,
        dataCreateFood: dataCreateFood ?? this.dataCreateFood,
      );
}

class DataCreateFood {
  String? neid;
  String? name;
  int? ammount;
  String? unitOfMesuament;
  int? calories;

  DataCreateFood(
      {this.neid,
      this.name,
      this.ammount,
      this.unitOfMesuament,
      this.calories});

  DataCreateFood.fromJson(Map<String, dynamic> json) {
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
  }

  static List<DataCreateFood> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => DataCreateFood.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["neid"] = neid;
    data["name"] = name;
    data["ammount"] = ammount;
    data["unitOfMesuament"] = unitOfMesuament;
    data["calories"] = calories;
    return data;
  }

  DataCreateFood copyWith({
    String? neid,
    String? name,
    int? ammount,
    String? unitOfMesuament,
    int? calories,
  }) =>
      DataCreateFood(
        neid: neid ?? this.neid,
        name: name ?? this.name,
        ammount: ammount ?? this.ammount,
        unitOfMesuament: unitOfMesuament ?? this.unitOfMesuament,
        calories: calories ?? this.calories,
      );
}
