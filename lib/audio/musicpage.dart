//import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_app/audio/music.dart';
import 'package:flutter/material.dart';
import 'package:audio_app/audio/musicalbum.dart';
//import 'package:audio_app/audio/contoller.dart';
import 'package:audio_app/audio/musiclist.dart';
//import 'package:audioplayers/audioplayers.dart';
//import 'package:audioplayers/audio_cache.dart';
import 'package:audio_app/audio/musicplayer.dart';

Color primaryColor = Color(0xffedd3cb);
Color darkPrimaryColor = Color(0xff6f3d2e);

class MusicPage extends StatefulWidget {
  final Data data;

  const MusicPage({Key key, this.data}) : super(key: key);
  @override
  MusicPageState createState() => MusicPageState();
}

//AnimationController _animationIconController1;

class MusicPageState extends State<MusicPage> with TickerProviderStateMixin {
  double sliderValue = 2;
  //final player = new AudioCache();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Player(),
            SizedBox(height: 0),
            Container(height: height / 2.5, child: AlbumArt()),
            Text(
              widget.data.title,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: primaryColor),
            ),
            Text(widget.data.artist,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: primaryColor)),
            SizedBox(height: 6),
            OfflinePlayer(),
          ],
        ));
  }
}
