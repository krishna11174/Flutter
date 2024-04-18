
import 'package:flutter/material.dart';
import 'package:learning/components/show_tilw.dart';
import 'package:learning/models/cart.dart';
import 'package:learning/models/shoe.dart';

class ShopPage extends StatefulWidget{
  ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

   final Cart cart = CartSingleton.instance;
  
  
 
   void addToCart(Shoe shoe) {
    cart.addItemToCart(shoe);
    print("${cart.getUserCart().length}");
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Added to Cart"),
          content: Text("Item has been added to your cart."),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context){
      print("Number of shoes in cart.shoes: ${cart.shoes.length}");

    return Column(
      
      //search bar
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(20)),
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Search'),
                Icon(Icons.search)
              ],
          ),
        ),

        Padding(padding: EdgeInsets.all(8.0),
        child: Text("Everyone Flies... some fly longer than others", style: TextStyle(fontSize: 20),),
        ),
        

        Expanded(child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: cart.shoes.length,
          itemBuilder: (context, index){
          Shoe shoe =cart.getShoeList()[index];
          return ShowTile(shoe: shoe, onTap: () => addToCart(shoe)
          // AddToCart(shoe)
          );
        })),

         Padding(
            padding: const EdgeInsets.only(top: 40, left: 40,right: 40,),
            child: Divider(color: Colors.white,),
          )
      ],
    )
    ;
  }
}

