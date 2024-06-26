import 'package:e_commerce/prsentation/state_holders/category_list_controller.dart';
import 'package:e_commerce/prsentation/state_holders/main_bottom_nav_bar_controller.dart';
import 'package:e_commerce/prsentation/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoryListScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        Get.find<MainBottomNavBarController>().backToHome();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Category list'),
          leading: IconButton(
            onPressed: () {
              Get.find<MainBottomNavBarController>().backToHome();
            },
            icon: Icon(Icons.arrow_back_ios_new_sharp),
          ),
        ),
        body: GetBuilder<CategoryListController>(
          builder: (categoryListController) {
            if(categoryListController.inProgress){
              return Center(child: CircularProgressIndicator(),);
            }
            return RefreshIndicator(
              onRefresh: categoryListController.getCategoryList,
              child: GridView.builder(
                itemCount: categoryListController.categoryList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: .72
                ), 
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(8),
                    child: CategoryItem(
                      category: categoryListController.categoryList[index],
                    ),);
                }),
            );
          }
        ),
      ),
    );
  }
}