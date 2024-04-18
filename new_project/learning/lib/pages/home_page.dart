// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:learning/pages/shop_cart_page.dart';
import 'package:learning/pages/shop_page.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget{
   const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
  
}

class _HomePageState extends State<HomePage>{

   List<dynamic> shoes1= []; 


      void fetchUsers () async {
    print("fetchUsers");
    const url = 'https://fakestoreapi.com/products';
    final uri =Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      shoes1 = json['products'];
    });
    
    print("fetchUsers completed");
    

  }

  int _selectIndex = 0;

  void _navigateBottomBar(int index){
    setState(() {
      _selectIndex = index;
    });
  }

  final List<Widget> _pages = [
    ShopPage(),
    CartPage(),
  ];
  
  @override
  Widget build(BuildContext context){
    return  Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(icon: Icon(Icons.menu), onPressed: () {Scaffold.of(context).openDrawer();},);
          }
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Padding(padding: EdgeInsets.symmetric(horizontal:25.0),child: Divider(color: Colors.amber,),),
            Column(
              children :[
              DrawerHeader(child: Image.asset('lib/images/puma_logo_menu.png',)),    
              const Padding(padding: EdgeInsets.only(left: 25.0),child: ListTile(leading: Icon(Icons.home),title: Text("Home"),),),
              const Padding(padding: EdgeInsets.only(left: 25.0),child: ListTile(leading: Icon(Icons.info),title: Text("About"),),),
              ]
            ),
            const Padding(padding: EdgeInsets.only(left: 25.0, bottom: 25.0),child: ListTile(leading: Icon(Icons.logout),title: Text("Log Out"),),)
          ],
        ),
      ),
      body: _pages[_selectIndex],
        bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectIndex,
        onTap: _navigateBottomBar,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.shop_rounded), label: 'Shop'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart')
        ]
        ),
    );
  }
}