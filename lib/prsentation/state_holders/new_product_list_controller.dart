import 'package:e_commerce/data/models/product_list_by_category_model.dart';
import 'package:e_commerce/data/models/product_model.dart';
import 'package:e_commerce/data/network_caller/network_caller.dart';
import 'package:e_commerce/data/utility/urls.dart';
import 'package:get/get.dart';

import '../../data/models/network_response.dart';

class NewProductListController extends GetxController{
  bool _inProgress = false;
  String __errorMessage = '';

  List<Product> _productList = [];
  bool get newProductInProgress => _inProgress;

  List<Product> get productList => _productList;
  String get errorMessage => __errorMessage;

  Future<bool> getNewProductList() async{
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response= await NetworkCaller.getRequest(url: Urls.productListByRemark('New'));
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