import 'package:all_in_information/CryptoFunctions/LoadingScreen2.dart';
import 'package:all_in_information/CryptoFunctions/NetworkHelper2.dart';
import 'package:all_in_information/Weather/NetworkHelper.dart';
import 'package:all_in_information/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:all_in_information/CryptoFunctions/dropdown.dart';


class CryptoNews extends StatefulWidget {
    @override
  _CryptoNewsState createState() => _CryptoNewsState();
}

class _CryptoNewsState extends State<CryptoNews> {
 
  double rate;
  String price = "0";
  String coinName = "BTC";
  String countryName = "USD";

  DropDown dropDown = DropDown();

  DropdownButton getCurrencyInAndroid() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String currency in dropDown.currencyList) {
      print(currency.length);
      var newItem = DropdownMenuItem(child: Text(currency), value: currency);
      dropDownItems.add(newItem);
    }
    return DropdownButton<String>(
      value: dropDown.selectedCurrency,
      items: dropDownItems,
      onChanged: (value) {
        setState(() {
          dropDown.selectedCurrency = value;
          coinName = dropDown.selectedCurrency;
        });
      },
    );
  }

  DropdownButton getCountryInAndroid() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String Country in dropDown.country) {
      var newItem = DropdownMenuItem(
        child: Text(Country),
        value: Country,
      );
      dropDownItems.add(newItem);
    }
    return DropdownButton<String>(
        value: dropDown.selectedCountry,
        items: dropDownItems,
        onChanged: (value) {
          setState(() {
            dropDown.selectedCountry = value;
            countryName = dropDown.selectedCountry;
          });

        });
  }








  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Color(0xffACE1F8),
        title: Text(
          'Crypto News',
          style: TextStyle(fontSize: 20),
        ),
        actions: <Widget>[
          Icon(
            Icons.search,
          ),
          Icon(Icons.more_vert),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image(
            image: AssetImage('assets/starbucks.jpg'),
          ),
          Text('Ads'),
          SizedBox(height: 20.0),
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: 40,
                    width: 90,
                    color: Colors.grey.shade200,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: getCurrencyInAndroid(),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 90,
                    color: Colors.grey.shade200,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: getCountryInAndroid(),
                    ),
                  )
                ],
              ),
              TextButton(
                onPressed: () async{
                  NetworkHelper2 nw2 = NetworkHelper2();
                  var coinData = await nw2.getCurrencyData(coinName,countryName);
                 double  numberPrice = coinData['rate'];

                  setState(() {
                    price = numberPrice.toStringAsFixed(0);
                    print(price);
                    print(coinName);
                    print(countryName);
                  });

                },
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 17,
                  child: Icon(
                    Icons.arrow_forward,
                    size: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                      color: Colors.grey.shade200,
                      height: 40,
                      width: 100,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Center(child: Text('1 $coinName')),
                      )),
                  Container(
                      color: Colors.grey.shade200,
                      height: 40,
                      width: 100,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Center(child: Text(price + " " + countryName),
                      )))
                ],
              ),
            ],
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text('News', style: kTextStyleHome),
          ),
          Container(
            width: 400.0,
            height: 170.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/btcloss.jpg'), fit: BoxFit.fill),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Crypto Currency crashes after Tesla CEO Elon Musk tweeted that tesla will no longer trade business using Bitcoin as it requires heavy power and is energy inefficient.',
              textAlign: TextAlign.justify,
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xffACE1F8),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(MdiIcons.bitcoin), label: 'Crypto News'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Accounts'),
        ],
      ),
    );
  }
}
