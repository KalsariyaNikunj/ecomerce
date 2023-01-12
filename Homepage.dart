import 'package:flutter/material.dart';
import 'package:loginpage/addproduct.dart';
import 'package:loginpage/smoothscreen.dart';
import 'package:loginpage/viewproduct.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  String? Name;
  String? Email;
  int cnt=1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Name = screen.prefs!.getString("name") ?? "";
    Email = screen.prefs!.getString("emaillog") ?? "";
  }
  List<Widget> list = [addproducts(),viewproduct()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home page"),
      ),
      body: list[cnt],
      drawer: Drawer(
          child: ListView(
        children: [
          UserAccountsDrawerHeader(
              accountName: Text("${Name}"),
              accountEmail: Text("${Email}"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://nikunjstore.000webhostapp.com/Imagesdata/Login.php/${screen.prefs!.getString("images") ?? ""}"),
              ),
          ),
          ListTile(onTap: () {

          },title: Text("My Profile"),
            leading: Icon(Icons.person_outline_rounded),

          ),

            ListTile(onTap: () {



              setState(() {
                cnt=0;
              });
            },title: Text("Add Product"),
              leading: Icon(Icons.shopping_cart),

            ),
          ListTile(onTap: () {
           // Navigator.pop(context);


            setState(() {
              cnt=1;

            });
          },title: Text("View Product"),
            leading: Icon(Icons.shopping_cart),

          ),

          ListTile(onTap: () {

          },title: Text("My Cart"),
            leading: Icon(Icons.shopping_cart),

          ),
          ListTile(onTap: () {

          },title: Text("My Wishlist"),
            leading: Icon(Icons.transfer_within_a_station_sharp),

          ),
          ListTile(onTap: () {

          },title: Text("Log out"),
            leading: Icon(Icons.logout),


          ),
          ListTile(onTap: () {

          },title: Text("Help and Support"),
            leading: Icon(Icons.help_center),

          ),



        ],
      )),

    );
  }
}
