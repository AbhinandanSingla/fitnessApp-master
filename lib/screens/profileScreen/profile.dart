import 'package:fitness_app_workout/theme/colors.dart';
import 'package:fitness_app_workout/theme/textStyle.dart';
import 'package:flutter/material.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: OurColors.white,
        title: Text(
          "Trainer Profile",
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back_ios, color: Colors.black,)),
        actions: [
          Image.asset("assets/images/logoL.png"),
          //Icon(Icons.arrow_back_ios)
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              CircleAvatar(
                radius: 60,
              ),

              SizedBox(height: 25,),
              Row(
                children: [
                  Expanded(
                    //width: size.width/3,
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

                        hintText: "Surname",
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
                  SizedBox(width: 10,),
                  Expanded(
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

                        hintText: "First Name",
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
                ],
              ),
              SizedBox(height: 15,),
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
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(top: 13.0, right: 10),
                      child: Text("Change", style: OurTextStyle.change,),
                    ),
                    //contentPadding: EdgeInsets.only(right: 10),


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

                    hintText: "Mobile Number",
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
              Container(
                width: double.infinity,
                child: TextFormField(
                  keyboardType: TextInputType.text,

                  decoration: new InputDecoration(
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(top: 13.0, right: 10),
                      child: Text("Change", style: OurTextStyle.change,),
                    ),
                    hintText: "Country",
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
              Container(
                width: double.infinity,
                child: TextFormField(
                  keyboardType: TextInputType.text,

                  decoration: new InputDecoration(

                    hintText: "Type",
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

            ],
          ),
        ),
      ),
    );
  }
}
