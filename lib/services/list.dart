import 'package:flutter/material.dart';
import 'package:http/http.dart';
import "dart:convert";
import './world.dart';
import 'package:flutter/services.dart';





List <world_country> countries=<world_country>[
  //world_country(country: 'Japan'),

];

List<String> countries_names=[];
List<String> countries_capitals=[];
List<String> countries_regions=[];
List<double> countries_area=[];

Future<void> generate(String current)async{
  var r = await get(Uri.parse('https://restcountries.com/v2/all?fields=name,capital,languages,region,area,flags,currencies,population'));

  List d = json.decode(r.body);
  String capital=" ";
  String country=" ";
  double area=0;
  int population=0;
  String region=" ";
  String language=" ";
  String currency=" ";
  late Uri flag;




  var items;
  items=[];
  var x=0;

  for (var i in d) {
    if(i['capital']==null){capital=" ";}else{capital=i['capital'];}
    if(i['population']==null){population=0;}else{population=i['population'];}
    if(i['name']==null){country=" ";}else{country=i['name'];}
    if(i['area']==null){area=0;}else{area=i['area'];}
    if(i['region']==null){region=" ";}else{region=i['region'];}
    if(i['languages']==null){language=" ";}else{language=i['languages'][0]['name'];}
    if(i['currencies']==null){currency=" ";}else{currency=i['currencies'][0]['name'];}
    if(i['flag']==null){flag=Uri.parse('https://webcolours.ca/wp-content/uploads/2020/10/webcolours-unknown.png');}else{flag=Uri.parse(i['flags']['png']);}

    countries.add(world_country(name:i['name'] ,capital:capital ,area:area ,region:region,language:language,currency:currency,flag:Uri.parse(i['flags']['png']),population:population));
    //print(i['name']['common']);
    //await countries[x].getdata();
    current=countries[x].name;
    print(current);
    //countries_names.add(countries[x].name);
    //countries_capitals.add(countries[x].capital);
    //countries_regions.add(countries[x].region);
    //countries_area.add(countries[x].area);


    //if(x==20){break;};


    x++;
  }

  print(countries[2].name);

}

