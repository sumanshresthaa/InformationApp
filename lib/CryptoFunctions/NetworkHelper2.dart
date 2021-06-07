import 'dart:convert';

import 'package:http/http.dart' as http;


class NetworkHelper2{
  String url ='https://rest.coinapi.io/v1/exchangerate/';
  String currency;
  String country ;
  String apiKey = '?apiKey=CE913E9F-08AC-4FD6-8151-62AA86840E57';
  //url + currency + '/' + country + apiKey

  Future getCurrencyData (String currency , String country) async{
    http.Response response = await http.get(Uri.parse(url + currency + '/' + country + apiKey));
    if(response.statusCode == 200){
      print(response.statusCode);
      String data = response.body;
      return jsonDecode(data);
          }
    else{
      print(response.statusCode);
    }

  }
}