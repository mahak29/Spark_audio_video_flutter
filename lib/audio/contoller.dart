import 'package:flutter/material.dart';
import 'package:audio_app/audio/musiclist.dart';
//import 'package:just_audio/just_audio.dart';
//import 'package:rxdart/rxdart.dart';
//import 'package:audioplayers/audioplayers.dart';
//import 'package:audioplayers/audio_cache.dart';
//import 'package:assets_audio_player/assets_audio_player.dart';
//import 'package:file_picker/file_picker.dart';

Color primaryColor = Color(0xffedd3cb);
Color darkPrimaryColor = Color(0xff6f3d2e);

class PlayerControls extends StatefulWidget {
  final Data data;

  const PlayerControls({Key key, this.data}) : super(key: key);
  @override
  _PlayerControlState createState() => _PlayerControlState();
}

class _PlayerControlState extends State<PlayerControls>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Controls(
            icon: Icons.skip_previous,
          ),
          PlayerControl(),
          Controls(
            icon: Icons.skip_next,
          ),
        ],
      ),
    );
  }
}

class PlayerControl extends StatefulWidget {
  @override
  PlayerControlState createState() => PlayerControlState();
}

class PlayerControlState extends State<PlayerControl>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        alignment: Alignment.bottomCenter,
        height: 90,
        width: 90,
        decoration: BoxDecoration(
          color: primaryColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(color: darkPrimaryColor.withOpacity(0.5), blurRadius: 10),
            BoxShadow(color: Colors.white, blurRadius: 12)
          ],
        ),
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.all(6),
                decoration: BoxDecoration(
                    color: primaryColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: darkPrimaryColor.withOpacity(0.5),
                          blurRadius: 10),
                      BoxShadow(color: Colors.white, blurRadius: 12)
                    ]),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.all(12),
                decoration:
                    BoxDecoration(color: primaryColor, shape: BoxShape.circle),
                child: Center(
                    child: IconButton(
                  icon: Icon(Icons.play_arrow),
                  iconSize: 50,
                  color: darkPrimaryColor,
                  onPressed: () {},
                )),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}

class Controls extends StatelessWidget {
  final IconData icon;

  const Controls({Key key, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: primaryColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: darkPrimaryColor.withOpacity(0.5), blurRadius: 10),
          BoxShadow(color: Colors.white, blurRadius: 12)
        ],
      ),
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              margin: EdgeInsets.all(6),
              decoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: darkPrimaryColor.withOpacity(0.5),
                        blurRadius: 10),
                    BoxShadow(color: Colors.white, blurRadius: 12)
                  ]),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.all(10),
              decoration:
                  BoxDecoration(color: primaryColor, shape: BoxShape.circle),
              child: Center(
                  child: Center(
                      child: Icon(
                icon,
                size: 30,
                color: darkPrimaryColor,
              ))),
            ),
          ),
        ],
      ),
    );
  }
}
