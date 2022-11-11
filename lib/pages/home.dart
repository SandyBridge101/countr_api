import 'package:flutter/material.dart';
import 'package:untitled1/services/list.dart';
import 'package:untitled1/pages/loading.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
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
    //set_countrydata();
    super.initState();

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
        title: Text("Home"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child:SafeArea(
          child:Column(
            children: <Widget>[

              TextField(
                onChanged: (value) => _runFilter(value),
                decoration: const InputDecoration(
                    labelText: 'Search by country name', suffixIcon: Icon(Icons.search)),
              ),

              Card(
                child:ExpansionTile(title: Text("Filter by region"),
                  children:<Widget> [
                    OutlinedButton(onPressed:(){setState((){found_items = countries;});}, child:Text("All")),
                    OutlinedButton(onPressed:(){region_filter("Americas");}, child:Text("Americas")),
                    OutlinedButton(onPressed:(){region_filter("Europe");}, child:Text("Europe")),
                    OutlinedButton(onPressed:(){region_filter("Oceania");}, child:Text("Oceania")),
                    OutlinedButton(onPressed:(){region_filter("Asia");}, child:Text("Asia")),
                    OutlinedButton(onPressed:(){region_filter("Africa");}, child:Text("Africa")),
                  ],
                ),
              ),

              Container(
                  height: 500,
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



                      return Card(
                          child:ListTile(
                            title:Row(
                              children: [
                                Text(item.name),
                                Image.network(found_items[index].flag.toString(),width:20,height:20,),
                              ],
                            ),
                            subtitle:Text("Click here for more information on "+item.name),
                            onTap:(){  Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => details(index: index,)),
                            );},
                          )
                      );
                    },
                  ):Align(
                    alignment: Alignment.topRight,
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
      )
    );
  }
}
