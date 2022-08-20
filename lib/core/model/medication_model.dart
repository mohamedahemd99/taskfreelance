import 'package:your_app_name/core/model/medication_classes_model.dart';

class Medications {
  List<MedicationsClasses>? medicationsClasses;

  Medications({this.medicationsClasses});

  Medications.fromJson(Map<String, dynamic> json) {
    if (json['medicationsClasses'] != null) {
      medicationsClasses = <MedicationsClasses>[];
      json['medicationsClasses'].forEach((v) {
        medicationsClasses!.add(new MedicationsClasses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.medicationsClasses != null) {
      data['medicationsClasses'] =
          this.medicationsClasses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
