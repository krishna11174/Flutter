import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:learning/models/shoe.dart';


class Cart {

  // List<dynamic> shoes1 =[];
  
  List<Shoe> shoes = [
     Shoe(
      name: "PUMA",
      price: "250", 
      imagePath: 'lib/images/download.jpeg',
      descreption: 'Cool Shoe',
    ),
  ];
  

  List<Shoe> userCart =[];

  List<Shoe> getShoeList(){
    return shoes;
  }

  List<Shoe> getUserCart(){
    return userCart;
  }


  void addItemToCart(Shoe shoe){
    userCart.add(shoe);
  }
   void removeItemCart(Shoe shoe){
    userCart.remove(shoe);
  }
  
}

class CartSingleton {
  static final Cart _instance = Cart();

  static Cart get instance => _instance;
}