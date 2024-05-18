// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce/prsentation/widgets/color_picker.dart';
import 'package:e_commerce/prsentation/widgets/size_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:e_commerce/prsentation/utility/app_colors.dart';
import 'package:e_commerce/prsentation/widgets/item_count_button.dart';
import 'package:e_commerce/prsentation/widgets/product_image_carousel_slider.dart';
import 'package:e_commerce/prsentation/widgets/wish_button.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(children: [
                ProductImageCarouselSlider(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Nike 2024 special edition HHGHTR4531',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black.withOpacity(.8),
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          ItemCountButton(onChanged: (value) {}),
                        ],
                      ),
                      _buildReviewSection(),
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
                      SizePicker(sizes: [
                        'S',
                        'M',
                        'L',
                        'XL',
                        'XXL'
                      ], onChanged: (String s){
            
                      }),
                      SizedBox(height: 16,),
                      Text('Description', style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16
                      ),),
                      SizedBox(height: 16,),
                      Text('''In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.''')
                    ],
                  ),
                )
              ]),
            ),
          ),
          _buildAddToCartSection()
        ],
      ),
    );
  }

  Widget _buildReviewSection() {
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
                    Text('3.8'),
                  ],
                ),
                TextButton(onPressed: (){}, child: Text('Review')),
                WishButton()
              ],
            );
  }
}
Widget _buildAddToCartSection() {
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
            _buildPriceWidget(),
            SizedBox(
              width: 120,
              child: ElevatedButton(onPressed: (){}, 
              child: Text('Add to cart')),
            )
          ]),
        );
  }

  Widget _buildPriceWidget() {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text('Price', 
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey
            ),),
            Text('\$100',
            style: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 24
            ),)
          ],);
  }



