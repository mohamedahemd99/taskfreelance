import 'package:your_app_name/core/model/laps_model.dart';
import 'package:your_app_name/core/model/medication_model.dart';

class Diabetes {
  List<Medications>? medications;
  List<Labs>? labs;

  Diabetes({this.medications, this.labs});

  Diabetes.fromJson(Map<String, dynamic> json) {
    if (json['medications'] != null) {
      medications = <Medications>[];
      json['medications'].forEach((v) {
        medications!.add(new Medications.fromJson(v));
      });
    }
    if (json['labs'] != null) {
      labs = <Labs>[];
      json['labs'].forEach((v) {
        labs!.add(new Labs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.medications != null) {
      data['medications'] = this.medications!.map((v) => v.toJson()).toList();
    }
    if (this.labs != null) {
      data['labs'] = this.labs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

