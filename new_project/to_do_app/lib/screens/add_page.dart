// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddPage extends StatefulWidget {
  final Map? todo;
  const AddPage({super.key, this.todo});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {


  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  
   bool isEdit = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
     final todo = widget.todo;
     if (todo !=null){
       isEdit = true;
       final title = todo['title'];
       final description = todo['description'];
       titleController.text = title;
       descriptionController.text = description;
     }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(isEdit? "Edit ToDo" : "Add ToDo",),
        centerTitle: true,
      ),

      body: ListView(
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              hintText: "Title"
            ),
          ),

          //Sapce
          SizedBox(height: 30,),

           TextField(
            controller: descriptionController,
            decoration: InputDecoration(
              hintText: "Description"
            ),
            maxLines: 7,
            minLines: 5,
          ),

          //Sapce
          SizedBox(height: 100,),

          ElevatedButton(
            onPressed: isEdit? updateDataToServer :submitDataToServer, 
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              padding: EdgeInsets.all(20.0)
            ),
            child: Text(isEdit? "Update" :"Submit"),
            )
        ],
      ),
    );
    
  }

  Future<void> updateDataToServer() async {
    final todo = widget.todo;
    if (todo == null){
      print("You Don't Have todo Data");
      return;
    }
    final id = todo['_id'];
    final title = titleController.text;
    final description = descriptionController.text;
    final body = 
    {
      "title": title,
      "description": description,
      "is_completed": false
    };

    //Submit data to server

    final url = "https://api.nstack.in/v1/todos/$id";
    final uri = Uri.parse(url);
    final response = await http.put(uri, body: jsonEncode(body),headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200){
      titleController.text = '';
      descriptionController.text = '';
      showSuccesMessage('Updation SuccesFully');
    }else{
      showErrorMessage('Updation Failed');
    }
  }

  Future<void> submitDataToServer() async {
    //Get Data From Form
    final title = titleController.text;
    final description = descriptionController.text;
    final body = 
    {
      "title": title,
      "description": description,
      "is_completed": false
    };

    //Submit data to server

    final url = "https://api.nstack.in/v1/todos";
    final uri = Uri.parse(url);
    final response = await http.post(uri, body: jsonEncode(body),headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 201){
      titleController.text = '';
      descriptionController.text = '';
      showSuccesMessage('Created SuccesFully');
    }else{
      showErrorMessage('Creation Failed');
    }
  }
  void showSuccesMessage (message){
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showErrorMessage (message){
    final snackBar = SnackBar(content: Text(message, style: TextStyle(color: Colors.white),), backgroundColor: Colors.red,);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}