import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:newsapp/const/common.dart';
import 'package:newsapp/models/color_adapter.dart';
import 'package:newsapp/models/language_adapter.dart';
import 'package:newsapp/models/site_model.dart';
import 'package:newsapp/screens/home_screen.dart';
import 'package:newsapp/utils/theme_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await Hive.initFlutter("newsapp");
  Hive.registerAdapter(SiteModelAdapter());
  Hive.registerAdapter(LanguageAdapter());
  Hive.registerAdapter(ColorAdapter());
  await Hive.openBox("appdata");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Hive.box("appdata").listenable(),
        builder: (ontext, box, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: commonColor),
              useMaterial3: true,
            ),
            darkTheme: ThemeData(
              useMaterial3: true,
              brightness: Brightness.dark,
              colorScheme: ColorScheme.fromSeed(
                seedColor: commonColor,
                brightness: Brightness.dark,
              ),
            ),
            home: const HomeScreen(),
            themeMode: ThemeStore.getThemeMode(),
          );
        });
  }
}
