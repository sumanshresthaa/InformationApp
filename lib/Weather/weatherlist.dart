

import 'package:flutter/cupertino.dart';

class WeatherList{
  String imageName(String weather) {
    if (weather == 'clear sky') {
      return 'assets/clearsky.png';
    } else if (weather == 'partly cloudy') {
      return 'assets/partlycloudy.png';
    } else if (weather == 'rain') {
      return 'assets/rain.png';
    }
    else if(weather == 'few clouds'){
      return 'assets/rain.png';
    }
    else {
      return 'assets/weather.jpg';
    }
  }

  String weatherInformation(int temperature){
  if(temperature > 28){
    return 'Its very hot today. Stay cool!';
  }
  else if(temperature >20 || temperature < 28){
    return 'Great weather. Chill!';
  }
  else if(temperature < 20){
    return 'Its cold. Stay warm!';
  }
  else{
    return 'Invalid';
  }


}

}