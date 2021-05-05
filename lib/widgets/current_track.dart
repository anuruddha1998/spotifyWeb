import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/models/current_track.dart';
import 'package:provider/provider.dart';

class CurrentTrack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84.0,
      width: double.infinity,
      color: Colors.black87,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            _TrackInfo(),
            const Spacer(),
            _PlayerController(),
            const Spacer(),
            if(MediaQuery.of(context).size.width > 800)_MoreControllers()

          ],
        ),
      ),
    );
  }
}

class _TrackInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentTrackModel>().selected;
    if(selected == null){
      return SizedBox.shrink();
    }
    return Row(
      children: [
        Image.asset('assets/lofigirl.jpg',
          height: 60.0,
          width: 60.0,
          fit: BoxFit.cover,),
        SizedBox(width: 12.0,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text(
            selected.title,
            style: TextStyle(
              color: Colors.grey[300],
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.0,
            ),
          ),
            SizedBox(height: 4.0,),
            Text(
              selected.artist,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                color: Colors.grey,
                fontSize: 12.0
              ),
            )
          ],
        ),
        SizedBox(width: 12.0,),
        IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border,color: Colors.pink,))

      ],
    );

  }
}

class _PlayerController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentTrackModel>().selected;
    return Column(
      children: [
//control bar
        Row(
          children: [
            IconButton(onPressed: (){},
                padding: EdgeInsets.only(),
             icon: Icon(Icons.shuffle),
              iconSize: 20.0,
              color: Colors.white,
            ),

            IconButton(onPressed: (){},
              padding: EdgeInsets.only(),
              icon: Icon(Icons.skip_previous_outlined),
              iconSize: 20.0,
              color: Colors.white,
            ),

            IconButton(onPressed: (){},
              padding: EdgeInsets.only(),
              icon: Icon(Icons.play_arrow_rounded),
              iconSize: 20.0,
              color: Colors.white,
            ),

            IconButton(onPressed: (){},
              padding: EdgeInsets.only(),
              icon: Icon(Icons.skip_next_outlined),
              iconSize: 20.0,
              color: Colors.white,
            ),

            IconButton(onPressed: (){},
              padding: EdgeInsets.only(),
              icon: Icon(Icons.repeat),
              iconSize: 20.0,
              color: Colors.white,
            )

          ],
        ),
        SizedBox(height: 4.0,),

        //music bar
        Row(
          children: [
           Text("0.00",style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.white),),

            SizedBox(width: 8.0,),

            Container(width: MediaQuery.of(context).size.width* 0.3,
                 height: 5.0,
                decoration: BoxDecoration(
                 color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(2.5)
                ),),

            SizedBox(width: 8.0,),

            Text(selected?.duration ?? '0.00',
            style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.white),)


          ],
        )


      ],
    );
  }
}

class _MoreControllers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: (){}, icon: Icon(Icons.devices_outlined,size: 20.0,color: Colors.white,)),

        Row(
          children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.volume_up,size: 20.0,color: Colors.white,)),
            Container(
              width: 70.0,
              height: 5.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.5),
                color: Colors.grey[800]
              ),
            )
          ],
        ),
        IconButton(onPressed: (){}, icon: Icon(Icons.fullscreen,size: 20.0,color: Colors.white,)),

      ],
    );
  }
}



