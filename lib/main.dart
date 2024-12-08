import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:newsapp/const/common.dart';
import 'package:newsapp/models/site_model.dart';
import 'package:newsapp/screens/home_screen.dart';

void main() async {
  runApp(const MyApp());
  await Hive.initFlutter("newsapp");
  await Hive.openBox("appdata");
  Hive.registerAdapter(SiteModelAdapter());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: commonColor),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
