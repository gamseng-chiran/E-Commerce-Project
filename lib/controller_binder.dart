import 'package:e_commerce/prsentation/state_holders/add_review_controller.dart';
import 'package:e_commerce/prsentation/state_holders/add_to_cart_controller.dart';
import 'package:e_commerce/prsentation/state_holders/add_to_wish_list_controller.dart';
import 'package:e_commerce/prsentation/state_holders/cart_list_controller.dart';
import 'package:e_commerce/prsentation/state_holders/category_list_controller.dart';
import 'package:e_commerce/prsentation/state_holders/complete_profile_controller.dart';
import 'package:e_commerce/prsentation/state_holders/create_review_controller.dart';
import 'package:e_commerce/prsentation/state_holders/delete_cart_list_controller.dart';
import 'package:e_commerce/prsentation/state_holders/home_slider_controller.dart';
import 'package:e_commerce/prsentation/state_holders/main_bottom_nav_bar_controller.dart';
import 'package:e_commerce/prsentation/state_holders/new_product_list_controller.dart';
import 'package:e_commerce/prsentation/state_holders/product_details_controller.dart';
import 'package:e_commerce/prsentation/state_holders/product_list_by_category_controller.dart';
import 'package:e_commerce/prsentation/state_holders/popular_product_list_controller.dart.dart';
import 'package:e_commerce/prsentation/state_holders/read_profile_controller.dart';
import 'package:e_commerce/prsentation/state_holders/review_list_controller.dart';
import 'package:e_commerce/prsentation/state_holders/special_product_list_controller.dart';
import 'package:e_commerce/prsentation/state_holders/user_auth_controller.dart';
import 'package:e_commerce/prsentation/state_holders/verify_email_controller.dart';
import 'package:e_commerce/prsentation/state_holders/verify_otp_controller.dart';
import 'package:e_commerce/prsentation/state_holders/wish_list_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(MainBottomNavBarController());
    Get.put(HomeSliderController());
    Get.put(CategoryListController());
    Get.put(ProductListByCategoryController());
    Get.put(PopularProductListController());
    Get.put(NewProductListController());
    Get.put(SpecialProductListController());
    Get.put(ProductDetailsController());
    Get.put(AddToCartController());
    Get.put(VerifyEmailController());
    Get.put(VerifyOtpController());
    Get.put(UserAuthController());
    Get.put(AddToWishListController());
    Get.put(WishListController());
    Get.put(CartListController());
    Get.put(CompleteProfileController());
    Get.put(ReadProfileController());
    Get.put(AddReviewController());
    Get.put(DeleteCartListController());
    Get.put(CreateReviewController());
    Get.put(ReviewListController());
  }
  
}