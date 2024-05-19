import 'package:e_commerce/controller_binder.dart';
import 'package:e_commerce/prsentation/screens/splash_screen.dart';
import 'package:e_commerce/prsentation/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class CraftyBay extends StatefulWidget {
  const CraftyBay({super.key});
  static GlobalKey<NavigatorState> navigationKey= GlobalKey<NavigatorState>();
  @override
  State<CraftyBay> createState() => _CraftyBayState();
}

class _CraftyBayState extends State<CraftyBay> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: CraftyBay.navigationKey,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      initialBinding: ControllerBinder(),
      theme: ThemeData(
          colorSchemeSeed: AppColors.primaryColor,
          progressIndicatorTheme:
              ProgressIndicatorThemeData(color: AppColors.primaryColor),
              appBarTheme: const AppBarTheme(
                color: Colors.white,
                foregroundColor: Colors.black
              ),
          textTheme: _textTheme(),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: AppColors.primaryColor
            )
          ),
          inputDecorationTheme: _inputDecorationTheme(),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                fixedSize: Size.fromWidth(double.maxFinite),
                padding: EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)
                ),
                backgroundColor: AppColors.primaryColor,
                foregroundColor: Colors.white,
                textStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16
                )
              ),
          )),
    );
  }

  TextTheme _textTheme() => TextTheme(
      headlineLarge: TextStyle(
          fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
      headlineSmall: TextStyle(fontSize: 16, color: Colors.blueGrey));
  InputDecorationTheme _inputDecorationTheme() => InputDecorationTheme(
    hintStyle: TextStyle(
      fontWeight: FontWeight.w400,
      color: Colors.grey
    ),
      border: _outlineInputBorder,
      enabledBorder: _outlineInputBorder,
      focusedBorder: _outlineInputBorder,
      errorBorder: _outlineInputBorder.copyWith(
          borderSide: BorderSide(color: Colors.red)),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8));
  final OutlineInputBorder _outlineInputBorder =
      OutlineInputBorder(borderSide: BorderSide(color: AppColors.primaryColor));
}
