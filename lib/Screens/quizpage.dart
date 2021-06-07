import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text('Quiz Game'),
        backgroundColor: Color(0xff0D6387),
        actions: <Widget>[
          Icon(
            Icons.search
          ),
          Icon(
            Icons.more_vert
          ),
        ],
      ),
      body: ListView(
        children:<Widget>[
        Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(

                  child: Image(
                  image: AssetImage('assets/stars.jpg'),
              ),
                ),
                Container(

                  child: Center(
                    child: Text('When did first world war end?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),),
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Options('A. 1945'),
                SizedBox(width: 60),
                Options('B. 1945'),
              ],

            ),

            Row(

              children: <Widget>[
                Options('C. 1945'),
                SizedBox(width: 60),
                Options('D. 1998'),
              ],
            )
          ],
        ),
            ],
      ),
    );
  }
}

class Options extends StatelessWidget {
final String options;
Options(this.options);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 40,
        width: 150,
        color: Colors.grey.shade200,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(options),
        ),
      ),
    );
  }
}
