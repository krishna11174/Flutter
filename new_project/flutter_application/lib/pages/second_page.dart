// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application/pages/first_page.dart';

class SecondPage extends StatefulWidget {
    const SecondPage({super.key});

    @override
  _SecondPage createState() => _SecondPage();
}

class _SecondPage extends State<SecondPage> {
    @override
    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(title: Text("Home Page")),
        drawer: Drawer(backgroundColor: Colors.deepOrange[100],
          child: Column(children: [
              DrawerHeader(
                child: Icon(Icons.face_2)
                ),

                //HomePage
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("H O M E"),
                ),  

                ListTile(
                  leading: Icon(Icons.login),
                  title: Text("Log Out"),
                  onTap: (){
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                  },
                ),
          ],),
      ),
        
      );
    }

}