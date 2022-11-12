import 'package:flutter/material.dart';
import 'package:untitled1/services/list.dart';
import 'package:untitled1/pages/loading.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:google_fonts/google_fonts.dart';

import '../services/world.dart';
import './details.dart';

List<world_country> found_items = [];

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();

}

class _HomeState extends State<Home> {


  @override
  initState() {
    // at the beginning, all users are shown
    found_items = countries;
    super.initState();
  }

  Future<void> load_data(int index)async{

      await countries[index].getdata();
  }

  void slideSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Color(0xFF737373),
            child: Container(
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                color: Colors.white,
              ),
              child:SingleChildScrollView(
                child:Container(
                  padding:EdgeInsets.all(20),
                  child:Column(
                    children:<Widget> [
                      Text("Filter by"),
                      OutlinedButton(onPressed:(){setState((){found_items = countries;});}, child:Text("All")),
                      OutlinedButton(onPressed:(){region_filter("Americas");}, child:Text("Americas")),
                      OutlinedButton(onPressed:(){region_filter("Europe");}, child:Text("Europe")),
                      OutlinedButton(onPressed:(){region_filter("Oceania");}, child:Text("Oceania")),
                      OutlinedButton(onPressed:(){region_filter("Asia");}, child:Text("Asia")),
                      OutlinedButton(onPressed:(){region_filter("Africa");}, child:Text("Africa")),
                    ],
                  ),
                ),
              )
            ),
          );
        });
  }

  void region_filter(String enteredKeyword) {
    List<world_country> results = [];

      for(var i in countries)
      {

        if(i.region==enteredKeyword){
          results.add(i);
          print(enteredKeyword+"==>"+i.region);
        }
      }

      // we use the toLowerCase() method to make it case-insensitive


    // Refresh the UI
    setState(() {
      found_items = results;
    });
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<world_country> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results =[];
    } else {
      for(var i in countries)
      {
        if(i.name.toLowerCase().contains(enteredKeyword.toLowerCase())){
          results.add(i);
        }
      }

      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      found_items = results;
    });
  }





  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:Container(
          alignment: Alignment.centerLeft,
          child:Text("Explore",
            textDirection: TextDirection.ltr,
            style:GoogleFonts.pacifico(fontSize: 25,foreground:Paint()),
          ),
        ),

        backgroundColor:Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body:SingleChildScrollView(
        child:Column(
          children: [
            SingleChildScrollView(

              child:SafeArea(
                child:Column(
                  children: <Widget>[

                    Container(
                      padding:EdgeInsets.all(20),
                      child:Column(
                        children: [
                          TextField(
                            onChanged: (value) => _runFilter(value),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:BorderRadius.circular(10),
                              ),
                                labelText: 'Search by country name', suffixIcon: Icon(Icons.search)),
                          ),

                          Container(
                            child: ElevatedButton.icon(icon:Icon(Icons.filter_alt),onPressed: slideSheet, label: Text("Filter"),),
                            alignment:Alignment.centerRight,
                          ),
                        ],
                      ),
                    ),




                    Container(
                        height: 800,
                        width:500,
                        child:found_items.isNotEmpty?
                        ListView.builder(
                          // Let the ListView know how many items it needs to build.
                          itemCount:found_items.length,
                          // Provide a builder function. This is where the magic happens.
                          // Convert each item into a widget based on the type of item it is.
                          itemBuilder: (context, index) {
                            final item = found_items[index];
                            print(item.name+".....");
                            load_data(index);

                            return Center(
                              child: Card(
                                elevation:5,
                                child:SizedBox(
                                    child:ListTile(
                                      title:Row(
                                        children: [
                                          Container(
                                            width:30,
                                            height: 30,
                                            padding:EdgeInsets.all(20),
                                            decoration:BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: NetworkImage(found_items[index].flag.toString()),
                                                    fit: BoxFit.fill
                                                )
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(20),
                                            width:300,
                                            height: 100,
                                            child: Text(item.name),
                                          ),
                                        ],
                                      ),

                                      onTap:(){  Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => details(index: index,)),
                                      );},
                                    )
                                ),
                              ),
                            );
                          },
                        ):Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: 50,
                            height: 50,
                            child: FloatingActionButton.extended(
                              label:Text("Back"),
                              onPressed:(){
                                Navigator.pushNamed(context,'/home');},
                            ),
                          ),
                        )
                    ),

                  ],
                ),
              ),
            ),

          ],
        ),
      )

    );
  }
}
