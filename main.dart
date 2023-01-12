import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:loginpage/Homepage.dart';
import 'package:loginpage/dropdownbutton.dart';
import 'package:loginpage/sliderbutton.dart';
import 'package:slidable_button/slidable_button.dart';
import 'package:slider_button/slider_button.dart';
import 'package:http/http.dart' as http;


import 'addproduct.dart';
import 'singup.dart';
import 'smoothscreen.dart';

void main() {
  runApp(MaterialApp(
    home:screen(),

   // loginform(),
    debugShowCheckedModeBanner: false,
  ));
}

class loginform extends StatefulWidget {
  const loginform({Key? key}) : super(key: key);

  @override
  State<loginform> createState() => _loginformState();
}

class _loginformState extends State<loginform> {
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();

  @override
  Widget build(BuildContext context) {
    double theight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
          child: Column(
        children: [
          Container(
            height: theight * 0.40,
            width: twidth,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("imagelogin/IMG-20221125-WA0007.jpg"),
                  fit: BoxFit.fill),
            ),
            child: Stack(children: [
              Positioned(
                  left: 30,
                  width: 80,
                  height: 200,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("imagelogin/light-1.png"))),
                  )),
              Positioned(
                  left: 130,
                  width: 80,
                  height: 150,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("imagelogin/light-2.png"))),
                  )),
              Positioned(
                left: 260,
                width: 80,
                height: 100,
                top: 40,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("imagelogin/clock.png"))),
                ),
              ),
              Positioned(
                  left: 180,
                  width: 210,
                  height: 80,
                  top: 180,
                  child: Text(
                    "Log In",
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
            ]),
          ),
          Padding(
            padding: EdgeInsets.all(30),
            child: Column(children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(143, 148, 251, 0.2),
                          blurRadius: 20,
                          offset: Offset(0, 10))
                    ]),
                child: Column(children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey),
                      ),
                    ),
                    child: TextField(
                      controller: email,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Email or Phone number",
                          hintStyle: TextStyle(color: Colors.grey[400])),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey),
                      ),
                    ),
                    child: TextField(
                      controller: password,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.grey[400])),
                    ),
                  )
                ]),
              ),
              SizedBox(
                height: 50,
              ),
              InkWell(onTap: () async {

                            String email1=email.text;
                            String password1=password.text;

                        Map loginmap={


                          "Email":email1,
                          "Password":password1,
                        };


                            var url = Uri.parse('https://nikunjstore.000webhostapp.com/Imagesdata/Login.php');
                            var response = await http.post(url,body: loginmap);
                            print('Response status: ${response.statusCode}');
                            print('Response body: ${response.body}');

                            var data2=jsonDecode(response.body);
                            logindata sb2=logindata.fromJson(data2);


                          if(sb2.connection==1)
                            {
                              if(sb2.result==1)
                                {

                                      String ? emaillog=sb2.userdata!.eMAIL;
                                      String ? passlog=sb2.userdata!.pASSWORD;
                                      String ? images=sb2.userdata!.iMAGES;
                                      String ? date=sb2.userdata!.dOB;
                                      String ? education=sb2.userdata!.eDUCTATION;
                                      String ? name=sb2.userdata!.nAME;
                                      String ? id=sb2.userdata!.iD;
                                      String ? number=sb2.userdata!.nUMBER;

                                      screen.prefs!.setBool("loginstatus", true);

                                      screen.prefs!.setString("emaillog", emaillog!);
                                      screen.prefs!.setString("passlog", passlog!);
                                      screen.prefs!.setString("images", images!);
                                      screen.prefs!.setString("date", date!);
                                      screen.prefs!.setString("education", education!);
                                      screen.prefs!.setString("name", name!);
                                      screen.prefs!.setString("id", id!);
                                      screen.prefs!.setString("number", number!);


                                          Navigator.push(context,MaterialPageRoute(builder: (context) {
                                            return homepage();
                                          },));
                                }
                              else{
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Email and password wrong"))) ;
                                Navigator.push(context,MaterialPageRoute(builder: (context) {
                                  return loginform();
                                },));

                              }
                            }










              },
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(143, 148, 251, 1),
                        Color.fromRGBO(143, 148, 251, 6)
                      ]),
                      //   color: Colors.indigo,
                    ),
                    height: 80,
                    width: twidth * 0.80,
                    child: Center(
                        child: Text(
                      "Submit",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ))),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Forget Password",
                style: TextStyle(
                  color: Color.fromRGBO(143, 148, 251, 1),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              // Center(child: SliderButton(
              //   action: () {
              //     ///Do something here
              //     Navigator.push(context, MaterialPageRoute(builder: (context) {
              //       return singup();
              //     },));
              //   },
              //   label: Text(
              //     "Sigh Up",
              //     style: TextStyle(
              //         color: Color(0xff4a4a4a), fontWeight: FontWeight.w500, fontSize: 17),
              //   ),
              //   icon: Text(
              //     "x",
              //     style: TextStyle(
              //       color: Colors.white,
              //       fontWeight: FontWeight.w400,
              //       fontSize: 44,
              //     ),
              //   ),
              //
              //
              // ))
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return singup();
                    },
                  ));
                },
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(143, 148, 251, 1),
                        Color.fromRGBO(143, 148, 251, 6)
                      ]),
                      //   color: Colors.indigo,
                    ),
                    height: 60,
                    width: twidth * 0.60,
                    child: Center(
                        child: Text(
                      "Sing Up",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ))),
              ),
              SizedBox(height: 10,width: double.infinity,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(onTap: () {

                  },
                    child: Container(height: 50,width: 50,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'imagelogin/1000_F_347468387_ngBE1hQcqRlRVh8d3UDi3YrKNnhfT6V7.jpg'),fit: BoxFit.contain)),
                    ),
                  ),
                  InkWell(onTap: () {


                  },
                    child: Container(height: 50,width: 50,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'imagelogin/facebook.png'),fit: BoxFit.contain)),
                    ),
                  ),
                  InkWell(onTap: () {

                  },
                    child: Container(height: 50,width: 50,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'imagelogin/yahoo.png'),fit: BoxFit.contain)),
                    ),
                  ),

                ],
              )
            ]),
          )
        ],
      )),
    );
  }
}
class logindata {
  int? connection;
  int? result;
  Userdata? userdata;

  logindata({this.connection, this.result, this.userdata});

  logindata.fromJson(Map<String, dynamic> json) {
    connection = json['connection'];
    result = json['result'];
    userdata = json['userdata'] != null
        ? new Userdata.fromJson(json['userdata'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['connection'] = this.connection;
    data['result'] = this.result;
    if (this.userdata != null) {
      data['userdata'] = this.userdata!.toJson();
    }
    return data;
  }
}

class Userdata {
  String? iD;
  String? nAME;
  String? eMAIL;
  String? nUMBER;
  String? pASSWORD;
  String? dOB;
  String? eDUCTATION;
  String? gENDER;
  String? hOBBY;
  String? iMAGES;

  Userdata(
      {this.iD,
        this.nAME,
        this.eMAIL,
        this.nUMBER,
        this.pASSWORD,
        this.dOB,
        this.eDUCTATION,
        this.gENDER,
        this.hOBBY,
        this.iMAGES});

  Userdata.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    nAME = json['NAME'];
    eMAIL = json['EMAIL'];
    nUMBER = json['NUMBER'];
    pASSWORD = json['PASSWORD'];
    dOB = json['DOB'];
    eDUCTATION = json['EDUCTATION'];
    gENDER = json['GENDER'];
    hOBBY = json['HOBBY'];
    iMAGES = json['IMAGES'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['NAME'] = this.nAME;
    data['EMAIL'] = this.eMAIL;
    data['NUMBER'] = this.nUMBER;
    data['PASSWORD'] = this.pASSWORD;
    data['DOB'] = this.dOB;
    data['EDUCTATION'] = this.eDUCTATION;
    data['GENDER'] = this.gENDER;
    data['HOBBY'] = this.hOBBY;
    data['IMAGES'] = this.iMAGES;
    return data;
  }
}

