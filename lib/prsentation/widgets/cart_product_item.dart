// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce/prsentation/state_holders/cart_list_controller.dart';
import 'package:e_commerce/prsentation/state_holders/delete_cart_list_controller.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce/data/models/cart_item_model.dart';
import 'package:e_commerce/prsentation/utility/app_colors.dart';
import 'package:e_commerce/prsentation/utility/assets_path.dart';
import 'package:e_commerce/prsentation/widgets/item_count_button.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class CartProductItem extends StatefulWidget {
  const CartProductItem({
    Key? key,
    required this.cartItem,
  }) : super(key: key);
  final CartItemModel cartItem;

  @override
  State<CartProductItem> createState() => _CartProductItemState();
}

class _CartProductItemState extends State<CartProductItem> {
  late int _counterValue;
  final DeleteCartListController deleteCartListController = Get.find<DeleteCartListController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _counterValue = widget.cartItem.qty!;
  }

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
                      onPressed: () async{
                        bool isDeleted = await deleteCartListController.deleteCartItem(widget.cartItem.productId!.toString());
                        if(isDeleted){
                          Get.find<CartListController>().getCartList();
                        }
                        else{
                          ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(deleteCartListController.errorMessage)),
                    );
                        }
                      },
                      icon: Icon(Icons.delete_outline_sharp),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$${widget.cartItem.product?.price ?? 0}', 
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor
                    ),),
                    ItemCountButton(
                      minValue: 1,
                      initialValue: 1,
                      onChanged: (value) {
                        setState(() {
                          _counterValue = value;
                        });
                        Get.find<CartListController>().changeProductQuantity(widget.cartItem.id!, _counterValue);
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
                            Text('Color: ${widget.cartItem.color ?? ""}',
                            style: TextStyle(
                              color: Colors.black54
                            ),),
                            Text('Size: ${widget.cartItem.size ?? ''}',
                            style: TextStyle(
                              color: Colors.black54
                            ),)
                          ],
                        );
  }

  Widget _buildProductName() {
    return Text('${widget.cartItem.product?.title ?? ''}',
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

