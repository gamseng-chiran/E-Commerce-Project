import 'package:e_commerce/data/models/create_profile_model.dart';
import 'package:e_commerce/data/models/network_response.dart';
import 'package:e_commerce/data/network_caller/network_caller.dart';
import 'package:e_commerce/data/utility/urls.dart';
import 'package:get/get.dart';

class CompleteProfileController extends GetxController{
  bool _inProgress = false;
  String _errorMessage = '';

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  Future<bool> createProfile(CreateProfileModel profileModel) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.postRequest(
      url: Urls.createProfile, body: profileModel.toJson()
    );
    if (response.isSuccess) {
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}