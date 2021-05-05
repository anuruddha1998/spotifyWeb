import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/main.dart';
import '../data/data.dart';


class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 280.0,
      color: Colors.black,
      child: Column(
        children: [
          //image
        Row(
         children: [
           Padding(
             padding: const EdgeInsets.all(16.0),
             child: Image(image: AssetImage(
               'assets/spotify_logo.png',
             ),
               height: 55.0,
               filterQuality: FilterQuality.high,),
           ),
         ],
        ),

             _SideMenuIconTab(
             iconData: Icons.home,
               title: "Home",
               onTap: (){

               },
             ),

          _SideMenuIconTab(
            iconData: Icons.search,
            title: "Search",
            onTap: (){

            },
          ),

          _SideMenuIconTab(
            iconData: Icons.audiotrack,
            title: "Radio",
            onTap: (){

            },
          ),

          //library and play lists
          _LibraryPlayList()


        ],
      ),

    );
  }
}


//menu icon
class _SideMenuIconTab extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onTap;


  _SideMenuIconTab(
     { Key? key,
      required this.iconData,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(iconData,
        color: Colors.white,
        size: 28.0,),

      title: Text(title,
        style:  TextStyle(
          color: Colors.grey[300],
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.0,
        ),
        overflow: TextOverflow.ellipsis,),
        onTap: onTap,

    );
  }
}



//library and play lists
class _LibraryPlayList extends StatefulWidget {
  @override
  __LibraryPlayListState createState() => __LibraryPlayListState();
}

class __LibraryPlayListState extends State<_LibraryPlayList> {
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Expanded(

      child: Scrollbar(
        isAlwaysShown: true,
        controller: _scrollController,
        child: ListView(
          controller: _scrollController,
           padding: EdgeInsets.symmetric(vertical: 12.0),
          physics: ClampingScrollPhysics(),
          children: [

            //library column
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //title
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0,
                      vertical: 8.0),
                  child: Text("YOUR LIBRARY",
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey[300],
                      fontWeight: FontWeight.w500,
                      letterSpacing: 2.0,
                    ),
                    overflow: TextOverflow.ellipsis,),
                ),

                //library list from data
                ...yourLibrary.map((e) => ListTile(
                  dense: true,
                  title: Text(
                    e,
                    style: TextStyle(
                      color: Colors.grey[300],
                      letterSpacing: 1.0,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                )).toList(),

              ],
            ),

            const SizedBox(height: 24.0,),

            //playlists column
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //title
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0,
                      vertical: 8.0),
                  child: Text("PLAY LISTS",
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey[300],
                      fontWeight: FontWeight.w500,
                      letterSpacing: 2.0,
                    ),
                    overflow: TextOverflow.ellipsis,),
                ),


                //library list from data
                ...playlists.map((e) => ListTile(
                  dense: true,
                  title: Text(
                    e,
                    style: TextStyle(
                      color: Colors.grey[300],
                      letterSpacing: 1.0,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                )).toList(),


              ],
            )

          ],
        ),
      ),
    );
  }
}

