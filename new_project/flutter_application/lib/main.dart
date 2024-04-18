import 'package:flutter/material.dart';
import 'package:flutter_application/pages/first_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
      // home: Scaffold(
        // appBar: AppBar(title: Text("My App Bar"),
        // backgroundColor: Colors.amberAccent,
        // leading: Icon(Icons.menu),
        // actions: [IconButton(onPressed: () {}, icon: Icon(Icons.logout))],
        // ),
        // body: Column(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children: [
        //     Container(
        //       height: 200,
        //       width: 200,
        //       color: Colors.black12,
        //     ),
        //     Container(
        //         height: 200,
        //         width: 200,
        //         decoration: BoxDecoration(color: Colors.black26,
        //         borderRadius: BorderRadius.circular(20))
        //       ),
        //     Container(
        //       height: 200,
        //       width: 200,
        //       color: Colors.black38,
        //     )
        //   ],
        // ),
        // ),
      );
  }
}