import 'package:e_commerce/prsentation/screens/complete_profile_screen.dart';
import 'package:e_commerce/prsentation/utility/app_colors.dart';
import 'package:e_commerce/prsentation/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../controller/otp_verification_controller.dart';

class OtpVerificationScreen extends StatelessWidget {
  final String email;
  OtpVerificationScreen({Key? key, required this.email}) : super(key: key);

  final controller = Get.put(OtpVerificationController());

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
                  'A 4 digit OTP code has been sent',
                  style: textTheme.subtitle1,
                ),
                SizedBox(
                  height: 24,
                ),
                _buildPinField(context),
                SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.to(() => CompleteProfileScreen());
                  },
                  child: Text('Next'),
                ),
                SizedBox(
                  height: 24,
                ),
                Obx(
                  () => _buildResendCodeMessage(
                    controller.countdown.value,
                    controller.isResendButtonEnabled.value,
                  ),
                ),
                Obx(
                  () => TextButton(
                    onPressed: controller.isResendButtonEnabled.value
                        ? () {
                            controller.resetCountdown();
                            controller.isResendButtonEnabled.value = false;
                            controller.startCountdown();
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
    );
  }
}
