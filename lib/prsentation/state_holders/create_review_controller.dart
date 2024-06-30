import 'package:e_commerce/data/models/create_review_model.dart';
import 'package:e_commerce/data/models/network_response.dart';
import 'package:e_commerce/data/network_caller/network_caller.dart';
import 'package:e_commerce/data/utility/urls.dart';
import 'package:get/get.dart';

class CreateReviewController extends GetxController{
  bool _createInProgress = false;
  String _errorMessage = '';

  bool get createInProgress => _createInProgress;
  String get errorMessage => _errorMessage;

  Future<bool> createReview(String productId, ReviewModel review) async {
    _createInProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller.postRequest(
      url: Urls.createProductReview(productId),
      body: review.toJson(),
    );
    if (response.isSuccess) {
      _createInProgress = false;
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage ?? 'Unknown error';
      _createInProgress = false;
      update();
      return false;
    }
  }
} 