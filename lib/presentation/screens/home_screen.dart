import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_app_name/core/local/cache_helper.dart';
import 'package:your_app_name/core/logic/auth_provider.dart';
import 'package:your_app_name/core/logic/home_provider.dart';
import 'package:your_app_name/core/model/associat_drug_model.dart';
import 'package:your_app_name/presentation/resources/color_manager.dart';
import 'package:your_app_name/presentation/widgets/app_card.dart';
import 'package:your_app_name/presentation/widgets/index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<HomeProvider>(context, listen: false).getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            AppButton(
              color: ColorManager.darkGreen,
              translation: "log out",
              onTap: () {
                Provider.of<AuthProvider>(context, listen: false)
                    .logout(context: context);
              },
            )
          ],
          leading: AppPadding(
            child: AppText(text: CacheHelper.getData(key: "userName")),
          ),
          leadingWidth: 100,
          title: const AppText(text: "Home"),
        ),
        body: ListView.separated(
            itemBuilder: (context, index) => buildMedicineData(
                Provider.of<HomeProvider>(context).associatedDrugList![index]),
            separatorBuilder: (context, index) =>
                const Divider(height: 6, thickness: 5),
            itemCount:
                Provider.of<HomeProvider>(context).associatedDrugList!.length));
  }
}

Widget buildMedicineData(AssociatedDrug? medicine) {
  return AppCard(
    child: AppPadding(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(text: "Name: ${medicine!.name}"),
        AppText(text: "Dose: ${medicine.dose}"),
        AppText(text: "Strength: ${medicine.strength}")
      ],
    )),
  );
}
