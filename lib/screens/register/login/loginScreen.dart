import 'package:fitness_app_workout/screens/home/homeScreen.dart';
import 'package:fitness_app_workout/theme/colors.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      //resizeToAvoidBottomInset: false,

      //resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 15,right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //logo of the application goes over here
                Container(
                  height: size.height/3,
                  width: size.width,
                  child: Image.asset("assets/images/logoL.png",fit: BoxFit.contain,),
                ),

                Text("LOGIN", style: TextStyle(fontSize: 20),),
                SizedBox(height: 25,),

                Container(
                  width: double.infinity,
                  child: TextFormField(
                    scrollPhysics: AlwaysScrollableScrollPhysics(),
                    // validator: (value) {
                    //   if (value.isEmpty &
                    //       !_nameRegex.hasMatch(value) &
                    //       (_shopName.text.length < 2)) {
                    //     Fluttertoast.showToast(
                    //             msg: "Enter a valid shop name",
                    //             toastLength: Toast.LENGTH_SHORT,
                    //             gravity: ToastGravity.BOTTOM,
                    //             timeInSecForIosWeb: 1,
                    //             backgroundColor: MyColors.yellow,
                    //             textColor: Colors.black,
                    //             fontSize: 15.0)
                    //         .toString();
                    //   }
                    //   return null;
                    // },
                    //controller: _shopName,
                    //maxLength: 50,
                    keyboardType: TextInputType.emailAddress,

                    decoration: new InputDecoration(

                      hintText: "E-mail Id",
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                         // color: MyColors.yellow,
                          color: Colors.grey,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                      ),
                    ),
                    //style: MyTextStyle.formTextField,
                  ),
                ),

                SizedBox(height: 15,),
                //Spacer(flex:1),
                Container(
                  width: double.infinity,
                  child: TextFormField(
                    // validator: (value) {
                    //   if (value.isEmpty &
                    //       !_nameRegex.hasMatch(value) &
                    //       (_shopName.text.length < 2)) {
                    //     Fluttertoast.showToast(
                    //             msg: "Enter a valid shop name",
                    //             toastLength: Toast.LENGTH_SHORT,
                    //             gravity: ToastGravity.BOTTOM,
                    //             timeInSecForIosWeb: 1,
                    //             backgroundColor: MyColors.yellow,
                    //             textColor: Colors.black,
                    //             fontSize: 15.0)
                    //         .toString();
                    //   }
                    //   return null;
                    // },
                    //controller: _shopName,
                    //maxLength: 50,
                    keyboardType: TextInputType.emailAddress,

                    decoration: new InputDecoration(

                      hintText: "Password",
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                         // color: MyColors.yellow,
                          color: Colors.grey,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                      ),
                    ),
                    //style: MyTextStyle.formTextField,
                  ),
                ),
                SizedBox(height: 15,),

                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    child: Text("Forgot password?", style: TextStyle(color: OurColors.darkYellow),),
                  ),
                ),
                SizedBox(height: 30,),

                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: Container(
                    width: size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: OurColors.lightYellow,
                    ),
                    padding: EdgeInsets.all(20),
                    child: Center(
                      child: Text(
                        "Log in",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),

                // ListView.builder(
                //
                //     itemBuilder: (BuildContext context, index)  {
                //       return Container(color: Colors.red,);
                //     }
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
