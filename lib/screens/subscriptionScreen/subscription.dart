import 'package:auto_size_text/auto_size_text.dart';
import 'package:fitness_app_workout/theme/colors.dart';
import 'package:fitness_app_workout/theme/textStyle.dart';
import 'package:flutter/material.dart';


class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: OurColors.white,
        title: Text(
          "Subscription",
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                ...List.generate(10, (index)  {
                  return Card(
                    elevation: 3,
                    margin: EdgeInsets.only(top: 10,bottom: 10),
                    child: Container(
                      padding: EdgeInsets.only(top: 15,bottom: 15 ,left: 15,right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Flexible(
                              flex: 2,
                              child: AutoSizeText("Starting 10/05/2021", style: OurTextStyle.subscription,maxLines: 1, overflow: TextOverflow.ellipsis,)),

                          Flexible(
                              flex: 2,
                              child: AutoSizeText("Expires 10/05/2021", style: OurTextStyle.subscription,maxLines: 1, overflow: TextOverflow.ellipsis,)),
                          Flexible(
                              flex: 1,
                              child: AutoSizeText("Paid",maxLines: 1, overflow: TextOverflow.ellipsis,))
                        ],

                      ),
                    ),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
