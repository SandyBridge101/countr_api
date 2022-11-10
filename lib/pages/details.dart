import 'package:flutter/material.dart';
import 'package:untitled1/services/list.dart';

class details extends StatelessWidget {
  int index=0;
  details({required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text("Details"),),
      body:Column(
        children: [
          Container(
            padding: EdgeInsets.all(50),
            child: Card(
              child:Center(
                child: Text("Country name:\n"+countries_names[index],
                  style:TextStyle(fontWeight:FontWeight.bold,
                  fontSize:30),
                ),
              )
            ),
          ),
          Container(
            padding: EdgeInsets.all(50),
            child: Card(
                child:Center(
                  child: Text("Capital:\n"+countries_capitals[index],
                    style:TextStyle(fontWeight:FontWeight.bold,
                        fontSize:30),
                  ),
                )
            ),
          ),
          Container(
            padding: EdgeInsets.all(50),
            child: Card(
                child:Center(
                  child: Text("Region:\n"+countries_regions[index],
                    style:TextStyle(fontWeight:FontWeight.bold,
                        fontSize:30),
                  ),
                )
            ),
          ),
          Container(
            padding: EdgeInsets.all(50),
            child: Card(
                child:Center(
                  child: Text("Sq.Area:\n"+countries_area[index].toString(),
                    style:TextStyle(fontWeight:FontWeight.bold,
                        fontSize:30),
                  ),
                )
            ),
          ),
        ],

      ),

    );
  }
}
//Center(
//         child: Text("index:"+index.toString()),

