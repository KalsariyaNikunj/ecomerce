
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:loginpage/main.dart';



class singup extends StatefulWidget {
  const singup({Key? key}) : super(key: key);

  @override
  State<singup> createState() => _singupState();
}

class _singupState extends State<singup> {

  String Gender = "Male";
  bool Singging=false;
  bool Cricketsta = false;
  bool Dansingsta=false;
  bool Readingsta=false;

  List<bool> abc=[false,false,false,false];
  List<String> hobbys=["Cricket","Sinnging","Dancing","Reading"];

  String dropdownvalue = '10th';
  List<String> items = [
    '10th',
    '12th',
    'BE Eng',
    'ME Eng',
  ];

  TextEditingController name=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController number=TextEditingController();
  TextEditingController password=TextEditingController();



  final RegExp emailExp = new RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  final RegExp nameExp= new RegExp(r'[A-Z]{5}[0-9]{4}[A-Z]{1}$');
  final RegExp numberExp=new RegExp( r'(^(?:[+0]9)?[0-9]{10,12}$)');
  final RegExp passwordExp=new RegExp(r'[!@#$%^&*(),.?":{}|<>]');


  bool namestatus = false;
  String eroname = "Enter your name";

  bool emailstatus = false;
  String eroemail = "Enter your name";

  bool paswstatus = false;
  String eropaswtext = "Enter your password";


  bool fnumberstatus=false;
  String eronumbertext="Enter your mobilenumber";





  //
  // DateTime selectedDate = DateTime.now();
  //
  //
  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //       context: context,
  //       initialDate: selectedDate,
  //       firstDate: DateTime(2015, 8),
  //       lastDate: DateTime(2101));
  //   if (picked != null && picked != selectedDate) {
  //     setState(() {
  //       selectedDate = picked;
  //     });
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    double theight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;









    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            child: Column(
          children: [
            Container(
              height: theight * 0.30,
              width: twidth,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("imagelogin/IMG-20221125-WA0007.jpg"),
                    fit: BoxFit.fill),
              ),
              child: Stack(
                children: [
                  Positioned(
                      left: 100,
                      width: 210,
                      height: 80,
                      top: 60,
                      child: Text(
                        "Sing Up",
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Column(
                      children: [
                        ElevatedButton.icon(
                            onPressed: () async {
                              Navigator.pop(context);
                              final ImagePicker _picker = ImagePicker();

                              final XFile? photo = await _picker.pickImage(
                                  source: ImageSource.camera);

                              setState(() {
                                img = photo!.path;
                              });
                            },
                            icon: Icon(Icons.camera),
                            label: Text("Camera")),
                        ElevatedButton.icon(
                            onPressed: () async {
                              Navigator.pop(context);
                              final ImagePicker _picker = ImagePicker();
                              final XFile? images = await _picker.pickImage(
                                  source: ImageSource.gallery);

                              setState(() {
                                img = images!.path;
                              });
                            },
                            icon: Icon(Icons.browse_gallery),
                            label: Text("Gallary"))
                      ],
                    );
                  },
                );
              },
              child: Container(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: FileImage(File(img)),
                ),
              ),
            ),
            Container(
              height: 80,
              width: twidth * 0.60,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(),
              child: TextField(
                controller: name,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Your Name",
                    hintStyle: TextStyle(color: Colors.grey[400])),
              ),
            ),
            Container(
              height: 80,
              width: twidth * 0.60,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(),
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter your email id ",
                    hintStyle: TextStyle(color: Colors.grey[400])),
              ),
            ),
            Container(
              height: 80,
              width: twidth * 0.60,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(),
              child: TextField(
                controller: number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Number",
                  hintStyle: TextStyle(color: Colors.grey[400]),
                ),
              ),
            ),
            Container(
              height: 80,
              width: twidth * 0.60,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(),
              child: TextField(
                controller: password,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.grey[400]),
                ),
              ),
            ),
            Container(
              height: 80,
              width: twidth * 0.60,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(),
              child: TextField(
                  controller: dd,
                  onTap: () async {
                    {
                      DateTime? pickdte = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2050));

                      if (pickdte != null) {
                        String formt = DateFormat('dd-MM-yyyy').format(pickdte);
                        setState(() {
                          dd.text = formt.toString();
                        });
                      }
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Dob",
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    icon: Icon(Icons.calendar_today_outlined),
                  )),
            ),



               // Container(
               //    height: 80,
               //    width: twidth * 0.60,
               //    padding: EdgeInsets.all(8),
               //    decoration: BoxDecoration(),
               //    child: TextField(
               //      decoration: InputDecoration(
               //          border: OutlineInputBorder(),
               //          hintText: "Enter your number ",
               //          hintStyle: TextStyle(color: Colors.grey[400])),
               //    ),
               //  ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 25),
                  child: const Icon(Icons.star),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 60,
                  width: 290,
                  margin:
                  const EdgeInsets.only(top: 10, right: 20, left: 25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: dropdownvalue,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),

            Row(
              children: [
                SizedBox(
                  height: 20,
                  width: 80,
                ),
                Text("Male"),
                Radio(
                  onChanged: (value) {
                    setState(() {
                      Gender = value.toString();
                    });
                  },
                  value: "Male",
                  groupValue: Gender,
                ),
                SizedBox(
                  height: 20,
                  width: 50,
                ),
                Text("Female"),
                Radio(
                  onChanged: (value) {
                    setState(() {
                      Gender = value.toString();
                    });
                  },
                  value: "Female ",
                  groupValue: Gender,
                ),
              ],
            ),



            Row(
              children: [
                // SizedBox(
                //   height: 20,
                //   width: 40,
                // ),
                Container(
                  height: 20,
                  width: 60,
                  decoration: BoxDecoration(),
                  child: Text("Hobby:-"),
                ),
                Container(height: 50 ,
                  child: ListView.builder(scrollDirection: Axis.horizontal,shrinkWrap: true,itemCount: abc.length,itemBuilder: (context, index) {
                    return Row(
                      children: [ Text(hobbys[index]),
                        Checkbox(
                          onChanged: (value) {
                            setState(() {
                             abc[index] = value!;
                            });
                          },
                          value: abc[index],
                        ),

                      ],
                    );
                  },),
                ),



                // Text("Singging"),
                // Checkbox(
                //   onChanged: (value) {
                //     setState(() {
                //       Singging = value!;
                //     });
                //   },
                //   value: Singging,
                // ),
                //
                //
                // Text("Dansing"),
                // Checkbox(
                //   onChanged: (value) {
                //     setState(() {
                //       Dansingsta = value!;
                //     });
                //   },
                //   value: Dansingsta,
                // ),
                //
                // Text("Reading"),
                // Checkbox(
                //   onChanged: (value) {
                //     setState(() {
                //       Readingsta = value!;
                //     });
                //   },
                //   value: Readingsta,
                // )


              ],
            ),

            InkWell(
              onTap: () async {

                String namess = name.text;
                String emaill = email.text;
                String passwordd = password.text;
                String numbere=number.text;
                String datee = dd.text;
                List selecthobby=[];
                for(int i=0;i<hobbys.length;i++){
                  if(abc[i]){
                      selecthobby.add(hobbys[i]);
                  }
                }

                List<int> iii=File(img).readAsBytesSync();
                String images=base64Encode(iii);

                Map data={
                  "Name":namess,
                  "Email":emaill,
                  "Password":passwordd,
                  "Number":numbere,
                  "Dob":datee,
                  "Education":dropdownvalue,
                  "Gender": Gender,
                  "Hobby":hobbys[0],
                  "Images":images
                };

                var url = Uri.parse('https://nikunjstore.000webhostapp.com/Imagesdata/register.php');
                var response = await http.post(url, body:data );
                print('Response status: ${response.statusCode}');
                print('Response body: ${response.body}');

                var data1=jsonDecode(response.body);
                mysingupdata sb=mysingupdata.fromJson(data1);

                if(sb.connection==1)
                  {
                      if(sb.result==1)
                        {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Regerster Succsesfully"))) ;
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return loginform();
                          },));
                        }
                      else if(sb.result==2)
                      {

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Already Exit"))) ;
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
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
                  ),


                  ),

              ),


            ),
          ],
        )),
      ),
    );
  }
  String? mm;
  String img = "";
  TextEditingController dd = TextEditingController();
  TextEditingController education = TextEditingController();
}
class mysingupdata {
  int? connection;
  int? result;

  mysingupdata({this.connection, this.result});

  mysingupdata.fromJson(Map<String, dynamic> json) {
    connection = json['connection'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['connection'] = this.connection;
    data['result'] = this.result;
    return data;
  }
}
