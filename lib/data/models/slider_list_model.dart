import 'dart:convert';

import 'package:e_commerce/data/models/slider_data.dart';

SliderListModel sliderListModelFromJson(String str) => SliderListModel.fromJson(json.decode(str));

class SliderListModel {
    String msg;
    List<SliderData> SliderList;

    SliderListModel({
        required this.msg,
        required this.SliderList,
    });

    factory SliderListModel.fromJson(Map<String, dynamic> json) => SliderListModel(
        msg: json["msg"],
        SliderList: List<SliderData>.from(json["data"].map((x) => SliderData.fromJson(x))),
    );
}

