import 'dart:async';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class OtpVerificationController extends GetxController {
  final countdown = 8.obs;
  final isResendButtonEnabled = false.obs;
  late Timer _timer;

  @override
  void onInit() {
    super.onInit();
    startCountdown();
  }

  void startCountdown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (countdown.value == 0) {
        isResendButtonEnabled.value = true;
        timer.cancel();
      } else {
        countdown.value--;
      }
    });
  }

  void resetCountdown() {
    countdown.value = 8;
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }
}