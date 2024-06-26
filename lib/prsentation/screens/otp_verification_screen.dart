// import 'package:e_commerce/prsentation/screens/complete_profile_screen.dart';
// import 'package:e_commerce/prsentation/state_holders/verify_otp_controller.dart';
// import 'package:e_commerce/prsentation/utility/app_colors.dart';
// import 'package:e_commerce/prsentation/widgets/app_logo.dart';
// import 'package:e_commerce/prsentation/widgets/centered_circular_progress_indicator.dart';
// import 'package:e_commerce/prsentation/widgets/snack_message.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';

// import '../controller/otp_verification_controller.dart';

// class OtpVerificationScreen extends StatefulWidget {
//   final String email;
//   OtpVerificationScreen({Key? key, required this.email}) : super(key: key);

//   @override
//   State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
// }

// class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
//   // final controller = Get.put(OtpVerificationController());
//   TextEditingController _otpController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(24),
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 100,
//                 ),
//                 AppLogo(),
//                 SizedBox(
//                   height: 16,
//                 ),
//                 Text(
//                   'Enter OTP code',
//                   style: textTheme.headline6,
//                 ),
//                 SizedBox(
//                   height: 4,
//                 ),
//                 Text(
//                   'A 6 digit OTP code has been sent',
//                   style: textTheme.subtitle1,
//                 ),
//                 SizedBox(
//                   height: 24,
//                 ),
//                 _buildPinField(context),
//                 SizedBox(
//                   height: 16,
//                 ),
//                 GetBuilder<VerifyOtpController>(
//                   builder: (verifyOtpController) {
//                     if(verifyOtpController.InProgress){
//                       return CenteredCircularProgressIndicator();
//                     }
//                     return ElevatedButton(
//                       onPressed: () async{
//                         final result = await verifyOtpController.verifyOtp(widget.email, _otpController.text);
//                         if(result == true){
//                           // To do 
//                           //If succedd then call another api named "readProfiel"
//                             //Create readProfile controller
//                           //Check if data null or not, if null then move to the complete profile screen, then move to home page
//                             //Create complete profile controller
//                           //Otherwise back to home page
//                           Get.to(() => CompleteProfileScreen());
//                         }
//                         else{
//                           if(mounted){
//                             ShowSnackMessage(context, verifyOtpController.errorMessage);
//                           }
//                         }
//                       },
//                       child: Text('Next'),
//                     );
//                   }
//                 ),
//                 SizedBox(
//                   height: 24,
//                 ),
//                 Obx(
//                   () => _buildResendCodeMessage(
//                     controller.countdown.value,
//                     controller.isResendButtonEnabled.value,
//                   ),
//                 ),
//                 Obx(
//                   () => TextButton(
//                     onPressed: controller.isResendButtonEnabled.value
//                         ? () {
//                             controller.resetCountdown();
//                             controller.isResendButtonEnabled.value = false;
//                             controller.startCountdown();
//                           }
//                         : null,
//                     child: Text('Resend code'),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildResendCodeMessage(int countdown, bool isResendButtonEnabled) {
//     return RichText(
//       text: TextSpan(
//         style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
//         children: [
//           TextSpan(text: 'This code will expire in '),
//           TextSpan(
//             text: '$countdown s',
//             style: TextStyle(color: AppColors.primaryColor),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildPinField(BuildContext context) {
//     return PinCodeTextField(
//       length: 6,
//       obscureText: false,
//       keyboardType: TextInputType.number,
//       animationType: AnimationType.fade,
//       pinTheme: PinTheme(
//         shape: PinCodeFieldShape.box,
//         borderRadius: BorderRadius.circular(5),
//         fieldHeight: 50,
//         fieldWidth: 40,
//         inactiveFillColor: Colors.transparent,
//         selectedFillColor: Colors.white,
//         activeFillColor: Colors.white,
//       ),
//       animationDuration: Duration(milliseconds: 300),
//       enableActiveFill: true,
//       appContext: context,
//     );
//   }
//   @override
//   void dispose() {
//     _otpController.dispose();
//     // TODO: implement dispose
//     super.dispose();
//   }
// }

import 'package:e_commerce/prsentation/screens/complete_profile_screen.dart';
import 'package:e_commerce/prsentation/screens/main_bottom_nav_screen.dart';
import 'package:e_commerce/prsentation/state_holders/complete_profile_controller.dart';
import 'package:e_commerce/prsentation/state_holders/read_profile_controller.dart';
import 'package:e_commerce/prsentation/state_holders/verify_otp_controller.dart';
import 'package:e_commerce/prsentation/utility/app_colors.dart';
import 'package:e_commerce/prsentation/widgets/app_logo.dart';
import 'package:e_commerce/prsentation/widgets/centered_circular_progress_indicator.dart';
import 'package:e_commerce/prsentation/widgets/snack_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../controller/otp_verification_controller.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String email;
  OtpVerificationScreen({Key? key, required this.email}) : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final otpController = Get.put(OtpVerificationController());
  final verifyOtpController = Get.put(VerifyOtpController());
  TextEditingController _otpController = TextEditingController();
  
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
                SizedBox(
                  height: 100,
                ),
                AppLogo(),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Enter OTP code',
                  style: textTheme.headline6,
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  'A 6 digit OTP code has been sent',
                  style: textTheme.subtitle1,
                ),
                SizedBox(
                  height: 24,
                ),
                _buildPinField(context),
                SizedBox(
                  height: 16,
                ),
                GetBuilder<VerifyOtpController>(
                  builder: (verifyOtpController) {
                    if (verifyOtpController.InProgress) {
                      return CenteredCircularProgressIndicator();
                    }
                    return ElevatedButton(
                      onPressed: () async {
                        if (_otpController.text.isNotEmpty) {
                          bool result = await verifyOtpController.verifyOtp(widget.email, _otpController.text);
                          if (result) {
                            // To do 
//                           //If succed then call another api named "readProfiel"
//                             //Create readProfile controller  url: base/ReadProfile  get
//                           //Check if data null or not, if null then move to the complete profile screen, then move to home page
//                             //Create complete profile controller  url: base/CreateProfile  post
//                           //Otherwise back to home page
                            Get.to(() => CompleteProfileScreen());
                          } else {
                            if (mounted) {
                              ShowSnackMessage(context, verifyOtpController.errorMessage);
                            }
                          }
                        } else {
                          ShowSnackMessage(context, 'Please enter the OTP');
                        }
                      },
                      child: Text('Next'),
  //                         onPressed: () async {
  //   if (_otpController.text.isNotEmpty) {
  //     bool result = await verifyOtpController.verifyOtp(widget.email, _otpController.text);
  //     if (result) {
  //       // Fetch the profile
  //       bool profileFetched = await readProfileController.readProfile(widget.email);
  //       if (profileFetched) {
  //         if (readProfileController.profile != null) {
  //           // Check if the profile is complete
  //           if (readProfileController.profile!.isComplete()) {
  //             // Profile is complete, navigate to the home page
  //             Get.to(() => MainBottomNavScreen());
  //           } else {
  //             // Profile is incomplete, navigate to the complete profile screen
  //             Get.to(() => CompleteProfileScreen());
  //           }
  //         } else {
  //           // Profile is null, navigate to the complete profile screen
  //           Get.to(() => CompleteProfileScreen());
  //         }
  //       } else {
  //         if (mounted) {
  //           ShowSnackMessage(context, readProfileController.errorMessage);
  //         }
  //       }
  //     } else {
  //       if (mounted) {
  //         ShowSnackMessage(context, verifyOtpController.errorMessage);
  //       }
  //     }
  //   } else {
  //     ShowSnackMessage(context, 'Please enter the OTP');
  //   }
  // },
  // child: Text('Next'),
                    );
                  }
                ),
                SizedBox(
                  height: 24,
                ),
                Obx(
                  () => _buildResendCodeMessage(
                    otpController.countdown.value,
                    otpController.isResendButtonEnabled.value,
                  ),
                ),
                Obx(
                  () => TextButton(
                    onPressed: otpController.isResendButtonEnabled.value
                        ? () {
                            otpController.resetCountdown();
                            otpController.isResendButtonEnabled.value = false;
                            otpController.startCountdown();
                          }
                        : null,
                    child: Text('Resend code'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildResendCodeMessage(int countdown, bool isResendButtonEnabled) {
    return RichText(
      text: TextSpan(
        style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
        children: [
          TextSpan(text: 'This code will expire in '),
          TextSpan(
            text: '$countdown s',
            style: TextStyle(color: AppColors.primaryColor),
          ),
        ],
      ),
    );
  }

  Widget _buildPinField(BuildContext context) {
    return PinCodeTextField(
      length: 6,
      obscureText: false,
      keyboardType: TextInputType.number,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        inactiveFillColor: Colors.transparent,
        selectedFillColor: Colors.white,
        activeFillColor: Colors.white,
      ),
      animationDuration: Duration(milliseconds: 300),
      enableActiveFill: true,
      appContext: context,
      controller: _otpController,
    );
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }
}

