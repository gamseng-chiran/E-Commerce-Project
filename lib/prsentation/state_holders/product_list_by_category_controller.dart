import 'package:e_commerce/data/models/product_model.dart';
import 'package:e_commerce/data/network_caller/network_caller.dart';
import 'package:e_commerce/data/utility/urls.dart';
import 'package:get/get.dart';

import '../../data/models/network_response.dart';
import '../../data/models/product_list_by_category_model.dart';

class ProductListByCategoryController extends GetxController{
  bool _inProgress = false;
  String _errorMessage = "";
  List<Product> _productList = [];

  bool get inProgress => _inProgress;
  List<Product> get productList=>_productList;
  String get errorMessage => _errorMessage;

  Future<bool> getProductList (int categoryId) async{
    _inProgress = true;
    bool isSuccess = false;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(url: Urls.productListByCategory(categoryId));
    if(response.isSuccess){
      _productList = ProductListModel.fromJson(response.responseData).productList ?? [];
    }
    else{
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}