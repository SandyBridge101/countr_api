import 'package:flutter/material.dart';
import 'package:untitled1/services/list.dart';
import 'package:untitled1/pages/loading.dart';
import './details.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();



}

class _HomeState extends State<Home> {

  List<String> found_items = [];
  @override
  initState() {
    // at the beginning, all users are shown
    found_items = countries_names;
    //set_countrydata();
    super.initState();

  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<String> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results =[];
    } else {
      for(var i in countries)
      {
        if(i.name.toLowerCase().contains(enteredKeyword.toLowerCase())){
          results.add(i.name);
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
      body: SafeArea(
          child:Column(
            children: <Widget>[

            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
              labelText: 'Search', suffixIcon: Icon(Icons.search)),
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

                    print(item+".....");



                    return Card(
                        child:ListTile(
                          title:Text("country:"+item),
                          subtitle:Text(countries[index].name),
                          onTap:(){  Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => details(index: index,)),
                          );},
                        )
                    );
                  },
                ): Center(
                  child: Container(
                    width: 50,
                    height: 50,
                    child: FloatingActionButton.extended(
                      label:Text("back"),
                      onPressed:(){
                      Navigator.pushNamed(context,'/home');},


                    ),
                ),
                )
              ),

            ],
          ),
      ),
    );
  }
}
