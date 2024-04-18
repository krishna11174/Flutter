import 'package:flutter/material.dart';
import 'package:mobile_project/mobile_files/dialoge_box.dart';
import 'package:mobile_project/mobile_files/todo_tile.dart';


class HomeScreen extends StatefulWidget{
   HomeScreen({super.key});

   @override
   State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen>{
  final _controller = TextEditingController();

  //list of Tasks ToDo
  List taskList = [["Eat Food", false],
                   ["Drink Water", false]];

  void _checkBox(bool value, index){
    setState((){
      taskList[index][1] = !taskList[index][1];
     print('$taskList[index][1]');
    });

  }
  void addTask(){
    setState((){
    taskList.add([_controller.text, false]);
    _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void createNewTask(){
    showDialog(context: context, builder: (context) {
      return DialogBox(saveNewTask: addTask, 
      controller: _controller, 
      deleteTask: () => Navigator.of(context).pop(),
      
      );
    });
    
  }

  void deleteTask(int index){
    setState(() {
      taskList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext Context){
    return Scaffold(
      backgroundColor: Colors.amber[200],
      appBar: AppBar(
        title: Text("To Do"),
        centerTitle: true,
        backgroundColor: Colors.orange[200],
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: taskList[index][0], 
            taskCompleted: taskList[index][1], 
            onChanged:(value) => _checkBox(value!, index), 
            deleteFun: (context) => deleteTask(index) ,
            );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: createNewTask,
      child: Icon(Icons.add),
      ),
    );
  }

}