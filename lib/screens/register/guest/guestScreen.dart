import 'package:fitness_app_workout/screens/register/login/loginScreen.dart';
import 'package:fitness_app_workout/screens/register/signup/signup.dart';
import 'package:fitness_app_workout/theme/colors.dart';
import 'package:flutter/material.dart';

class GuestScreen extends StatefulWidget {
  const GuestScreen({Key key}) : super(key: key);

  @override
  _GuestScreenState createState() => _GuestScreenState();
}

class _GuestScreenState extends State<GuestScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              height: size.height,
              width: size.width,
              child: Image.asset(
                "assets/images/guest.png",
                fit: BoxFit.fill,
              ),
            ),
            Container(
              width: size.width,
              height: size.height,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                      },
                      child: Container(
                        width: size.width - 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: OurColors.white,
                        ),
                        padding: EdgeInsets.all(20),
                        child: Center(
                          child: Text(
                            "LOG IN",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40,),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()));

                      },
                      child: Container(
                        width: size.width - 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: OurColors.lightYellow,
                        ),
                        padding: EdgeInsets.all(20),
                        child: Center(
                          child: Text(
                            "REGISTER",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    // TextButton(
                    //   child: Text(
                    //     "LOG IN",
                    //     style: TextStyle(color: Colors.black),
                    //   ),
                    //   onPressed: () {},
                    //   style: ButtonStyle(
                    //     backgroundColor: MaterialStateProperty.all<Color>(
                    //         OurColors.lightYellow),
                    //     //padding: MaterialStateProperty<EdgeInsetsGeometry>(EdgeInsets.lerp(a, b, t))
                    //   ),
                    // ),
                    // TextButton(
                    //   child: Text(
                    //     "REGISTER",
                    //     style: TextStyle(color: Colors.black),
                    //   ),
                    //   onPressed: () {},
                    //   style: TextButton.styleFrom(
                    //       backgroundColor: OurColors.white,
                    //       padding: EdgeInsets.only(
                    //           left: 20, right: 20, top: 20, bottom: 20)),
                    // ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
