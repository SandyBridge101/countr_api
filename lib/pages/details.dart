import 'package:flutter/material.dart';
import 'package:untitled1/services/list.dart';
import 'package:google_fonts/google_fonts.dart';
import './home.dart';


class details extends StatelessWidget {
  int index=0;
  details({required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        foregroundColor:Colors.white,
        backgroundColor:Colors.black,
          title:Text(found_items[index].name,
            textDirection: TextDirection.ltr,
            style:GoogleFonts.pacifico(fontSize: 25,background:Paint()),
      )),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              child: Card(
                elevation:20,
                shape:CircleBorder(
                  side:BorderSide(
                    color:Colors.black,
                    width: 210,
                  ),
                ),

                  child:Center(
                    child:Container(
                      width:200,
                      height: 200,
                      decoration:BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(found_items[index].flag.toString()),
                          fit: BoxFit.fill
                        )
                      ),
                    )
                  )
              ),
            ),

            Container(
              padding: EdgeInsets.all(30),
              child: Card(
                child:Column(
                  children: [
                  Center(
                      child: Text("Country name:\n",style:TextStyle(fontWeight:FontWeight.bold,color:Colors.grey, fontSize:30),),
                  ),
                    Center(
                        child:Text(found_items[index].name,style:TextStyle(fontWeight:FontWeight.bold, fontSize:30),)
                    ),
                  ],
                ),
              ),
            ),


            Container(
              padding: EdgeInsets.all(30),
              child: Card(
                child:Column(
                  children: [
                    Center(
                      child: Text("Capital:\n",style:TextStyle(fontWeight:FontWeight.bold,color:Colors.grey, fontSize:30),),
                    ),
                    Center(
                        child:Text(found_items[index].capital,style:TextStyle(fontWeight:FontWeight.bold, fontSize:30),)
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(30),
              child: Card(
                child:Column(
                  children: [
                    Center(
                      child: Text("Language:\n",style:TextStyle(fontWeight:FontWeight.bold,color:Colors.grey, fontSize:30),),
                    ),
                    Center(
                        child:Text(found_items[index].language,style:TextStyle(fontWeight:FontWeight.bold, fontSize:30),)
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(30),
              child: Card(
                child:Column(
                  children: [
                    Center(
                      child: Text("Region:\n",style:TextStyle(fontWeight:FontWeight.bold,color:Colors.grey, fontSize:30),),
                    ),
                    Center(
                        child:Text(found_items[index].region,style:TextStyle(fontWeight:FontWeight.bold, fontSize:30),)
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(30),
              child: Card(
                child:Column(
                  children: [
                    Center(
                      child: Text("Area:\n",style:TextStyle(fontWeight:FontWeight.bold,color:Colors.grey, fontSize:30),),
                    ),
                    Center(
                        child:Text(found_items[index].area.toString()+" km",style:TextStyle(fontWeight:FontWeight.bold, fontSize:30),)
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(30),
              child: Card(
                child:Column(
                  children: [
                    Center(
                      child: Text("Currency:\n",style:TextStyle(fontWeight:FontWeight.bold,color:Colors.grey, fontSize:30),),
                    ),
                    Center(
                        child:Text(found_items[index].currency,style:TextStyle(fontWeight:FontWeight.bold, fontSize:30),)
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(30),
              child: Card(
                child:Column(
                  children: [
                    Center(
                      child: Text("Population:\n",style:TextStyle(fontWeight:FontWeight.bold,color:Colors.grey, fontSize:30),),
                    ),
                    Center(
                        child:Text(found_items[index].population.toString(),style:TextStyle(fontWeight:FontWeight.bold, fontSize:30),)
                    ),
                  ],
                ),
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

