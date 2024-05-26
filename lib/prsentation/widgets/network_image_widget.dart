// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:html';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NetworkImageWidget extends StatelessWidget {
  const NetworkImageWidget({
    Key? key,
    required this.url,
    this.height,
    this.width,
    this.boxFit,
  }) : super(key: key);
  final String url;
  final double? height;
  final double? width;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
  imageUrl: url,
  imageBuilder: (context, imageProvider) => Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      image: DecorationImage(
          image: imageProvider,
          fit: boxFit ?? BoxFit.scaleDown,
          colorFilter:
              ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
    ),
  ),
  placeholder: (context, url) => Center(child: CircularProgressIndicator(color: Colors.white,),),
  errorWidget: (context, url, error) => Icon(Icons.error),
);
  }
}
