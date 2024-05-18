import 'package:e_commerce/prsentation/utility/app_colors.dart';
import 'package:e_commerce/prsentation/utility/assets_path.dart';
import 'package:e_commerce/prsentation/widgets/item_count_button.dart';
import 'package:flutter/material.dart';

class CartProductItem extends StatelessWidget {
  const CartProductItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      elevation: 4,
      child: Row(
        children: [
          _buildProductImage(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildProductDetail(),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildProductDetail() {
    return Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildProductName(),
                          _buildColorAndSize(),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.delete_outline_sharp),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$ 100', 
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor
                    ),),
                    ItemCountButton(
                      minValue: 1,
                      initialValue: 1,
                      onChanged: (value) {
                        
                      },
                    ),
                  ],
                )
              ],
            );
  }

  Widget _buildColorAndSize() {
    return Wrap(
                          spacing: 16,
                          children: [
                            Text('Color: Red',
                            style: TextStyle(
                              color: Colors.black54
                            ),),
                            Text('Size: XL',
                            style: TextStyle(
                              color: Colors.black54
                            ),)
                          ],
                        );
  }

  Widget _buildProductName() {
    return Text('Nike shoe 43321',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,);
  }

  Widget _buildProductImage() {
    return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            AssetsPath.productDummyImgJpeg,
            width: 100,
          ),
        );
  }
}

