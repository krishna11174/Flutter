// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:learning/models/cart.dart';
import 'package:learning/models/shoe.dart';
import 'package:learning/pages/home_page.dart';
import 'package:http/http.dart' as http;
// import 'package:learning/pages/shop_page.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {


//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       body: Column(
//         children: [
//          //logo
//           Image.asset('lib/images/Puma-Logo.png',
//           height: 240,),
//          //title

//          //sutitle

//          //button
          
//         ],
//       ),
//     );
//   }
// }
class Intro_page extends StatefulWidget {
  const Intro_page({super.key});

  @override
  State<Intro_page> createState() => _Intro_pageState();
}

class _Intro_pageState extends State<Intro_page> {
  
  final Cart cart = CartSingleton.instance;


   Future<void> fetchUsers() async {
    // print("fetchUsers");
    const url = 'https://dummyjson.com/products';

    try {
      final uri = Uri.parse(url);
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final body = response.body;
        final json = jsonDecode(body);
        final results = json['products'] as List<dynamic>;
        final transfromed = results.map((e) {
          return Shoe(name: e['title'], price: e['price'].toString(), imagePath: e['images'][0], descreption: e['description']);
        }).toList();

        setState(() {
         cart.shoes =transfromed;
        });
        // cart.initializeShoesList();
        // print("fetchUsers completed");
      } else {
        print("Failed to fetch users. Status code: ${response.statusCode}");
      }
    } catch (error) {
      print("An error occurred: $error");
    }
  }

      @override
      Widget build(BuildContext context){
        return Scaffold(
          backgroundColor: Colors.grey,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.asset('lib/images/Puma-Logo1.png',
                    height: 200,
                    ),
                  ),
                ),

                //Title

                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text("P U M A", 
                  style: TextStyle(
                    fontSize: 40, 
                    fontStyle: FontStyle.normal,
                    foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 3
                    ..color = Colors.white),),
                ),
                const Text("Brand New Sneakers and custom kicks made with premium quality",
                style: TextStyle(fontSize: 16,),
                textAlign: TextAlign.center,
                ),
                
                SizedBox(height: 60,),
                //button
                GestureDetector(
                  onTap: () async {
                   await fetchUsers();
                    
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(10)
                  ),
                  
                  child: Text('Shop Now',
                  style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),)
                ),
                  
                )
              ],
            ),
          ),
        );
      }
}