

import 'package:e_commerce/data/models/create_review_model.dart';
import 'package:e_commerce/data/models/network_response.dart';
import 'package:e_commerce/data/network_caller/network_caller.dart';
import 'package:e_commerce/data/utility/urls.dart';
import 'package:get/get.dart';

class AddReviewController extends GetxController{
  bool _fetchInProgress = false;
  String _errorMessage = '';
  List<ReviewModel> _reviews = [];

  bool get fetchInProgress => _fetchInProgress;
  String get errorMessage => _errorMessage;
  List<ReviewModel> get reviews => _reviews;

  Future<bool> fetchReviews(String productId) async {
    _fetchInProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller.getRequest(url: Urls.listReviewByProduct(productId));
    if (response.isSuccess) {
      List<dynamic> body = response.responseData;
      _reviews = body.map((dynamic item) => ReviewModel.fromJson(item)).toList();
      _fetchInProgress = false;
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage ?? 'Unknown error';
      _fetchInProgress = false;
      update();
      return false;
    }
  }
}