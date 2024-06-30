import 'package:e_commerce/data/models/network_response.dart';
import 'package:e_commerce/data/models/profile_model.dart';
import 'package:e_commerce/data/network_caller/network_caller.dart';
import 'package:e_commerce/data/utility/urls.dart';
import 'package:get/get.dart';

class ReadProfileController extends GetxController{
  bool _inProgress = false;
  String _errorMessage = '';
  ProfileModel? _profile;

  bool get inProgress => _inProgress;
  String get errorMessage => _errorMessage;
  ProfileModel? get profile => _profile;

  Future<bool> readProfile(String email) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(url: Urls.readProfile(email));
    if (response.isSuccess) {
      _profile = ProfileModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}