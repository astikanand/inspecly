import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inspecly/app/modules/home/views/home_screen.dart';
import 'package:inspecly/app/modules/utils/size_config.dart';


void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetMaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme,),
        primaryTextTheme: GoogleFonts.latoTextTheme(Theme.of(context).primaryTextTheme)
      ),
      debugShowCheckedModeBanner: false,
      title: "Inspecly",
      home: HomeScreen()
      // home: ImageUploadScreen()
    );
  }
}
