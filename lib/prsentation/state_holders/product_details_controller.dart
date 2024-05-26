import 'package:e_commerce/data/models/network_response.dart';
import 'package:e_commerce/data/models/product_details_model.dart';
import 'package:e_commerce/data/models/product_details_wrapper_model.dart';
import 'package:e_commerce/data/network_caller/network_caller.dart';
import 'package:e_commerce/data/utility/urls.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController{
  bool _inProgress = false;
  String _errorMessage = '';

  ProductDetailsModel _productDetailsModel = ProductDetailsModel();

  bool get inProgress => _inProgress;

  ProductDetailsModel get productDetailsModel => _productDetailsModel;
  String get errorMessage => _errorMessage;

  Future<bool> getproductDetails(int productId) async{
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response= await NetworkCaller.getRequest(url: Urls.productDetails(productId));
    if(response.isSuccess){
      if(errorMessage.isNotEmpty){
        _errorMessage = '';
      }
      _productDetailsModel = ProductDetailsWrapperModel.fromJson(response.responseData).productDetails!.first;
      isSuccess = true;
    }
    else{
      _errorMessage = response.errorMessage;
    }
    _inProgress =false;
    update();
    return isSuccess;
  }
}