import 'package:your_app_name/core/model/diabetes_model.dart';

class Problems {
  List<Diabetes>? diabetes;

  Problems({this.diabetes});

  Problems.fromJson(Map<String, dynamic> json) {
    if (json['Diabetes'] != null) {
      diabetes = <Diabetes>[];
      json['Diabetes'].forEach((v) {
        diabetes!.add(new Diabetes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.diabetes != null) {
      data['Diabetes'] = this.diabetes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

