import 'package:flutter/material.dart';

import 'Data.dart';

class Cart {
  final Data product;
  final int numOfItem;

  Cart({ this.product,  this.numOfItem});
}

// Demo data for our cart


List<Data> demoProducts = [
  Data(
    id: 1,
    images: "assets/images/br2.png",
    title: "Chocolate Indulgence",
    price: "28",
    description: "Layered sundae with 2 Emlaaq scoops (6 Oz) ,Brownie chunks and Toppings",
    rating: 4.8,
    isFavourite: true,
  ),
  Data(
    id: 1,
    images: "assets/images/br2.png",
    title: "BR Squad",
    price: "35",
    description: "2 Value Packs approximately 20 scoops with 5 Sugar Cones, 2 Dry Toppings, Decorous Ceramic Scooper",
    rating: 4.8,
    isFavourite: true,
  ),
  Data(
    id: 1,
    images: "assets/images/signature-sundaes2.jpg",
    title:"Signature Sundaes",
    price: "45",
    description: "Layered sundae with 2 Emlaaq scoops (6 Oz) ,Brownie chunks and Toppings",
    rating: 4.8,
    isFavourite: true,
  ),

];

List<Cart> demoCarts = [
  Cart(product: demoProducts[0], numOfItem: 2),
  Cart(product: demoProducts[1], numOfItem: 1),
  Cart(product: demoProducts[2], numOfItem: 1),
];
