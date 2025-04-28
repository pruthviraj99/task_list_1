import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';

class CategoryClass {
  String categoryName;

  List<ProductClass> productList;

  CategoryClass({required this.categoryName, required this.productList});
}

class ProductClass {
  String productImageUrl;

  String productDescription = "Men's casual runner";

  double price;

  List<Color> colorList = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.black,
    Colors.purple
  ];

  ProductClass({required this.productImageUrl, required this.price});
}
