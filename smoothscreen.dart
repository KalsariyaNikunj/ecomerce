import 'package:flutter/material.dart';
import 'package:loginpage/Homepage.dart';
import 'package:loginpage/main.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class screen extends StatefulWidget {


  static SharedPreferences ?prefs;
  const screen({Key? key}) : super(key: key);

  @override
  State<screen> createState() => _screenState();
}

class _screenState extends State<screen> {

  bool loginstatus=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashscreen();
  }
  Future<void> splashscreen() async {


   screen.prefs = await SharedPreferences.getInstance();
   setState(() {
     loginstatus=screen.prefs!.getBool("loginstatus")??false;
   });
   print("==$loginstatus");

   Future.delayed(Duration(seconds: 5)).then((value) {
        if(loginstatus)
          {

            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
              return homepage();
            },));
          }
        else
     {
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
         return loginform();
       },));
     }

   });

  }
  @override

  @override
  Widget build(BuildContext context) {


    return Scaffold(

              body:Container(height: double.infinity,width: double.infinity,child: Lottie.asset("Lottie/lf20_q4fu8eyb.json")),
    );
  }


}
