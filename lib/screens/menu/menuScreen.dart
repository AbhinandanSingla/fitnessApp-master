import 'package:fitness_app_workout/screens/profileScreen/profile.dart';
import 'package:fitness_app_workout/screens/subscriptionScreen/subscription.dart';
import 'package:fitness_app_workout/screens/termsAndConditions/terms.dart';
import 'package:fitness_app_workout/theme/colors.dart';
import 'package:fitness_app_workout/theme/textStyle.dart';
import 'package:flutter/material.dart';

class OurMenu extends StatefulWidget {
  const OurMenu({Key key}) : super(key: key);

  @override
  _OurMenuState createState() => _OurMenuState();
}

class _OurMenuState extends State<OurMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: OurColors.white,
        title: Text(
          "Deepak, Chandigarh",
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

      body:SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 15,right: 15),
          child: Column(
            children: [
              SizedBox(height: 10,),
              Card(
                elevation: 3,
                margin: EdgeInsets.only(top: 10,bottom: 10),
                child: Container(
                  padding: EdgeInsets.only(top: 15,bottom: 15 ,left: 15,right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Text("Trainer No"),

                      Text("Binoooooi", style: OurTextStyle.menuTileGrey,),

                    ],

                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfileScreen()));

                },
                child: Card(
                  elevation: 3,
                  margin: EdgeInsets.only(top: 10,bottom: 10),
                  child: Container(
                    padding: EdgeInsets.only(top: 15,bottom: 15 ,left: 15,right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Text("Trainer Profile"),

                        Text("Person Name", style: OurTextStyle.menuTileGrey,),

                      ],

                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> SubscriptionScreen()));

                },
                child: Card(
                  elevation: 3,
                  margin: EdgeInsets.only(top: 10,bottom: 10),
                  child: Container(
                    padding: EdgeInsets.only(top: 15,bottom: 15 ,left: 15,right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Text("Subscription"),

                        Text("Expires 10/08/200", style: OurTextStyle.menuTileGrey,),

                      ],

                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> TermsConditions()));
                },
                child: Card(
                  elevation: 3,
                  margin: EdgeInsets.only(top: 10,bottom: 10),
                  child: Container(
                    padding: EdgeInsets.only(top: 15,bottom: 15 ,left: 15,right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Text("Terms and Conditions"),

                        //Text("Binoooooi"),

                      ],

                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )

    );
  }
}
