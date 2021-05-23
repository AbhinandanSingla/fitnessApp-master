import 'package:fitness_app_workout/screens/register/guest/guestScreen.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(seconds: 2)).then((value) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => GuestScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    print(size.width);
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Container(
                height: size.height,
                width: size.width,
                child: Image.asset(
                  "assets/images/splash.png", fit: BoxFit.fill,),
              ),
              Positioned(
                left:1,
                right: 1,
                bottom: 15,
                  child:Container(
                    child: Center(child: Text("Total fitness group pvt ltd \n maldives".toUpperCase(), textAlign: TextAlign.center,)),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
