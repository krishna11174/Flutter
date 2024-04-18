import 'package:flutter/material.dart';
import 'package:mobile_project/mobile_files/my_button.dart';

class DialogBox extends StatelessWidget{
  final controller;
  VoidCallback saveNewTask;
  VoidCallback deleteTask;
  DialogBox({super.key, required this.controller, required this.saveNewTask, required this.deleteTask});


  @override
  Widget build(BuildContext context){
    return AlertDialog(
      backgroundColor: Colors.orange[200],
      content: Container(
        height: 140,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(),
              ),
            //button
            Row(
              children: [
                MyButton(text: "Save", onPressed: saveNewTask),
                MyButton(text: "Cancel", onPressed: deleteTask)
              ],
            )
          ],
        ),
      ),
    );
  }
    
} 