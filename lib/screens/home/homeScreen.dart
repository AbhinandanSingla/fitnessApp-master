import 'package:auto_size_text/auto_size_text.dart';
import 'package:fitness_app_workout/data/data.dart';
import 'package:fitness_app_workout/screens/home/widgets/myplaylistTile.dart';
import 'package:fitness_app_workout/screens/menu/menuScreen.dart';
import 'package:fitness_app_workout/theme/colors.dart';
import 'package:fitness_app_workout/theme/textStyle.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // this is the function that will be used to create a playlist by the user
  void _showFilters(double w) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ), //this right here
              child: Container(
                height: w,
                child: Stack(
                  children: [
                    Container(
                      height: w,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: OurColors.lightYellow,
                      ),
                    ),
                    Container(
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              height: 50,
                              child: Center(
                                  child: Text(
                                "Create Playlist",
                                style: OurTextStyle.boldHeading3,
                              ))),
                          Container(
                            width: double.infinity,
                            height: w - 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: OurColors.white,
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, right: 10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  TextField(
                                    decoration: InputDecoration(
                                        hintText: "Name Playlist",
                                        hintStyle: OurTextStyle.genreTile),
                                  ),
                                  Container(
                                    width: 250,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.black,
                                    ),
                                    child: Center(
                                        child: Text(
                                      "Create",
                                      style: OurTextStyle.buttonValueCreate,
                                    )),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: OurColors.white,
        title: Text(
          "Deepak, Chandigarh",
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => OurMenu()));
          },
            child: Image.asset("assets/images/menu.png")
                
                
        ),
        actions: [
          Image.asset("assets/images/logoL.png"),
          //Icon(Icons.arrow_back_ios)
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              child: Text(
                "Audio Albums",
                style: OurTextStyle.boldHeading2,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 15,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 220,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, index) {
                    return Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              //color: Colors.black,
                              width: 150,
                              height: 150,
                              child: Image.asset("assets/images/cover/3.jpg"),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Name of the song",
                              style: OurTextStyle.songName,
                            ),
                            Text(
                              "by the artist",
                              style: OurTextStyle.artistName,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        )
                      ],
                    );
                  }),
            ),
          ),

          /// ---- the Video Directory UI begins over here now ---------------------------------------------///
          SliverToBoxAdapter(
            child: Container(
              child: Text(
                "Video Directory",
                style: OurTextStyle.boldHeading2,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 15,
            ),
          ),

          SliverToBoxAdapter(
              child: Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (BuildContext context, index) {
                return Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(29),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(
                          width: 200,
                          height: 200,
                          child: Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 200,
                                    height: 130,
                                    child: Image.asset(
                                      "assets/images/cover/1.jpg",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 15, top: 5),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Name of the song",
                                          style: OurTextStyle.songName,
                                        ),
                                        Text(
                                          "by the artist",
                                          style: OurTextStyle.artistName,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Positioned(
                                bottom: 40,
                                right: 5,
                                child: Card(
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
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    )
                  ],
                );
              },
            ),
          )),

          /// ----------------------- ENd of the video directory UI here ------------------------------------///
          SliverToBoxAdapter(
            child: SizedBox(
              height: 15,
            ),
          ),

          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    "My Playlist",
                    style: OurTextStyle.boldHeading2,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    var w = MediaQuery.of(context).size.height / 3 + 50;
                    _showFilters(w);
                  },
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    color: OurColors.lightYellow,
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 15, right: 15, top: 8, bottom: 8),
                      // decoration: BoxDecoration(
                      //   color: OurColors.lightYellow,
                      //   borderRadius: BorderRadius.circular(10)
                      // ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.add,
                            size: 14,
                          ),
                          Text("Create")
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 15,
            ),
          ),

          SliverList(
              delegate: SliverChildBuilderDelegate((context, int index) {
            return PlaylistTile(
              data: playListTileList[index],
            );
          }, childCount: playListTileList.length))
        ],
      ),
    );
  }
}
