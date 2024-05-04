import 'dart:async';

import 'package:e_commerce/prsentation/utility/app_colors.dart';
import 'package:e_commerce/prsentation/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String email;
  const OtpVerificationScreen({super.key, required this.email});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  TextEditingController _OtpControlleer = TextEditingController();
  RxInt _countdown = 120.obs;
  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    const oneSecond = Duration(seconds: 1);
    Timer.periodic(oneSecond, (timer) {
      if (_countdown.value == 0) {
        timer.cancel();
      } else {
        _countdown.value--;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
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
              style: textTheme.headlineLarge,
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              'A 4 digit OTP code has been sent',
              style: textTheme.headlineSmall,
            ),
            SizedBox(
              height: 24,
            ),
            _buildPinField(),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Next'),
            ),
            SizedBox(
              height: 24,
            ),
            Obx(() => _buildResendCodeMessage()),
            TextButton(onPressed: () {}, child: Text('Resend code'))
          ],
        ),
      ),
    );
  }

  Widget _buildResendCodeMessage() {
    return RichText(
      text: TextSpan(
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
          children: [
            TextSpan(text: 'This code will expire in '),
            TextSpan(
              text: '$_countdown s',
              style: TextStyle(color: AppColors.primaryColor),
            ),
          ]),
    );
  }

  Widget _buildPinField() {
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
      controller: _OtpControlleer,
      appContext: context,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _OtpControlleer.dispose();
    super.dispose();
  }
}
