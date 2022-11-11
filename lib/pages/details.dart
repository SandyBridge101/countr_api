import 'package:flutter/material.dart';
import 'package:untitled1/services/list.dart';
import './home.dart';

class details extends StatelessWidget {
  int index=0;
  details({required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text("Details"),),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(50),
              child: Card(
                  child:Center(
                    child: Text("Country name:\n"+found_items[index].name,
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
                    child: Text("Capital:\n"+found_items[index].capital,
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
                    child: Text("Region:\n"+found_items[index].region,
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
                    child: Text("Sq.Area:\n"+found_items[index].area.toString(),
                      style:TextStyle(fontWeight:FontWeight.bold,
                          fontSize:30),
                    ),
                  )
              ),
            ),
          ],

        ),

      ),
    );
  }
}
//Center(
//         child: Text("index:"+index.toString()),

