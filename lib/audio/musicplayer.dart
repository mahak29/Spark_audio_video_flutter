import 'package:flutter/material.dart';

import 'package:just_audio/just_audio.dart';
import 'package:audio_app/audio/musiclist.dart';
import 'package:audio_app/audio/music.dart';
import 'package:audio_app/audio/musicalbum.dart';

Color primaryColor = Color(0xffedd3cb);
Color darkPrimaryColor = Color(0xff6f3d2e);

class OfflinePlayer extends StatefulWidget {
  final Data data;
  //final BuildAudioCard itemIndex;
  const OfflinePlayer({
    Key key,
    this.data,
  }) : super(key: key);
  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<OfflinePlayer>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<Color> _colorTween;
  AudioPlayer _player;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    _colorTween = _animationController
        .drive(ColorTween(begin: Colors.orangeAccent, end: Colors.black));
    _animationController.forward();
    // AudioPlayer.setIosCategory(IosCategory.playback);
    _player = AudioPlayer();
    _player.setAsset(widget.data.asset).then((value) => _player.play());
    // _player.setAsset(widget.data.asset).then((value) => _player.play());
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

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
            StreamBuilder<Duration>(
              stream: _player.durationStream,
              builder: (context, snapshot) {
                final duration = snapshot.data ?? Duration.zero;
                return StreamBuilder<Duration>(
                  stream: _player.getPositionStream(),
                  builder: (context, snapshot) {
                    var position = snapshot.data ?? Duration.zero;
                    if (position > duration) {
                      position = duration;
                    }
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 0),
                      child: SeekBar(
                        duration: duration,
                        position: position,
                        onChangeEnd: (newPosition) {
                          _player.seek(newPosition);
                        },
                      ),
                    );
                  },
                );
              },
            ),
            StreamBuilder<FullAudioPlaybackState>(
              stream: _player.fullPlaybackStateStream,
              builder: (context, snapshot) {
                final fullState = snapshot.data;
                final state = fullState?.state;
                final buffering = fullState?.buffering;
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: primaryColor,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: darkPrimaryColor.withOpacity(0.5),
                                  blurRadius: 10),
                              BoxShadow(color: Colors.white, blurRadius: 12)
                            ]),
                        child: IconButton(
                          icon: Icon(Icons.skip_previous),
                          iconSize: 30.0,
                          color: darkPrimaryColor,
                          onPressed: () {},
                        ),
                      ),
                      if (state == AudioPlaybackState.connecting ||
                          buffering == true)
                        Container(
                          margin: EdgeInsets.all(8.0),
                          width: 30.0,
                          height: 30.0,
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.white,
                            strokeWidth: 3,
                            valueColor: _colorTween,
                          ),
                        )
                      else if (state == AudioPlaybackState.playing)
                        Container(
                            decoration: BoxDecoration(
                                color: primaryColor,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      color: darkPrimaryColor.withOpacity(0.5),
                                      blurRadius: 10),
                                  BoxShadow(color: Colors.white, blurRadius: 12)
                                ]),
                            child: IconButton(
                              icon: Icon(Icons.pause),
                              iconSize: 55.0,
                              color: darkPrimaryColor,
                              onPressed: _player.pause,
                            ))
                      else
                        Container(
                          decoration: BoxDecoration(
                              color: primaryColor,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    color: darkPrimaryColor.withOpacity(0.5),
                                    blurRadius: 10),
                                BoxShadow(color: Colors.white, blurRadius: 12)
                              ]),
                          child: IconButton(
                            icon: Icon(Icons.play_arrow),
                            iconSize: 50.0,
                            color: darkPrimaryColor,
                            onPressed: _player.play,
                          ),
                        ),
                      Container(
                        decoration: BoxDecoration(
                            color: primaryColor,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: darkPrimaryColor.withOpacity(0.5),
                                  blurRadius: 10),
                              BoxShadow(color: Colors.white, blurRadius: 12)
                            ]),
                        child: IconButton(
                            icon: Icon(Icons.skip_next),
                            iconSize: 30.0,
                            color: darkPrimaryColor,
                            onPressed: () {}),
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ));

    // );
  }
}

class SeekBar extends StatefulWidget {
  final Duration duration;
  final Duration position;
  final ValueChanged<Duration> onChanged;
  final ValueChanged<Duration> onChangeEnd;

  SeekBar({
    @required this.duration,
    @required this.position,
    this.onChanged,
    this.onChangeEnd,
  });

  @override
  _SeekBarState createState() => _SeekBarState();
}

class _SeekBarState extends State<SeekBar> {
  double _dragValue;

  @override
  Widget build(BuildContext context) {
    return Slider(
      activeColor: darkPrimaryColor,
      inactiveColor: Colors.white30.withOpacity(0.1),
      min: 0.0,
      max: widget.duration.inMilliseconds.toDouble(),
      value: _dragValue ?? widget.position.inMilliseconds.toDouble(),
      onChanged: (value) {
        setState(() {
          _dragValue = value;
        });
        if (widget.onChanged != null) {
          widget.onChanged(Duration(milliseconds: value.round()));
        }
      },
      onChangeEnd: (value) {
        _dragValue = null;
        if (widget.onChangeEnd != null) {
          widget.onChangeEnd(Duration(milliseconds: value.round()));
        }
      },
    );
  }
}
