import 'package:flutter/material.dart';
import 'package:http/http.dart';
import "dart:convert";
import './world.dart';




List <world_country> countries=<world_country>[
  world_country(country: 'Japan'),

];

List<String> countries_names=[];
List<String> countries_capitals=[];
List<String> countries_regions=[];
List<double> countries_area=[];

Future<void> generate()async{
  Response r = await get(Uri.parse('https://restcountries.com/v3.1/all'));
  List d = jsonDecode(r.body);

  var items;
  items=[];
  var x=0;

  for (var i in d) {
    countries.add(world_country(country: i['name']['common']));
    //print(i['name']['common']);
    await countries[x].getdata();
    print(countries[x].name);
    countries_names.add(countries[x].name);
    countries_capitals.add(countries[x].capital);
    countries_regions.add(countries[x].region);
    countries_area.add(countries[x].area);


    if(x==20){break;};

    x++;
  }

  print(countries[2].name);

}
