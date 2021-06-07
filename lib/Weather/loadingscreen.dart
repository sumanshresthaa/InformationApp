import 'package:all_in_information/Screens/home.dart';
import 'package:all_in_information/Weather/NetworkHelper.dart';
import 'package:all_in_information/Weather/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
   double latitude;
    double longitude;
    String url = 'http://api.openweathermap.org/data/2.5/weather?';
    String appId = '&appid=e5f001d6384ceb15b0c91d7965838d53&units=metric';


    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }
  void getLocationData() async{
    Location location = Location();
    await location.getLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    print(latitude);
    print(longitude);
    NetworkHelper networkHelper = NetworkHelper(url+ 'lat=$latitude&lon=$longitude' + appId);
    var weatherData = await networkHelper.getData();
    Navigator.push(context, MaterialPageRoute(
      builder : (context){
        return HomeScreen(weatherData);
      }
    ));

  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      body: Center(
        child: SpinKitPouringHourglass(
          color: Colors.teal,
          size: 100.0,
        ),
      ),
    );
  }
}





