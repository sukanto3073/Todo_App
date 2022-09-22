import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'Page/home_page.dart';

void main() async {
  //init the hive
  await Hive.initFlutter();
  //open a box
  var box = await Hive.openBox("mybox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
