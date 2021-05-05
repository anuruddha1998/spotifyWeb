import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/data/data.dart';
import 'package:flutter_spotify_ui/models/current_track.dart';
import 'package:provider/provider.dart';


class TracksList extends StatelessWidget {

  final List<Song> tracks;


  TracksList({
    Key? key
    ,required this.tracks}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      showCheckboxColumn: false,
        dataRowHeight: 54.0,
        columns: [
           DataColumn(label: Text("TITLE",style: TextStyle(color: Colors.white))),
          DataColumn(label: Text("ARTIST",style: TextStyle(color: Colors.white))),
          DataColumn(label: Text("ALBUM",style: TextStyle(color: Colors.white))),
          DataColumn(label: Icon(Icons.access_time,color: Colors.white,)),
        ],

        rows: tracks.map((e)  {
          //if current id == to selected id make selected as true
          final  selected = context.watch<CurrentTrackModel>().selected?.id == e.id;
          final textStyle = TextStyle(color: selected ? Color(0xFF1DB954) : Colors.white );

        return DataRow(
         cells: [
             DataCell( Text(e.title,style: textStyle)),
             DataCell( Text(e.artist,style: textStyle)),
             DataCell( Text(e.album,style: textStyle)),
             DataCell( Text(e.duration,style: textStyle)),
            ],
          selected: selected,//make selected true
          onSelectChanged: (_) =>
              context.read<CurrentTrackModel>().selectTrack(e), //set current track model

        );
        }).toList(),

    );
  }
}
