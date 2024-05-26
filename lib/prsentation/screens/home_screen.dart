// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce/data/models/category.dart';
import 'package:e_commerce/data/models/product_model.dart';
import 'package:e_commerce/prsentation/state_holders/category_list_controller.dart';
import 'package:e_commerce/prsentation/state_holders/home_slider_controller.dart';
import 'package:e_commerce/prsentation/state_holders/main_bottom_nav_bar_controller.dart';
import 'package:e_commerce/prsentation/state_holders/popular_product_list_controller.dart.dart';
import 'package:e_commerce/prsentation/state_holders/special_product_list_controller.dart';
import 'package:e_commerce/prsentation/widgets/category_item.dart';
import 'package:e_commerce/prsentation/widgets/centered_circular_progress_indicator.dart';
import 'package:e_commerce/prsentation/widgets/product_card.dart';
import 'package:e_commerce/prsentation/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:e_commerce/prsentation/utility/assets_path.dart';
import 'package:e_commerce/prsentation/widgets/app_bar_icon_button.dart';
import 'package:e_commerce/prsentation/widgets/home_carousel_slider.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  final HomeSliderController _homeSliderController = Get.find<HomeSliderController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildSearchTextField(),
              const SizedBox(
                height: 16,
              ),
              GetBuilder<HomeSliderController>(
                builder: (sliderController) {
                  if(sliderController.inProgress){
                    return SizedBox(
                      height: 200,
                      child: CenteredCircularProgressIndicator()
                    );
                  }
                  return HomeCarouselSlider(
                    sliderList:sliderController.sliderList,
                  );
                }
              ),
              const SizedBox(
                height: 16,
              ),
              SectionHeader(
                title: 'All category',
                onTapSeeAll: () {
                  Get.find<MainBottomNavBarController>().selectCategory();
                },
              ),
              SizedBox(height: 10,),
              GetBuilder<CategoryListController>(
                builder: (categoryListController) {
                  if(categoryListController.inProgress){
                    return SizedBox(
                      height: 200,
                      child: CenteredCircularProgressIndicator()
                    );
                  }
                  return _buildCategoryListView(categoryListController.categoryList);
                }
              ),
              SizedBox(height: 8,),
              SectionHeader(
                title: 'Popular products',
                onTapSeeAll: () {
                },
              ),
              GetBuilder<SpecialProductListController>(
                builder: (specialProductListController) {
                  if(specialProductListController.specialProductInProgress){
                    return SizedBox(
                      height: 210,
                      child: CenteredCircularProgressIndicator()
                    );
                  }
                  return _buildProductListView(specialProductListController.productList);
                }
              ),
              SizedBox(height: 8,),
              SectionHeader(
                title: 'Special',
                onTapSeeAll: () {
                },
              ),
              GetBuilder<SpecialProductListController>(
                builder: (specialProductListController) {
                  if(specialProductListController.specialProductInProgress){
                    return SizedBox(
                      height: 210,
                      child: CenteredCircularProgressIndicator()
                    );
                  }
                  return _buildProductListView(specialProductListController.productList);
                }
              ),
              SizedBox(height: 8,),
              SectionHeader(
                title: 'New',
                onTapSeeAll: () {
                },
              ),
              GetBuilder<PopularProductListController>(
                builder: (popularProductListController) {
                  if(popularProductListController.popularProductInProgress){
                    return SizedBox(
                      height: 210,
                      child: CenteredCircularProgressIndicator()
                    );
                  }
                  return _buildProductListView(popularProductListController.productList);
                }
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryListView(List<Category> categoryList) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children:
        categoryList.map((e) => Row(
          children: [CategoryItem(category: e),
          const SizedBox(width: 8,),]
        ),).toList()
      ),
    );
  }
  Widget _buildProductListView(List<Product> productList) {
    return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: 
                  productList.map((e) => ProductCard(product: e)).toList(),
                ),
              );
            
  }

  Widget _buildSearchTextField() {
    return TextField(
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: 'search',
          filled: true,
          fillColor: Colors.grey.shade200,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8))),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetsPath.appNavLogoSvg),
      actions: [
        AppBarIconButton(
          icon: Icons.person,
          onTap: () {},
        ),
        SizedBox(
          width: 8,
        ),
        AppBarIconButton(
          icon: Icons.call,
          onTap: () {},
        ),
        SizedBox(
          width: 8,
        ),
        AppBarIconButton(
          icon: Icons.notifications,
          onTap: () {},
        )
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _searchController.dispose();
    super.dispose();
  }
}

