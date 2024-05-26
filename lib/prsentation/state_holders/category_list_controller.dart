import 'package:e_commerce/data/models/category.dart';
import 'package:e_commerce/data/models/category_list_model.dart';
import 'package:e_commerce/data/models/network_response.dart';
import 'package:e_commerce/data/network_caller/network_caller.dart';
import 'package:e_commerce/data/utility/urls.dart';
import 'package:get/get.dart';

class CategoryListController extends GetxController{
  bool _inProgress = false;
  String _errorMessage = "";
  List<Category> _categoryList = [];

  bool get inProgress => _inProgress;
  List<Category> get categoryList=>_categoryList;
  String get errorMessage => _errorMessage;

  Future<bool> getCategoryList () async{
    _inProgress = true;
    bool isSuccess = false;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(url: Urls.categoryList);
    if(response.isSuccess){
      _categoryList = CategoryListModel.fromJson(response.responseData).categoryList ?? [];
    }
    else{
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}