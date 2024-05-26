import 'package:e_commerce/data/models/network_response.dart';
import 'package:e_commerce/data/models/product_list_by_category_model.dart';
import 'package:e_commerce/data/models/product_model.dart';
import 'package:e_commerce/data/network_caller/network_caller.dart';
import 'package:e_commerce/data/utility/urls.dart';
import 'package:get/get.dart';

class PopularProductListController extends GetxController{
  bool _popularProductInProgress = false;
  String __errorMessage = '';

  List<Product> _productList = [];
  bool get popularProductInProgress => _popularProductInProgress;

  List<Product> get productList => _productList;
  String get errorMessage => __errorMessage;

  Future<bool> getPopularProductList() async{
    bool isSuccess = false;
    _popularProductInProgress = true;
    update();
    final NetworkResponse response= await NetworkCaller.getRequest(url: Urls.productListByRemark('Popular'));
    if(response.isSuccess){
      _productList = ProductListModel.fromJson(response.responseData).productList ?? [];
      isSuccess = true;
    }
    else{
      __errorMessage = response.errorMessage;
    }
    _popularProductInProgress =false;
    update();
    return isSuccess;
  }


}