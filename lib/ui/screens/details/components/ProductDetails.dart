import 'package:flutter/material.dart';

class ProductDetails {
  final int id;
  final String title;
  final String description;
  final String images;
  final double rating, price;
  final bool isFavourite;

  ProductDetails({
     this.id,
     this.images,
    this.rating ,
    this.isFavourite,
     this.title,
     this.price,
     this.description,
  });
}