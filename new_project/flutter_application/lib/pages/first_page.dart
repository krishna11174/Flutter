// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application/pages/second_page.dart';
// import 'package:flutter';

class Login extends StatefulWidget{
  const Login({super.key});

  @override
  _Login createState() => _Login();

}

class _Login extends State<Login> {
  final formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool passToggle = true;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text("Log In"),
      centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical:60),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image.asset("",
                // height: 200,
                // width: 200,
                // ),
                SizedBox(height: 20,),
                TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email)
                ),
                validator: (value){
                  if (value!.isEmpty){
                    return "Please Fill the Email";
                  }
                  else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%^&*-+]+@[a-zA-Z0-9]+\.[a-zA-Z]").hasMatch(value)){
                    return "enter valid email";
                  }
                  return null;
                },
                ),
                SizedBox(height: 20,),
                TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: passwordController,
                obscureText: passToggle,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        passToggle = !passToggle;
                      });
                    },
                    child: Icon(passToggle ? Icons.visibility : Icons.visibility_off),
                  )
                ),
                validator: (value) {
                  if (value!.isEmpty){
                    return "Enter Password";
                  }
                  else if (passwordController.text.length <6){
                    return "Password Should have 8 Charcters";
                  }
                },
                ),
                SizedBox(height: 60,),
                InkWell(
                  onTap: (){
                    if (formkey.currentState!.validate()){
                      print("success");
                      emailController.clear();
                      passwordController.clear();
                    }
                  },
                  child: Container(
                    height:50,
                    decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text("Log In", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white,),),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have account'),
                    TextButton(onPressed: (){}, child: Text("SinUp", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.indigo,),))
                  ],
                ),
              ],
            )
            ),
        ),
      ),
    );
  }
}

// class FirstPage extends StatelessWidget {
//   const FirstPage({super.key});

//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       appBar: AppBar(title: const Text("Log In")),
      
//       body: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               //Email Filed
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextField(
                  
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     hintText: "Email"
//                   ),
                            
//                 ),
//               ),
//               //Pasword Filed
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextField(
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     hintText: "Password"
//                   ),
//                 ),
//               ),
//               ElevatedButton(
//                  child: const Text("Log In"),
//                  onPressed: () {
//                   // Navigator.pop(context);
//                   //Navigate to second page..
//                   Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage(),));
//                   // Navigator.pop(context);
//                  })
                  
          
//             ],
//           ),
//         ),
//       )
//       // Center(
//       //   child: ElevatedButton(
//       //        child: const Text("Go To  Second Page"),
//       //        onPressed: () {
//       //         //Navigate to second page..
//       //         Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage(),)
              
//       //         );
//       //        },
//       // ),
//       // ),
//     );
//   }
// }