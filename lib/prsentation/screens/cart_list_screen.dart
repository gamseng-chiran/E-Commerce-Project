import 'package:e_commerce/prsentation/state_holders/cart_list_controller.dart';
import 'package:e_commerce/prsentation/state_holders/main_bottom_nav_bar_controller.dart';
import 'package:e_commerce/prsentation/utility/app_colors.dart';
import 'package:e_commerce/prsentation/widgets/cart_product_item.dart';
import 'package:e_commerce/prsentation/widgets/centered_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});

  @override
  State<CartListScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartListScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<CartListController>().getCartList();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.find<MainBottomNavBarController>().backToHome();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
          leading: IconButton(
            onPressed: () {
              Get.find<MainBottomNavBarController>().backToHome();
            },
            icon: Icon(Icons.arrow_back_ios_new_sharp),
          ),
        ),
        body: GetBuilder<CartListController>(
          builder: (cartListController) {
            if(cartListController.inProgress){
              return CenteredCircularProgressIndicator();
            }
            return Column(children: [
              Expanded(child: 
              ListView.builder(
                itemCount: cartListController.cartList.length,
                itemBuilder: (context, index) {
                return CartProductItem(
                  cartItem: cartListController.cartList[index],
                );
              }),),
              _buildCheckoutWidget()
            ],);
          }
        ),
      ),
    );
  }

  Widget _buildCheckoutWidget() {
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
            _buildTotalPriceWidget(),
            SizedBox(
              width: 100,
              child: ElevatedButton(onPressed: (){}, 
              child: Text('Checkout')),
            )
          ]),
        );
  }

  Widget _buildTotalPriceWidget() {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text('Total price', 
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
}

