// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


class LogIn extends StatefulWidget {
  const LogIn({super.key,});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<LogIn> createState() => _LogInState();
}


class _LogInState extends State<LogIn> {

  
  String? _name;
  String? _phoneNumber;
  String? _email;
  String? _gender;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Widget _buildName(){
    return TextFormField(
      // keyboardType: TextInputType.name,
      decoration: InputDecoration(
        // border: OutlineInputBorder(),
        labelText: "Name",
        prefixIcon: Icon(Icons.person_pin_circle_outlined,color: Colors.cyan,),
      ),
      validator: (value) {
        if (value!.isEmpty){
          return "Enter Name";
        }
      },
    );
  }

  Widget _buildPhoneNum(){
      return TextFormField(
      // keyboardType: TextInputType.name,
      decoration: InputDecoration(
        // border: OutlineInputBorder(),
        labelText: "Mobile Number",
        prefixIcon: Icon(Icons.mobile_friendly,color: Colors.cyan,),
      ),

    );
  }

  Widget _buildEmail(){
    return TextFormField(
      // keyboardType: TextInputType.name,
      decoration: InputDecoration(
        // border: OutlineInputBorder(),
        labelText: "Email",
        prefixIcon: Icon(Icons.email_rounded,color: Colors.cyan,),
      ),

    );
  }

  Widget _buildGender(){
    return TextFormField(
      // keyboardType: TextInputType.name,
      decoration: InputDecoration(
        // border: OutlineInputBorder(),
        labelText: "Gender",
        prefixIcon: Icon(Icons.transgender,color: Colors.cyan,),
      ),

    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do"),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(40),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),),
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              _buildName(),
              _buildGender(),
              _buildPhoneNum(),
              _buildEmail(),
              SizedBox(height: 60,),
              ElevatedButton.icon(onPressed: (){
                if (_formkey.currentState!.validate()){
                  print("Success-------------------------------------------");
                }
              }, 
              icon: Icon(Icons.arrow_circle_right_rounded), label: Text("Sign Up")
              )
            ],
          )
          ),
      ),
    );
  }

}