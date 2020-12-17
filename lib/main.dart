import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_db1/pages/signin_page.dart';
import 'package:hive_db1/pages/signup_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main()async{
  await Hive.initFlutter();
  await Hive.openBox('hive_tb');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SignIn(),
      routes:{
        SignIn.id:(context)=>SignIn(),
        SignUp.id:(context)=>SignUp(),
      },
      debugShowCheckedModeBanner:false,
    );
  }
}

