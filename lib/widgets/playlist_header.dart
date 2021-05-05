import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/data/data.dart';

class PlayListHeader extends StatelessWidget {

  final Playlist playlist;


  PlayListHeader({
    Key? key
  ,required this.playlist}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
    children: [

      Row(
        children: [

          Image.asset(
            playlist.imageURL,
            height: 200.0,
            width: 200.0,
            fit: BoxFit.cover,
          ),

          SizedBox(width: 16.0,),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text("PLAYLISTS",
                  style: Theme.of(context).textTheme.overline!.copyWith(fontSize: 12,color: Colors.white),),

                SizedBox(height: 12.0,),

                Text(playlist.name,style: TextStyle(
                  color: Colors.white,
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),),

                SizedBox(height: 12.0,),

                Text(playlist.description,style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),),

                SizedBox(height: 16.0,),

                Text('Created by ${playlist.creator} ${playlist.songs.length} songs,  ${playlist.duration}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),),






              ],
            ),
          )



        ],
      ),


      SizedBox(height: 20.0,),
      _PlayListsButton(followers: playlist.followers,)


    ],
    );
  }
}




class _PlayListsButton extends StatelessWidget {

  final String followers;


  _PlayListsButton(
   {Key? key,
     required this.followers}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
            style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: 48,
            vertical: 20
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)
          ),
              backgroundColor: Color(0xFF1DB954),
              primary: Colors.white,
              textStyle: Theme.of(context).textTheme.caption!
                .copyWith(letterSpacing: 2.0,fontSize: 12.0),

        ),
          onPressed: (){},
          child: Text(
            "Play"
          ),

        ),
        const SizedBox(width: 8.0,),
        IconButton(
            onPressed: (){},
            iconSize: 30.0,
            color: Colors.white,
            icon: Icon(Icons.favorite_border)),

        IconButton(
            onPressed: (){},
            iconSize: 30.0,
            color: Colors.white,
            icon: Icon(Icons.more_horiz)),

        Spacer(),

        Text(
          "FOLLOWERS\n$followers",
          style:  TextStyle(
    fontSize: 12.0,
    color: Colors.grey[300],
    fontWeight: FontWeight.w500,
    letterSpacing: 2.0,
    ),
        )


        
      ],
    );
  }
}

