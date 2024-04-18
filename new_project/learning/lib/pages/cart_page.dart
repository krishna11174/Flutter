// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:learning/models/cart.dart';
import 'package:learning/models/shoe.dart';

class CartItem extends StatefulWidget{
  Shoe shoe;
  CartItem({super.key, required this.shoe});

  @override
  State<CartItem> createState() => _CartItemState();
  
}

class _CartItemState extends State<CartItem>{

     final Cart cart = CartSingleton.instance;


  @override
  Widget build(BuildContext context){
    return ListTile(
       leading: Image.network(widget.shoe.imagePath),
      title: Text(widget.shoe.name),
      subtitle: Text('\$${widget.shoe.price}'),
      trailing: IconButton(onPressed:() => onPressed(widget.shoe), icon: const Icon(Icons.delete)),
    );
  }

    void onPressed(Shoe shoe) {
      print('${cart.userCart.length}');
     setState(() {
      cart.removeItemCart(shoe);
    });
    // showDialog(context: context, builder: builder)
    print('${cart.userCart.length}');
  }
}

