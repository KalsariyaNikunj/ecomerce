import 'package:flutter/material.dart';
import 'package:slidable_button/slidable_button.dart';
import 'package:slider_button/slider_button.dart';


class slider extends StatefulWidget {
  const slider({Key? key}) : super(key: key);

  @override
  State<slider> createState() => _sliderState();
}

class _sliderState extends State<slider> {
  String result="";
  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: SliderButton(
      action: () {
        ///Do something here
        Navigator.of(context).pop();
      },
      label: Text(
        "Slide to cancel Event",
        style: TextStyle(
            color: Color(0xff4a4a4a), fontWeight: FontWeight.w500, fontSize: 17),
      ),
      icon: Text(
        "x",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: 44,
        ),
      ),


    )));
  }
}
