import 'package:e_commerce/prsentation/screens/otp_verification_screen.dart';
import 'package:e_commerce/prsentation/state_holders/verify_email_controller.dart';
import 'package:e_commerce/prsentation/utility/constants.dart';
import 'package:e_commerce/prsentation/widgets/app_logo.dart';
import 'package:e_commerce/prsentation/widgets/centered_circular_progress_indicator.dart';
import 'package:e_commerce/prsentation/widgets/snack_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _emailController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
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
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                    ),
                    validator: (String? value) {
                      if(value?.isEmpty ?? true){
                        return 'Please enter your email';
                      }
                      if(Constants.emailValidatorRegExp.hasMatch(value!) == false){
                        return "Enter a valid email address";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16,),
                  GetBuilder<VerifyEmailController>(
                    builder: (verifyEmailController) {
                      if(verifyEmailController.InProgress){
                        return CenteredCircularProgressIndicator();
                      }
                      return ElevatedButton(
                        onPressed: () {
                          if(_formKey.currentState!.validate()){
                            verifyEmailController.verifyEmail(_emailController.text.trim()).then((result) {
                              if(result==true){
                                Get.to(()=>OtpVerificationScreen(email: _emailController.text,));
                              }
                              else{
                                ShowSnackMessage(context, verifyEmailController.errorMessage);
                              }
                            });
                            
                          }
                        
                      }, child: Text('Next'));
                    }
                  )
                ],
              ),
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