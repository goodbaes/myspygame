import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart';
import 'package:spyprj1/data/lists.dart';
import 'package:spyprj1/getx/globalvar.dart';
import 'package:spyprj1/ui/myhomepage.dart';
import 'package:spyprj1/ui/theme/customtheme.dart';

void main() async {
  Get.put(LocationsList());
  Get.put(GlobalVariable());
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        child: MyApp(), supportedLocales: [Locale('ru')], path: 'assets/lang'),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GetMaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: MyTheam.lightTheme,
        home: MyHomePage(),
        //  MyHomePage(),
      ),
    );
  }
}
