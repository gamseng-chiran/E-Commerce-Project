import 'package:e_commerce/data/models/create_review_model.dart';
import 'package:e_commerce/data/models/network_response.dart';
import 'package:e_commerce/data/network_caller/network_caller.dart';
import 'package:e_commerce/data/utility/urls.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ReviewListController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';
  List<ReviewModel> _reviews = [];

  bool get inProgress => _inProgress;
  String get errorMessage => _errorMessage;
  List<ReviewModel> get reviews => _reviews;

  Future<bool> fetchReviews(String productId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(url: Urls.listReviewByProduct(productId));
    if (response.isSuccess) {
      List<dynamic> jsonList = response.responseData;
      _reviews = jsonList.map((json) => ReviewModel.fromJson(json)).toList();
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
