import 'package:e_commerce/data/models/network_response.dart';
import 'package:e_commerce/data/models/slider_data.dart';
import 'package:e_commerce/data/models/slider_list_model.dart';
import 'package:e_commerce/data/network_caller/network_caller.dart';
import 'package:e_commerce/data/utility/urls.dart';
import 'package:get/get.dart';

class HomeSliderController extends GetxController{
  bool _inProgress = false;
  String _errorMessage = "";
  List<SliderData> _sliderList = [];

  bool get inProgress => _inProgress;
  List<SliderData> get sliderList=>_sliderList;
  String get errorMessage => _errorMessage;

  Future<bool> getSliders () async{
    _inProgress = true;
    bool isSuccess = false;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(url: Urls.homeSlider);
    if(response.isSuccess){
      _sliderList = SliderListModel.fromJson(response.responseData).SliderList ?? [];
    }
    else{
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}