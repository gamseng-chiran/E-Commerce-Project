import 'package:e_commerce/data/models/cart_model.dart';
import 'package:e_commerce/data/models/network_response.dart';
import 'package:e_commerce/data/network_caller/network_caller.dart';
import 'package:e_commerce/data/utility/urls.dart';
import 'package:get/get.dart';

class AddToCartController extends GetxController{
  bool _inProgress = false;
  String _errorMessage = '';
  bool get InProgress => _inProgress;
  String get errorMessage => _errorMessage;
  Future<bool> addToCart(CartModel cartModel) async{
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response= await NetworkCaller.postRequest(url: Urls.addToCart,
    body: cartModel.toJson());
    if(response.isSuccess){
      isSuccess = true;
    }
    else{
      _errorMessage = response.errorMessage;
    }
    _inProgress =false;
    update();
    return isSuccess;
  }

  void addToCartController(CartModel cartModel) {}
}