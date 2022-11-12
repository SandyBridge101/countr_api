# Country_api
This project is a mobile application that displays information of countries from an api.

#Features
This app is made up of two pages,
The first page contains a textfield for searching the countries in the list by name.

There is a filter section below the search bar to filter the countries in the list by region.

There is a clickable listview to display the names of the country, each item in the listview, 
when clicked, sends the user to the details page which displays extra information on the country clicked.

#Themes
The app can automatically switch between light and dark mode based on the current system settings.

#Layout
The layout can also switch between landscape and potrait.

#Code
The codes are separated in two folders, 'pages' for the UI display and 
'services' for the loading and processing of the data from the api.
pages>details.dart is for the details page,
home.dart is for the mainpage,
loading.dart is for loading the data onto the UI,
world.dart is for initializing the class which handles the countries data and
list.dart is for creating a list of that class.

#Design
The components are in a cloumn layout.The main default colors of the applications are blue and white.

#Libraries
cupertino_icons for the icon display.
http for consumption of data from the api.
flutter_spinkit for animations used in the application.
expansion_tile_card was used to implement the expandable card for the filter section.
google_fonts for adding new fonts to the project
internet_connection_checker to check connectivity
fluttertoast for displaying toasts

#If i had more time i would 
expand the filter and search features to make the list
filterable and searchable by not only the name but by other data as well

#Challenge
My PC is slow and hence I had struggles running the application. -I am a beginner, therefore it took me time to complete the work since i was learning new things while doing the project


#Appetize
https://appetize.io/embed/ippfijzaqdwpgynkdk5kmhiira