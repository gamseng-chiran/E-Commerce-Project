// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/data/models/slider_data.dart';
import 'package:e_commerce/prsentation/widgets/network_image_widget.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce/prsentation/utility/app_colors.dart';

class HomeCarouselSlider extends StatefulWidget {
  const HomeCarouselSlider({
    Key? key,
    required this.sliderList,
  }) : super(key: key);
  final List<SliderData> sliderList;
  @override
  State<HomeCarouselSlider> createState() => _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<HomeCarouselSlider> {
  final ValueNotifier<int> _selectedPageIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCarouselSlider(),
        SizedBox(height: 8,),
        _buildDotIndicator()
      ],
    );
  }

  Widget _buildDotIndicator() {
    return ValueListenableBuilder(
          valueListenable: _selectedPageIndex,
          builder: (context, currentPage, _) {
          return Row( 
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for(int i=0; i<widget.sliderList.length; i++ )
              Container(
                width: 15,
                height: 15,
                margin: EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  color: i==currentPage? AppColors.primaryColor:null,
                  border: Border.all(color:i==currentPage ? AppColors.primaryColor:Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(50)
                ),
              ),
            ],
          );
          }
        );
  }

  Widget _buildCarouselSlider() {
    return CarouselSlider(
        options: CarouselOptions(height: 180.0,viewportFraction: 1, onPageChanged: (index, _) {
          _selectedPageIndex.value = index;
        },),
        items: widget.sliderList.map((slider) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(color: AppColors.primaryColor, 
                  borderRadius: BorderRadius.circular(8)),
                  alignment: Alignment.center,
                  child: Stack(children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: NetworkImageWidget(
                          url:slider.image ?? '',
                          height: double.maxFinite,
                          width: double.maxFinite,
                          boxFit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: _buildProductDescription(slider),
                    )
                  ],)
                  );
            },
          );
        }).toList(),
      );
  }

  Widget _buildProductDescription(SliderData slider) {
    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text(slider.title??'', style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w600
                        ),),
                        Text(slider.shortDes ?? '',maxLines: 3,
                        style: TextStyle(
                          color: Colors.black,
                          overflow: TextOverflow.ellipsis
                        ),),
                        SizedBox(height: 8,),
                        SizedBox(
                          width: 80,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: AppColors.primaryColor,
                              padding: EdgeInsets.symmetric(vertical: 6),
                              textStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold
                              )
                            ),
                            onPressed: (){}, child: Text('Buy now')))
                      ],),
                    );
  }
}
