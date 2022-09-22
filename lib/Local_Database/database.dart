import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List toDoList = [];
//reference our box
  final mybox = Hive.box('mybox');

//run this method if this is the 1st time ever opening this app
  void createInitalData() {
    toDoList = [
      ["Create Project", false],
      ["Do Exercise", false]
    ];
  }

  // load the data
  void loadData() {
    toDoList = mybox.get("TODOLIST");
  }

  //update the database
  void updateDataBase() {
    mybox.put("TODOLIST", toDoList);
  }
}
