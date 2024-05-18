import 'package:e_commerce/prsentation/screens/product_details_screen.dart';
import 'package:e_commerce/prsentation/utility/app_colors.dart';
import 'package:e_commerce/prsentation/utility/assets_path.dart';
import 'package:e_commerce/prsentation/widgets/wish_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, this.showAddToWishList = true});
  final bool showAddToWishList;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(()=>ProductDetailsScreen());
      },
      child: Card(
        surfaceTintColor: Colors.white,
        color: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: SizedBox(
          width: 150,
          child: Column(
            children: [
              Container(
                width: 150,
                decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(AssetsPath.productDummyImgJpeg),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nike sport shoe special edition',
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: 13,
                          overflow: TextOverflow.ellipsis,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                    ),
                    Wrap(
                      spacing: 10,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          '\$30',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryColor),
                        ),
                        Wrap(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 20,
                            ),
                            Text('3.8'),
                            WishButton(showAddToWishList: showAddToWishList)
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
