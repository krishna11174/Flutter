// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget{
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFun;

  ToDoTile({super.key, required this.taskName, required this.taskCompleted, required this.onChanged, required this.deleteFun});

  Widget _bulidCheckBoc(){
    return Checkbox(value: taskCompleted, onChanged: onChanged);
  }

  Widget _buildTaskName(){
    return Text(taskName,
    style: TextStyle(decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none),
    );
  }

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(right:20.0,top: 20.0,left: 20.0),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(onPressed: deleteFun, icon: Icons.delete,backgroundColor: Colors.red,)
          
        ]),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            children:<Widget>[
              //checkbox
              // Checkbox(value: value, onChanged: onChanged),
              _bulidCheckBoc(),
              _buildTaskName(),
              //Task To-Do
              // Text("Make Turtorial"),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.orange[200],
            borderRadius: BorderRadius.circular(20),
            ),
        ),
      ),
    ) ;
  }
}