
import 'package:e_commerce/prsentation/screens/main_bottom_nav_screen.dart';
import 'package:e_commerce/prsentation/state_holders/user_auth_controller.dart';
import 'package:e_commerce/prsentation/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future<void> _moveToNextScreen () async{
    await Future.delayed( Duration(seconds: 2));
    await UserAuthController.getUserToken();
    Get.off(()=> MainBottomNavScreen());
  } 
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _moveToNextScreen();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: const [
            Spacer(),
            AppLogo(),
            Spacer(),
            CircularProgressIndicator(),
            SizedBox(height: 16,),
            Text('1.0.1'),
            SizedBox(height: 16,)
          ],
        ),
      ),
    );
  }
}

