// import 'package:all_in_information/CryptoFunctions/NetworkHelper2.dart';
// import 'package:all_in_information/Screens/cryptonews.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
//
// class LoadingScreen2 extends StatefulWidget {
//   @override
//   _LoadingScreen2State createState() => _LoadingScreen2State();
// }
//
// class _LoadingScreen2State extends State<LoadingScreen2> {
// @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getCoinData();
//   }
//
//   Future getCoinData() async{
//     NetworkHelper2 nw2 = NetworkHelper2();
//     var coinData = await nw2.getCurrencyData();
//    double price = coinData['rate'];
//    print(price);
//    Navigator.pushNamed(context, '/crypto');
//    return price;
//
// }
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: SpinKitPouringHourglass(
//           color: Colors.cyan,
//             size: 100),
//     );
//   }
// }
