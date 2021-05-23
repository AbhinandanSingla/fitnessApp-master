import 'package:auto_size_text/auto_size_text.dart';
import 'package:fitness_app_workout/models/playlistTileModel.dart';
import 'package:fitness_app_workout/theme/textStyle.dart';
import 'package:flutter/material.dart';

class PlaylistTile extends StatefulWidget {

  final PlayListTileModel data;

  PlaylistTile({this.data});

  @override
  _PlaylistTileState createState() => _PlaylistTileState();
}

class _PlaylistTileState extends State<PlaylistTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 3,
          child: Container(
            height: 100,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex:2,
                  child: Image.asset(
                   widget.data.image,
                    fit: BoxFit.fill,
                  ),
                ),
                Spacer(flex: 1,),
                Expanded(
                  flex:4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Spacer(flex: 2),
                      AutoSizeText(widget.data.songName
                        ,overflow: TextOverflow.ellipsis,minFontSize: 6,maxLines: 1,style: OurTextStyle.songNameTile,),
                      Spacer(flex: 1),
                      AutoSizeText(widget.data.genres,maxLines: 1, overflow: TextOverflow.ellipsis,maxFontSize: 12,style: OurTextStyle.genreTile,),
                      Spacer(flex: 2),
                    ],
                  ),
                ),
                Expanded(
                  flex:2,
                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        color: Colors.grey,
                        child: Icon(
                          Icons.play_circle_fill,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                      Text(widget.data.duration)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 15,
        )
      ],
    );
  }
}
