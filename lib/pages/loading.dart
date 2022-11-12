import 'package:flutter/material.dart';
import 'package:untitled1/services/world.dart';
import 'package:untitled1/services/list.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import "dart:convert";

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  
  String country='loading..';
  String current='loading..';

  Future<void> set_countrydata() async {
    //world_country instance=world_country( country:'Barbados');
    //await instance.getdata();

    await generate(current);
    await new Future.delayed(const Duration(seconds: 5));

    print(countries);





    Navigator.pushReplacementNamed(context,'/home');

  }

  @override
  void initState(){
    super.initState();
    set_countrydata();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Container(
          padding:EdgeInsets.only(top:200,bottom:200),
          child:Column(
            children: [
              Center(
                child:Container(
                  padding: EdgeInsets.all(30),
                  child: Text("Welcome",
                  style:TextStyle(
                  fontWeight:FontWeight.bold,
                  fontSize: 30,
                  ),
                  ),
                ),
              ),
              Center(
                child:Container(
                  padding: EdgeInsets.all(30),
                  child: Text("this app displays data of countries",
                    style: TextStyle(
                      fontStyle:FontStyle.italic,
                    ),
                  ),
                ),
              ),
              Center(
                child:SpinKitRotatingCircle(
                  color: Colors.blue,
                  size: 50.0,
                ),
              ),
              Center(
                child:Container(
                  padding: EdgeInsets.all(30),
                  child: Text("Extracting data.."+current),
                ),
              )
            ],
          )
        ),
      )
    );
  }
}

Future<void> set_countrydata() async {
  //world_country instance=world_country( country:'Barbados');
  //await instance.getdata();
  String c=" ";

  await generate(c);

  print(countries);

}

