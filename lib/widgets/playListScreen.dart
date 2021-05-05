import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/data/data.dart';
import 'package:flutter_spotify_ui/widgets/playlist_header.dart';
import 'package:flutter_spotify_ui/widgets/trackList.dart';

class PlayListScreen extends StatefulWidget {
  final Playlist playlist;

  PlayListScreen({Key? key, required this.playlist}) : super(key: key);

  @override
  _PlayListScreenState createState() => _PlayListScreenState();
}

class _PlayListScreenState extends State<PlayListScreen> {

  ScrollController? _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }
  @override
  void dispose() {
  _scrollController?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 150.0,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                customBorder: CircleBorder(),
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black26,
                  ),
                  child: Icon(
                    Icons.chevron_left,
                    size: 28.0,
                  ),
                ),
              ),
              SizedBox(width: 16.0),
              InkWell(
                customBorder: CircleBorder(),
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black26,
                  ),
                  child: Icon(
                    Icons.chevron_right,
                    size: 28.0,
                  ),
                ),
              )
            ],
          ),
        ),
        actions: [
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.account_circle_outlined,
              size: 30.0,
            ),
            label: Text("Anurudha"),
            style: TextButton.styleFrom(primary: Colors.white),
          ),
          SizedBox(
            width: 8.0,
          ),
          IconButton(
            padding: EdgeInsets.only(),
            icon: Icon(
              Icons.keyboard_arrow_down_outlined,
              size: 30.0,
            ),
            onPressed: () {},
          ),
          SizedBox(
            width: 20.0,
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color(0xFFAF1018),
              Color(0xFF121212)
            ],
                stops: [
              0,
              0.3,
            ])),
        child: Scrollbar(
          isAlwaysShown: true,
          controller: _scrollController,
          child: ListView(
            controller: _scrollController,
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 60.0
            ),
            children: [
              PlayListHeader(playlist: widget.playlist),
              TracksList(tracks:widget.playlist.songs),

            ],
          ),
        ),
      ),
    );
  }
}
