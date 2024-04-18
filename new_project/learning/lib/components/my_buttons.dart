import 'package:flutter/material.dart';

class MyButton extends StatelessWidget{
  MyButton({super.key});

   @override
  Widget build(BuildContext context){
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.shop_rounded), label: 'Shop'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart')
        ]
        ),
    );
  }
}

