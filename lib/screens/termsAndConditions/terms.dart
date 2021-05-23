import 'package:fitness_app_workout/theme/colors.dart';
import 'package:flutter/material.dart';


class TermsConditions extends StatelessWidget {
  const TermsConditions({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: OurColors.white,
        title: Text(
          "Terms and Condition",
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
              Text("Lorem ipsum dolor sit amet. Eos possimus dolores non molestiae galisum eos totam necessitatibus et voluptate eum voluptates aspernatur non doloribus laudantium quo fugit reiciendis. Quo autem velit et maxime illum rem ipsam quisquam ea quia quia et sint odit. Est quam rerum et fugiat consectetur id nobis nulla sit doloribus quis et quos asperiores id incidunt ratione. Vel deserunt deleniti ut nihil vero quo consequatur blanditiis a facere aspernatur et quos dicta."

          "Id sint tempora in consectetur in enim voluptatem non sunt reprehenderit ut molestiae odit? Non libero maxime sed itaque adipisci id amet dolor aut obcaecati nesciunt vel voluptas doloremque qui libero minima sed omnis illo. Aut quas assumenda a consequatur itaque sit provident perspiciatis ab internos delectus a aspernatur sequi est dolor placeat? Ex odit eligendi et iure temporibus cum eius magnam."

          "Et internos numquam eum quia vitae qui necessitatibus magnam nam minima voluptas eos incidunt necessitatibus? Est quia doloribus vel quam voluptas a consequatur eveniet et beatae molestiae et sunt necessitatibus aut sequi libero."),
              Text("Lorem ipsum dolor sit amet. Eos possimus dolores non molestiae galisum eos totam necessitatibus et voluptate eum voluptates aspernatur non doloribus laudantium quo fugit reiciendis. Quo autem velit et maxime illum rem ipsam quisquam ea quia quia et sint odit. Est quam rerum et fugiat consectetur id nobis nulla sit doloribus quis et quos asperiores id incidunt ratione. Vel deserunt deleniti ut nihil vero quo consequatur blanditiis a facere aspernatur et quos dicta."

          "Id sint tempora in consectetur in enim voluptatem non sunt reprehenderit ut molestiae odit? Non libero maxime sed itaque adipisci id amet dolor aut obcaecati nesciunt vel voluptas doloremque qui libero minima sed omnis illo. Aut quas assumenda a consequatur itaque sit provident perspiciatis ab internos delectus a aspernatur sequi est dolor placeat? Ex odit eligendi et iure temporibus cum eius magnam."

          "Et internos numquam eum quia vitae qui necessitatibus magnam nam minima voluptas eos incidunt necessitatibus? Est quia doloribus vel quam voluptas a consequatur eveniet et beatae molestiae et sunt necessitatibus aut sequi libero."),
              Text("Lorem ipsum dolor sit amet. Eos possimus dolores non molestiae galisum eos totam necessitatibus et voluptate eum voluptates aspernatur non doloribus laudantium quo fugit reiciendis. Quo autem velit et maxime illum rem ipsam quisquam ea quia quia et sint odit. Est quam rerum et fugiat consectetur id nobis nulla sit doloribus quis et quos asperiores id incidunt ratione. Vel deserunt deleniti ut nihil vero quo consequatur blanditiis a facere aspernatur et quos dicta."

          "Id sint tempora in consectetur in enim voluptatem non sunt reprehenderit ut molestiae odit? Non libero maxime sed itaque adipisci id amet dolor aut obcaecati nesciunt vel voluptas doloremque qui libero minima sed omnis illo. Aut quas assumenda a consequatur itaque sit provident perspiciatis ab internos delectus a aspernatur sequi est dolor placeat? Ex odit eligendi et iure temporibus cum eius magnam."

          "Et internos numquam eum quia vitae qui necessitatibus magnam nam minima voluptas eos incidunt necessitatibus? Est quia doloribus vel quam voluptas a consequatur eveniet et beatae molestiae et sunt necessitatibus aut sequi libero."),
            ],
          ),
        ),
      ),
    );
  }
}
