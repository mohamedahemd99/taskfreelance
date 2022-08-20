import 'package:your_app_name/core/model/problems_model.dart';

class DataModel {
  List<Problems>? problems;

  DataModel({this.problems});

  DataModel.fromJson(Map<String, dynamic> json) {
    if (json['problems'] != null) {
      problems = <Problems>[];
      json['problems'].forEach((v) {
        problems!.add(new Problems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.problems != null) {
      data['problems'] = this.problems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}





