import 'package:e_commerce/data/models/network_response.dart';
import 'package:e_commerce/data/models/product_list_by_category_model.dart';
import 'package:e_commerce/data/models/product_model.dart';
import 'package:e_commerce/data/network_caller/network_caller.dart';
import 'package:e_commerce/data/utility/urls.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SpecialProductListController extends GetxController{
  bool _inProgress = false;
  String __errorMessage = '';

  List<Product> _productList = [];
  bool get specialProductInProgress => _inProgress;

  List<Product> get productList => _productList;
  String get errorMessage => __errorMessage;

  Future<bool> getSpecialProductList() async{
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response= await NetworkCaller.getRequest(url: Urls.productListByRemark('Special'));
    if(response.isSuccess){
      _productList = ProductListModel.fromJson(response.responseData).productList ?? [];
      isSuccess = true;
    }
    else{
      __errorMessage = response.errorMessage;
    }
    _inProgress =false;
    update();
    return isSuccess;
  }
}