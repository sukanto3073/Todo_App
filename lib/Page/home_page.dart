import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/Component/todo_list.dart';
import 'package:todo_app/Local_Database/database.dart';

import '../Component/dialog_box.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//reference the hive box
  final mybox = Hive.box('mybox');
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    // TODO: implement initState

    if (mybox.get("TODOLIST") == null) {
      db.createInitalData();
    } else {
      db.loadData();
    }

    super.initState();
  }

//Text Controler
  final controler = TextEditingController();

//CheckBoxChange  was Tap
  void checkBoxChange(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  //Save new task
  void SaveNewTask() {
    setState(() {
      db.toDoList.add([controler.text, false]);
      controler.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  //Create a new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: ((context) {
          return DialogBox(
            controller: controler,
            onSave: SaveNewTask,
            onCancle: (() => Navigator.of(context).pop()),
          );
        }));
  }

  //Delete Task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            " Daliy Todo List",
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor: Colors.blue[200],

        //Floting Action Button
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: Icon(Icons.add),
        ),

        //Showing all task here
        body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: ((context, index) {
            return ToDoTile(
              taskName: db.toDoList[index][0],
              taskCompleted: db.toDoList[index][1],
              onChanged: ((value) => checkBoxChange(value, index)),
              deleteTask: (context) => deleteTask(index),
            );
          }),
        ));
  }
}
