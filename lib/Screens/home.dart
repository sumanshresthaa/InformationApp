import 'dart:convert';
import 'package:all_in_information/CryptoFunctions/LoadingScreen2.dart';
import 'package:all_in_information/Screens/cryptonews.dart';
import 'package:all_in_information/Screens/quizpage.dart';
import 'package:all_in_information/Weather/NetworkHelper.dart';
import 'package:all_in_information/Weather/weatherlist.dart';
import 'package:flutter/material.dart';
import 'package:all_in_information/constants.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:all_in_information/Weather/location.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  final weatherData;
  HomeScreen(this.weatherData);

  @override
  _HomeScreenState createState() => _HomeScreenState();
  }

class _HomeScreenState extends State<HomeScreen> {
  WeatherList weatherList = WeatherList();
  int temperature;
  String weatherIcon;
  String cityName;
  String sentence;
  String weather;
  String imageName;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.weatherData);
  }


  void updateUI(dynamic weatherData){
    setState(() {
      if(weatherData == null){
        temperature = 0;
        weatherIcon = 'Error';
        cityName ='';
        sentence = 'Unable to get Weather Data' ;
      }
      else{

        double temp = widget.weatherData['main']['temp'].toDouble();
        temperature = temp.toInt();
         weather = widget.weatherData['weather'][0]['description'];
        sentence = weatherList.weatherInformation(temperature);
        imageName = weatherList.imageName(weather);
        cityName = weatherData['name'];

      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Color(0xffACE1F8),

        title: Text(
          'All In News',
          style: TextStyle(
            fontSize: 20
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
            onPressed: (){
                Navigator.push( context, MaterialPageRoute(
                 builder: (context){
                   return CryptoNews();
                 },
                ));
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context){
                  return QuizScreen();
                }
              ));
            },
          ),

        ],

      ),

      body: ListView(
        children: <Widget>[
          Padding(
          padding:  EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Text('Top Stories',
                  style: kTextStyleHome.copyWith(
                  ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                child: Padding(
                  padding:  EdgeInsets.only(bottom: 10.0),
                  child: Image(
                      image: AssetImage('assets/btcnews.png'),
                  ),
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              Text('Categories',
              style: kTextStyleHome),
              Padding(
                padding:  EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Categories(icon: Icons.videogame_asset_sharp, categoryName: 'Play Quiz', onTap: () {
                      Navigator.pushNamed(context, '/quiz');
                    }),
                    Categories(icon: MdiIcons.bitcoin, categoryName: 'Crypto News', onTap: () {
                      Navigator.pushNamed(context, '/crypto');
                    }
                      ),
                    Categories(icon: MdiIcons.cash, categoryName: 'Exchanges' ),
                  ],
                ),
              ),
              Divider(
                color: Colors.black,
              ),

              Container(
                color: Color(0xffF6FFF1),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Weather Today',
                          style: kTextStyleHome),
                      Row(
                        children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                height: 150,
                                width: 170,

                                child: Image(
                                  image: AssetImage(imageName),
                                  // height: 170,
                                  // width: 170,
                                ),
                              ),
                            ),
                            SizedBox(width: 10.0),
                            Column(
                              children: <Widget>[
                                Text('Temperature: $temperature° C'),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(weather.toUpperCase()+' in' + '\n \n$cityName.'),
                              ],
                          ),
                        ],
                      ),
                      SizedBox(height: 15.0),
                      Center(
                        child: Padding(
                          padding:  EdgeInsets.only(left:7.0,bottom: 15.0),
                          child: Text(sentence,
                          style: TextStyle(
                            fontSize: 18.0,
                          ),),
                        ),
                      )
                    ],
                  ),
                ),
              ),


            ],
          ),
        ),
    ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xffACE1F8),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.bitcoin),
            label: 'Crypto News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Accounts',
          ),
        ],
      ),
    );
  }
}

class Categories extends StatelessWidget {
  final IconData icon;
  final String categoryName;
  final Function onTap;
  Categories({this.icon,this.categoryName, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        IconButton(
          icon: Icon(icon),
          iconSize: 40,
          onPressed: onTap
        ),

        TextButton(
          onPressed: onTap,
          child: Text(categoryName,
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.black
          )),
        ),

      ],
    );
  }
}
