import 'package:flutter/material.dart';
import './pages/home.dart';
import './pages/details.dart';
import './pages/loading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //set_countrydata();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme:ThemeData.dark(),
      initialRoute:'/',
      routes: {
        '/':(context)=>Loading(),
        '/home':(context)=>  Home(),

      },
    );
  }
}
