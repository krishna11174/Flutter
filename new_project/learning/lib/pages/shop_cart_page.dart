import 'package:flutter/material.dart';
import 'package:learning/models/cart.dart';
import 'package:learning/models/shoe.dart';
import 'package:learning/pages/cart_page.dart';

class CartPage extends StatelessWidget{
  final Cart cart = CartSingleton.instance;
  CartPage({super.key});
  

  a (){
    print('${cart.getUserCart().length}');
    print('--------------------');
    // print('${cart.shoes1.length}');
    print("${cart.userCart}");
  }
  @override
  Widget  build(BuildContext context){
    return Padding(padding: EdgeInsets.all(12),
    child: Column(
      children: [
        const Text("MY Cart", style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),),
         Expanded(
            child: ListView.builder(
              itemCount: cart.getUserCart().length,
              itemBuilder: (context, index) {
                Shoe shoe = cart.getUserCart()[index];
                return CartItem(shoe: shoe);
              },
            ),
          ),
          FloatingActionButton(onPressed: a(),)
      ],
    ),
    );
  }
}