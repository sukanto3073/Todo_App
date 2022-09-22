// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo_app/Component/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancle;
  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancle});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue[200],
      content: Container(
        height: 150,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          //Get User Text
          TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              hintText: "Add a new task",
            ),
          ),
          SizedBox(
            height: 30,
          ),
          //Button save or cancle
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //save button
              MyButton(text: "Save", onPressed: onSave),
              //cancle button
              MyButton(text: "Cancle", onPressed: onCancle)
            ],
          )
        ]),
      ),
    );
  }
}
