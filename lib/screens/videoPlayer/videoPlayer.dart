import 'package:flutter/material.dart';

import 'fittness_video_player/video_player_widget.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({Key key}) : super(key: key);

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Directory'),
        centerTitle: true,
        backgroundColor: Color(0xfff6f6f6),
        elevation: 0,
        leading: Icon(
          Icons.arrow_back_ios_outlined,
          color: Colors.black45,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  width: size.width - 20,
                  height: size.height * 0.6,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade300,
                            offset: Offset(0, 0),
                            blurRadius: 10,
                            spreadRadius: 10)
                      ]),
                  child: VideoPlayerWidget(
                    url:
                        'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4',
                    timestamps: <Duration>[
                      Duration(minutes: 0, seconds: 14),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.all(8),
                      height: 100,
                      width: size.width - 20,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade300,
                                offset: Offset(0, 0),
                                blurRadius: 10,
                                spreadRadius: 10)
                          ]),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/images/cover/1.jpg',
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Warms up'),
                              Text('Video Drama'),
                            ],
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.shade300,
                                            offset: Offset(0, 0),
                                            blurRadius: 7,
                                            spreadRadius: 7)
                                      ]),
                                  child: Image.asset('assets/images/play.png')),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '24:0',
                                style: TextStyle(color: Color(0xffc2b63e)),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 2,
                          )
                        ],
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
