import 'package:e_commerce/data/models/network_response.dart';
import 'package:e_commerce/data/network_caller/network_caller.dart';
import 'package:e_commerce/data/utility/urls.dart';
import 'package:get/get.dart';

// class AddToWishListController extends GetxController{
//   bool _inProgress = false;
//   String _errorMessage = '';

//   bool get inProgress => _inProgress;

//   String get errorMessage => _errorMessage;

//   Future<bool> addToWishList(int productId) async {
//     bool isSuccess = false;
//     _inProgress = true;
//     update();
//     final NetworkResponse response = await NetworkCaller.getRequest(
//       url: Urls.createWishList(productId),
//     );
//     if (response.isSuccess) {
//       isSuccess = true;
//     } else {
//       _errorMessage = response.errorMessage;
//     }
//     _inProgress = false;
//     update();
//     return isSuccess;
//   }
// }

class AddToWishListController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  Future<bool> addToWishList(int productId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(
      url: Urls.createWishList(productId),
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