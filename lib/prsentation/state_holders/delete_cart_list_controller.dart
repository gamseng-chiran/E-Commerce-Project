import 'package:e_commerce/data/models/network_response.dart';
import 'package:e_commerce/data/network_caller/network_caller.dart';
import 'package:e_commerce/data/utility/urls.dart';
import 'package:get/get.dart';

class DeleteCartListController extends GetxController {
  bool _deleteInProgress = false;
  String _errorMessage = '';
  bool _isSuccess = false;

  bool get deleteInProgress => _deleteInProgress;
  String get errorMessage => _errorMessage;
  bool get isSuccess => _isSuccess;

  Future<bool> deleteCartItem(String productId) async {
    _deleteInProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller.deleteRequest(url: Urls.deleteCartItem(productId));
    if (response.isSuccess) {
      _isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    _deleteInProgress = false;
    update();
    return _isSuccess;
  }
}