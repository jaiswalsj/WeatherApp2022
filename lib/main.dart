import 'package:flutter/material.dart';
import 'package:monsoon/activity/home.dart';
import 'package:monsoon/activity/loading.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/" : (context) => Loading(),
      "/home":(context)=> Home(),
      "/loading":(context)=>Loading(),

          },
  ));
}
// import 'package:flutter/material.dart';
// import 'package:monsoon/App_State.dart';
// import 'package:monsoon/Home_State.dart';
// import 'package:monsoon/Home_page.dart';
// import 'package:monsoon/activity/home.dart';
// import 'package:provider/provider.dart';
//
// void main()
// {
//   runApp(const MyApp());
//
// }
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(create: (context)=> AppState(),
//
//     child: MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomePage(),
//     ),);
//
//
//   }
// }
