import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import "dart:convert";
import 'package:flutter/services.dart';



class world_country {
  String name = 'loading..';
  late Map c;//to map currency data
  late Map l;//to map language data
  String currency='loading..';
  String capital='loading..';
  String region='loading..';
  String language='loading..';
  int population=0;
  double area=0;
  late Uri flag;

  late String country; //url for api endpoint



  world_country({required this.name,required this.capital,required this.region,required this.area,
    required this.language,required this.currency,required this.flag,required this.population});


  Future <void> getdata() async {
    try{
      //make request
      http.Response response = await http.get(Uri.parse('https://restcountries.com/v2/all?fields=name,capital,currencies'));
      List data = jsonDecode(response.body);

      //name = country;
      //capital=data[0]['capital'][0];
      //region=data[0]['region'];
      //area=data[0]['area'];
      //c=data[0]['currencies'];
      //l=data[0]['languages'];
      //currency=c.values.first['name'];
      //language=l.values.first;
      //flag=Uri.parse(data[0]['flags']['png']);
      //print(name);
    }catch(e){
      print('caught error:$e');
      name='could not extract data';
      flag=Uri.parse('https://webcolours.ca/wp-content/uploads/2020/10/webcolours-unknown.png');
    }

  }



}

