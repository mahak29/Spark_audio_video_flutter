import 'package:audio_app/audio/mlib.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:audio_app/video/videolib.dart';
//import 'package:audio_app/audio/mlib.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GradientAppBar(
          title: Text("Hear it...Feel it...Live it"),
          gradient: LinearGradient(
            colors: [Color(0xffedd3cb), Color(0xff6f3d2e)],
          ),
        ),
        body: Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.symmetric(vertical: 90),
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [Colors.amber.shade100, Colors.white])),
            child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => Offlinelibrary()),
                          );
                        },
                        child: Card(
                          elevation: 40.0,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                  image: AssetImage('assets/image/music.jpg'),
                                  fit: BoxFit.fill),
                            ),
                          ),
                          shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        )),
                    width: 250,
                    height: 170,
                    padding: EdgeInsets.all(9.0),
                  ),
                  _divider(),
                  Container(
                    child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => Offlinevideo()),
                          );
                        },
                        child: Card(
                          elevation: 20.0,
                          child: Container(
                              decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                                image: AssetImage('assets/image/video.jpg'),
                                fit: BoxFit.fill),
                          )),
                          shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        )),
                    width: 250,
                    height: 170,
                    padding: EdgeInsets.all(9.0),
                  )
                ])));
  }
}

Widget _divider() {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 20),
    child: Row(
      children: <Widget>[
        SizedBox(
          width: 12,
          height: 10,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22),
            child: Divider(
              color: Colors.orangeAccent.withOpacity(0.6),
              thickness: 2,
            ),
          ),
        ),
        Icon(Icons.favorite, color: Colors.deepOrangeAccent),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22),
            child: Divider(
              color: Colors.orangeAccent.withOpacity(0.6),
              thickness: 2,
            ),
          ),
        ),
        SizedBox(
          width: 12,
          height: 20,
        ),
      ],
    ),
  );
}
