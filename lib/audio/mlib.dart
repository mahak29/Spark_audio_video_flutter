//import 'package:audio_app/audio/playercontroller.dart';
//import 'package:audio_app/audio/mplayer.dart';
import 'package:flutter/material.dart';
import 'package:audio_app/audio/musiclist.dart';
import 'package:audio_app/audio/musicplayer.dart';
//import 'package:audioplayers/audioplayers.dart';
//import 'package:audioplayers/audio_cache.dart';
import 'package:google_fonts/google_fonts.dart';

class Offlinelibrary extends StatelessWidget {
  AppBar appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      title: Text(
        "My Music",
        //style: GoogleFonts.lato(),
      ),
      //centerTitle: true,
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: Search());
            })
      ],
    );
  }

  FloatingActionButton floatingActionButton() {
    return FloatingActionButton(
      child: const Icon(
        Icons.audiotrack,
        color: Colors.black,
      ),
      backgroundColor: Color(0xffedd3cb),
      elevation: 2,
      tooltip: "Now Playing",
      onPressed: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBar(context),
      body: AudioBody(),
      floatingActionButton: floatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class AudioBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      minimum: EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: size.height,
        width: size.width,
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: datas.length,
                itemBuilder: (BuildContext context, int index) =>
                    BuildAudioCard(
                  data: datas[index],
                  itemIndex: index,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildAudioCard extends StatelessWidget {
  final int itemIndex;
  final Data data;
  BuildAudioCard({
    Key key,
    this.itemIndex,
    this.data,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Card(
          margin: EdgeInsets.symmetric(vertical: 8.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35.0),
          ),
          color: Colors.white30.withOpacity(0.1),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.black,
              backgroundImage: AssetImage("assets/image/gif2.gif"),
              radius: 25,
            ),
            title: Text(
              data.title,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontStyle: FontStyle.italic,
              ),
            ),
            subtitle: Text(
              data.artist,
              style: GoogleFonts.lato(color: Colors.white54),
            ),
          ),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OfflinePlayer(
                  data: datas[itemIndex],
                ),
              ));
        });
  }
}

class Search extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final mylist = query.isEmpty
        ? datas
        : datas.where((p) => p.title.startsWith(query)).toList();

    return ListView.builder(
      itemCount: mylist.length,
      itemBuilder: (BuildContext context, int index) => BuildAudioCard(
        data: mylist[index],
        itemIndex: index,
      ),
    );
  }
}
