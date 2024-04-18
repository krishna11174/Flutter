// ignore_for_file: prefer_const_declarations, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:to_do_app/screens/add_page.dart';
import 'package:http/http.dart' as http;
class ToDoListPage extends StatefulWidget {
  const ToDoListPage({super.key});

  @override
  State<ToDoListPage> createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {

  List items =[];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchToDo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do Page"),
        centerTitle: true,
      ),
      body: Visibility(
                        visible: isLoading,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                        replacement: RefreshIndicator(
                          onRefresh: fetchToDo,
                          child: ListView.builder(
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              final item = items[index] as Map;
                              final id = item['_id'] as String;
                              return ListTile(
                                leading: CircleAvatar(child: Text("${index + 1}")),
                                title: Text(item['title']),
                                subtitle: Text(item['description']),
                                trailing: PopupMenuButton(
                                  onSelected: (value) {
                                    if(value == 'edit'){
                                        navigateToEditTaskPage(item);
                                    }else if(value == 'delete'){
                                        deleteById(id);
                                    }
                                  },
                                  itemBuilder:(context) 
                                {
                                  return [
                                    PopupMenuItem(child: Text('Edit'), value: 'edit',),
                                    PopupMenuItem(child: Text('Delete'), value: 'delete',),
                                  ];
                                }  ),
                              );
                            },
                          ),
                        ),
                      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed:navigateToAddTaskPage,
        label : Text("Add Task")
        // child: const Text("Add Task"),
        ),
    );
  }

    //Navigate to add_page or Add Task

     Future<void> navigateToEditTaskPage(Map item) async {
        final route = MaterialPageRoute(
          builder: (context) => AddPage(todo: item)
          );

          await Navigator.push(context, route);
         setState(() {
           isLoading = true;
         });
         fetchToDo();
      }
     

   Future <void> navigateToAddTaskPage() async{
        final route = MaterialPageRoute(
          builder: (context) => AddPage()
          );

         await Navigator.push(context, route);
         setState(() {
           isLoading = true;
         });
         fetchToDo();
      }

    //Deleting recordbyID

    Future<void> deleteById(String id) async{
      final url = 'https://api.nstack.in/v1/todos/$id';
      final uri = Uri.parse(url);
      final response = await http.delete(uri);
      
      if(response.statusCode == 200){
        final filtered = items.where((element) => element['_id'] != id).toList();
        setState(() {
          items =filtered;
        });
      }
    }

    //Fetching Data Throug API
  Future<void>fetchToDo() async {
    final url = 'https://api.nstack.in/v1/todos?page=1&limit=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200 ) {
      final json = jsonDecode(response.body) as Map;
      // print(json);
      final results = json['items'] as List;
      print(results[0]["_id"]);
      setState(() {
        items = results;
      });
    }
    setState(() {
      isLoading = false;
    });
  }

      void showErrorMessage (message){
        final snackBar = SnackBar(content: Text(message, style: TextStyle(color: Colors.white),), backgroundColor: Colors.red,);
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
}