import 'package:e_commerce/prsentation/screens/otp_verification_screen.dart';
import 'package:e_commerce/prsentation/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                SizedBox(height: 100,),
                AppLogo(),
                SizedBox(height: 16,),
                Text('Welcome Back', style: textTheme.headlineLarge,),
                SizedBox(height: 4,),
                Text('Please enter your email address', style: textTheme.headlineSmall,),
                SizedBox(height: 24,),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                  ),
                ),
                SizedBox(height: 16,),
                ElevatedButton(
                  onPressed: () {
                  Get.to(()=>OtpVerificationScreen(email: _emailController.text,));
                }, child: Text('Next'))
              ],
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    super.dispose();
  }
}