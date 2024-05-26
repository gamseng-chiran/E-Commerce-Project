// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce/data/models/product_details_model.dart';
import 'package:e_commerce/prsentation/state_holders/product_details_controller.dart';
import 'package:e_commerce/prsentation/widgets/centered_circular_progress_indicator.dart';
import 'package:e_commerce/prsentation/widgets/color_picker.dart';
import 'package:e_commerce/prsentation/widgets/size_picker.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce/prsentation/utility/app_colors.dart';
import 'package:e_commerce/prsentation/widgets/item_count_button.dart';
import 'package:e_commerce/prsentation/widgets/product_image_carousel_slider.dart';
import 'package:e_commerce/prsentation/widgets/wish_button.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});
  final int productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<ProductDetailsController>().getproductDetails(widget.productId);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: GetBuilder<ProductDetailsController>(
        builder: (productDetailsController) {
          if(productDetailsController.inProgress){
            return CenteredCircularProgressIndicator();
          }if(productDetailsController.errorMessage.isNotEmpty){
            return Center(child: Text(productDetailsController.errorMessage),);
          }
          ProductDetailsModel productDetails = productDetailsController.productDetailsModel;
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(children: [
                    ProductImageCarouselSlider(images: [
                      productDetails.img1 ?? '',
                      productDetails.img2 ?? '',
                      productDetails.img3 ?? '',
                      productDetails.img4 ?? ''
                    ],),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  productDetails.product?.title ?? '',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black.withOpacity(.8),
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              ItemCountButton(onChanged: (value) {}),
                            ],
                          ),
                          _buildReviewSection(productDetails),
                          Text('Color', style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16
                          ),),
                          SizedBox(height: 16,),
                          ColorPicker(colors: [
                            Colors.black,
                            Colors.red,
                            Colors.amber,
                            Colors.purple,
                            Colors.blue
                          ], onChanged: (Color selectedColor){
                          }), SizedBox(height: 16,),
                          Text('Size', style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16
                          ),),
                          SizedBox(height: 16,),
                          SizePicker(sizes: productDetails.size?.split(',') ?? [], onChanged: (String s){
                
                          }),
                          SizedBox(height: 16,),
                          Text('Description', style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16
                          ),),
                          SizedBox(height: 16,),
                          Text(productDetails.product?.shortDes ?? ''),
                          SizedBox(height: 8,),
                          Text(productDetails.des ?? '')
                        ],
                      ),
                    )
                  ]),
                ),
              ),
              _buildAddToCartSection(productDetails)
            ],
          );
        }
      ),
    );
  }

  Widget _buildReviewSection(ProductDetailsModel productDetails) {
    return Wrap(
              spacing: 10,
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Wrap(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 20,
                    ),
                    Text('${productDetails.product?.star ?? 0}'),
                  ],
                ),
                TextButton(onPressed: (){}, child: Text('Review')),
                WishButton()
              ],
            );
  }
}
Widget _buildAddToCartSection(ProductDetailsModel productDetails) {
    return Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16),
              topLeft: Radius.circular(16)
            )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            _buildPriceWidget(productDetails),
            SizedBox(
              width: 120,
              child: ElevatedButton(onPressed: (){}, 
              child: Text('Add to cart')),
            )
          ]),
        );
  }

  Widget _buildPriceWidget(ProductDetailsModel productDetails) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text('Price', 
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey
            ),),
            Text('\$${productDetails.product?.price ?? 0}',
            style: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 24
            ),)
          ],);
  }



