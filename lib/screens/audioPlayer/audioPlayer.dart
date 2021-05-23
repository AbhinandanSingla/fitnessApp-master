import 'package:flutter/material.dart';

class AudioPlayerScreen extends StatefulWidget {
  const AudioPlayerScreen({Key key}) : super(key: key);

  @override
  _AudioPlayerScreenState createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios_outlined,
          color: Colors.black45,
        ),
        title: Text('Audio Albums'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 25),
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 0),
                      blurRadius: 4,
                      spreadRadius: 8,
                      color: Colors.grey.shade200)
                ]),
                child: Column(
                  children: [
                    Image.asset('assets/images/cover/2.jpg'),
                    SizedBox(height: 20,),
                    Text('The Weeked- StarBoy(Offical)'),
                    Text('ft.Draft Punk'),
                    SizedBox(height: 5,),
                    Image.asset(
                      'assets/images/Path 216.png',
                      color: Colors.red,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('00.00'), Text('20.00')],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                            child: Image.asset('assets/images/loop.png'),
                            onTap: null),
                        buildInkWell(
                            'assets/images/previous.png', 50, 50, null),
                        buildInkWell('assets/images/pause.png', 80, 80, null),
                        buildInkWell('assets/images/forward.png', 50, 50, null),
                        InkWell(
                          child: Image.asset('assets/images/loop.png'),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50,
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
                                blurRadius: 8,
                                spreadRadius: 8)
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

InkWell buildInkWell(
    String image, double width, double height, Function ontap) {
  return InkWell(
    onTap: ontap,
    child: Container(
        child: Image.asset(image),
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 0.2,
                  offset: Offset(0, 0),
                  spreadRadius: 4)
            ],
            borderRadius: BorderRadius.circular(50))),
  );
}
