import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:loginpage/Homepage.dart';
import 'package:loginpage/discribep.dart';
import 'package:loginpage/smoothscreen.dart';
import 'package:http/http.dart' as http;

import 'updateproduct.dart';

class viewproduct extends StatefulWidget {
  const viewproduct({Key? key}) : super(key: key);

  @override
  State<viewproduct> createState() => _viewproductState();
}

class _viewproductState extends State<viewproduct> {
  String? ide;
  String? userid;
  Aaddproductdata? sb2;
  bool viewdata1=false;
  deletproductt ?delepro;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userid = screen.prefs!.getString("id") ?? "";

    forview();
  }

  Future<void> forview() async {
    Map viewdata = {
      'loginid': userid,
    };
    var url = Uri.parse(
        'https://nikunjstore.000webhostapp.com/Imagesdata/addproduct/viewproduct.php');
    var response = await http.post(url, body: viewdata);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    var data2 = jsonDecode(response.body);
    setState(() {
      sb2 = Aaddproductdata.fromJson(data2);
    });

    if(sb2!.connection==1)
      {
        if(sb2!.result==1)
          {
            setState(() {
              viewdata1=true;
            });
          }
      }
  }

  @override
  Widget build(BuildContext context) {
    return viewdata1?Scaffold(
      body: ListView.builder(
          itemCount: sb2!.productdata!.length,
          itemBuilder: (context, index) {
            return Slidable(startActionPane: ActionPane(motion: StretchMotion(), children: [
              // A SlidableAction can have an icon and/or a label. vf
              SlidableAction(
                onPressed: (context) async {
                            ide=sb2!.productdata![index].iD;
                  Map deletmap={
                    'id':ide,
                  };
                  print("==================${ide}");


                              var url = Uri.parse('https://nikunjstore.000webhostapp.com/Imagesdata/delete.php');
                              var response = await http.post(url, body: deletmap);
                              print('Response status: ${response.statusCode}');
                              print('Response body: ${response.body}');

                              var dp=jsonDecode(response.body);

                             delepro=deletproductt.fromJson(dp);

                              if(delepro!.connection==1)
                                {
                                  if(delepro!.result==1)
                                    {
                                      setState(() {
                                        forview();
                                      });

                                    }
                                }



                },
                backgroundColor: Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
              SlidableAction(
                onPressed: (context) {
                          Navigator.push(context,MaterialPageRoute(builder: (context) {
                            return updatep(sb2!.productdata![index]);
                          },));



                },
                backgroundColor: Color(0xFF21B7CA),
                foregroundColor: Colors.white,
                icon: Icons.update,
                label: 'Update',
              ),


            ]),
              child: InkWell(onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return diproduct(sb2!.productdata![index]);
                },));
              },
                child: ListTile(
                  title: Text("${sb2!.productdata![index].pNAME}"),
                  leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://nikunjstore.000webhostapp.com/Imagesdata/addproduct/${sb2!.productdata![index].pIMAGES}")),
                  subtitle: Text("${sb2!.productdata![index].pSELLING}"),
                  trailing: Text("${sb2!.productdata![index].pDISCRIPTION}"),

                ),
              ),
            );
          },

      ),
    ):Center(child: CircularProgressIndicator());
  }
}

class Aaddproductdata {
  int? connection;
  int? result;
  List<Productdata>? productdata;

  Aaddproductdata({this.connection, this.result, this.productdata});

  Aaddproductdata.fromJson(Map<String, dynamic> json) {
    connection = json['connection'];
    result = json['result'];
    if (json['productdata'] != null) {
      productdata = <Productdata>[];
      json['productdata'].forEach((v) {
        productdata!.add(new Productdata.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['connection'] = this.connection;
    data['result'] = this.result;
    if (this.productdata != null) {
      data['productdata'] = this.productdata!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Productdata {
  String? iD;
  String? uSERID;
  String? pNAME;
  String? pSELLING;
  String? pPRICE;
  String? pDISCRIPTION;
  String? pSTOKE;
  String? pIMAGES;

  Productdata(
      {this.iD,
      this.uSERID,
      this.pNAME,
      this.pSELLING,
      this.pPRICE,
      this.pDISCRIPTION,
      this.pSTOKE,
      this.pIMAGES});

  Productdata.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    uSERID = json['USERID'];
    pNAME = json['PNAME'];
    pSELLING = json['PSELLING'];
    pPRICE = json['PPRICE'];
    pDISCRIPTION = json['PDISCRIPTION'];
    pSTOKE = json['PSTOKE'];
    pIMAGES = json['PIMAGES'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['USERID'] = this.uSERID;
    data['PNAME'] = this.pNAME;
    data['PSELLING'] = this.pSELLING;
    data['PPRICE'] = this.pPRICE;
    data['PDISCRIPTION'] = this.pDISCRIPTION;
    data['PSTOKE'] = this.pSTOKE;
    data['PIMAGES'] = this.pIMAGES;
    return data;
  }
}
class deletproductt {
  int? connection;
  int? result;

  deletproductt({this.connection, this.result});

  deletproductt.fromJson(Map<String, dynamic> json) {
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

