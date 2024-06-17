
import 'package:e_commerce/prsentation/state_holders/main_bottom_nav_bar_controller.dart';
import 'package:e_commerce/prsentation/state_holders/wish_list_controller.dart';
import 'package:e_commerce/prsentation/widgets/centered_circular_progress_indicator.dart';
import 'package:e_commerce/prsentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<WishListController>().getWishList();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        Get.find<MainBottomNavBarController>().backToHome();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('WishList'),
          leading: IconButton(
            onPressed: (() {
              
            }),
            icon: Icon(Icons.arrow_back_ios_sharp),
          ),
        ),
        body: GetBuilder<WishListController>(
          builder: (wishListController) {
            if(wishListController.InProgress){
              return CenteredCircularProgressIndicator();
            }
            return RefreshIndicator(
              onRefresh: () async {
              wishListController.getWishList();
            },
              child: GridView.builder(
                itemCount: wishListController.wishList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: .8
                ), 
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                    child: FittedBox(
                      child: ProductCard(
                      showAddToWishList: false,
                      product: wishListController.wishList[index].product!
                    ),
                    ),
                    );
                }),
            );
          }
        ),
      ),
    );
  }
}


// class WishListScreen extends StatefulWidget {
//   const WishListScreen({super.key});

//   @override
//   State<WishListScreen> createState() => _WishListScreenState();
// }

// class _WishListScreenState extends State<WishListScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Get.find<WishListController>().getWishList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         Get.find<MainBottomNavBarController>().backToHome();
//         return false;
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('WishList'),
//           leading: IconButton(
//             onPressed: () {
//               Get.find<MainBottomNavBarController>().backToHome();
//             },
//             icon: Icon(Icons.arrow_back_ios_sharp),
//           ),
//         ),
//         body: GetBuilder<WishListController>(
//           builder: (wishListController) {
//             if (wishListController.InProgress) {
//               return CenteredCircularProgressIndicator();
//             }
//             return RefreshIndicator(
//               onRefresh: () async {
//                 wishListController.getWishList();
//               },
//               child: GridView.builder(
//                 itemCount: wishListController.wishList.length,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 3,
//                   childAspectRatio: .8,
//                 ),
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
//                     child: FittedBox(
//                       child: ProductCard(
//                         showAddToWishList: false,
//                         product: wishListController.wishList[index].product!,
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }