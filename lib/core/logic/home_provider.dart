import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:your_app_name/core/model/associat_drug_model.dart';
import 'package:your_app_name/core/model/data_model.dart';

class HomeProvider with ChangeNotifier {
  DataModel? dataModel;
  List<AssociatedDrug>? associatedDrugList;

  void getData() {
    associatedDrugList = [];
    http
        .get(
      Uri.parse("https://run.mocky.io/v3/c882ff79-911c-4ac5-87f7-cfe2e21ab188"),
    )
        .then((response) {
      final model = json.decode(response.body);
      dataModel = DataModel.fromJson(model);
      notifyListeners();

      dataModel!.problems![0].diabetes![0].medications![0]
          .medicationsClasses![0].className![0].associatedDrug!
          .forEach((element) {
        associatedDrugList!.add(element);
      });
      dataModel!.problems![0].diabetes![0].medications![0]
          .medicationsClasses![0].className![0].associatedDrug2!
          .forEach((element) {
        associatedDrugList!.add(element);
      });
      dataModel!.problems![0].diabetes![0].medications![0]
          .medicationsClasses![0].className2![0].associatedDrug!
          .forEach((element) {
        associatedDrugList!.add(element);
      });
      dataModel!.problems![0].diabetes![0].medications![0]
          .medicationsClasses![0].className2![0].associatedDrug2!
          .forEach((element) {
        associatedDrugList!.add(element);
      });
      notifyListeners();
    }).catchError((error) {
      print(error);
      notifyListeners();
    });
  }
}
