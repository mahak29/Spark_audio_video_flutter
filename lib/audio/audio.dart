//import 'package:audio_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:audio_app/audio/song.dart';

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Container(
                alignment: Alignment.topLeft,
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Color(0xffedd3cb), Color(0xff6f3d2e)])),
                child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                      Card(
                        //color: Colors.amber,
                        elevation: 52.0,

                        shape: CircleBorder(
                          side: BorderSide(
                            color: Colors.white,

                            // width: 2.0,
                          ),
                        ),

                        child: InkWell(
                            splashColor: Colors.blue.withAlpha(30),
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage('assets/image/main.gif'),
                                    fit: BoxFit.fill),
                              ),
                              width: 250,
                              height: 250,
                            )),
                      ),
                      SizedBox(height: 32),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => SecondPage()),
                              );
                            },
                            textColor: Colors.white,
                            padding: const EdgeInsets.all(0.0),
                            child: Container(
                              decoration: BoxDecoration(
                                //borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  colors: <Color>[
                                    Colors.white,
                                    Color(0xff6f3d2e)
                                  ],
                                ),
                              ),
                              padding: const EdgeInsets.all(20.0),
                              width: 240,
                              child: Text('SPARK with Music',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.black,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                          )),
                    ])))));
  }
}
