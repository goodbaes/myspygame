import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:spygame/ui/startscreen.dart';
import 'package:spygame/ui/theme/customtheme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await MobileAds.instance.initialize();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        child: MyApp(),
        fallbackLocale: Locale('en', 'US'),
        supportedLocales: [
          Locale('en', 'US'),
          Locale('ru'),
        ],
        path: 'assets/lang'),
  );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GetMaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: MyTheam.lightTheme,
        home: StartScreen(),
      ),
    );
  }
}
