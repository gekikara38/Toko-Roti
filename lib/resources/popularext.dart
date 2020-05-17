import 'package:flutter/material.dart';

class Popular {
  final String image;
  final String name;
  final String price;

  Popular({this.image, this.name, this.price});
}


List populars = [
  Popular(
    image: "assets/dagangan/1.png",
    name: "D'blue",
    price: '5000',
  ),
  Popular(
    image: "assets/dagangan/2.png",
    name: "D'Pink",
    price: '5000',
  ),
  Popular(
    image: "assets/dagangan/3.png",
    name: "D'White",
    price: '5000',
  ),
  Popular(
    image: "assets/dagangan/4.png",
    name: "D'Coco",
    price: '5000',
  ),
];