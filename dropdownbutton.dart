// import 'dart:convert';
//
// import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
// import 'package:ecommerce/LoginPage.dart';
// import 'package:ecommerce/main.dart';
// import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
// import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
// import 'package:get/get.dart';
// import 'package:getwidget/components/carousel/gf_carousel.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
// import 'UpdateProduct.dart';
// import 'UploadProduct.dart';
// import 'ViewProduct.dart';
//
// class HomePage extends StatefulWidget {
// // String img,email,dob,name,mobile,password;
//   static Map viewData = {};
//   static String ids = '';
//   static double Width = 0;
//   static double Height = 0;
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   // List<Widget> productCatlogePage=[Products(0),Mobiles(),BluthothSpeaker(),TShirt()];
//
//   List mainImg=[],img1=[],img2= [],img3=[],img4=[],sellingPrice = [],MRPPrice = [],discount = [],productName = [],iteamId = [],productDetail = [],stock = [];
//   List<String> banner = [
//     "https://i.pinimg.com/originals/aa/6c/75/aa6c75645ca44085c74d6eaa2e87744b.png",
//     "https://static.vecteezy.com/system/resources/previews/004/299/835/original/online-shopping-on-phone-buy-sell-business-digital-web-banner-application-money-advertising-payment-ecommerce-illustration-search-free-vector.jpg",
//     "https://cdn.dribbble.com/users/5261465/screenshots/11301629/media/f632fd98d606d0e6ce41e49eb38d5ccb.jpg?compress=1&resize=400x300",
//     "https://cdn.dribbble.com/users/6046827/screenshots/15348884/media/fe60f5ec0056dbe949481934491b5ecb.jpg?compress=1&resize=400x300"
//   ];
//
//   TextEditingController Search = TextEditingController();
//   // Map scrollControl = {'0':new FixedExtentScrollController(),'1':new FixedExtentScrollController(),'2':new FixedExtentScrollController(),'3':new FixedExtentScrollController()}  ;
//   List Catagory = ['Headphone','Mobiles','Bluthoth Speaker','TShirt'];
//   List<List> CatagoryData = [];
//   List backIsSet = [true,false,false,false],favorite =[false,false,false,false];
//   List containerSize = [false,false,false,false];
//   bool status=false,menubarIsSet = false,drawerOpen=false,profileImgIsSet=false,myProfileIsSet = false,
//       myCartIsSet = false,bussinessIsSet = false,myUploadIsSet = false,myWishlistIsSet = false,
//       logoutIsSet = false,aboutIsSet = false,drawerMenu = false,searchIsSet =false,searchIsValid=true;
//   double Blureadious = 5;
//   int noOfData = 0,catIndex = 0;
//   Offset direction = Offset(10, 10);
//   String CatagoryName = "", myProfileName = "My Profile",bussinessString = "Bussiness with easy-Shopping",errorMsgSearch='';
//   Icon myProfileIcon = Icon(Icons.person,color: LoginPage.theamColor,),bussinessIcon = Icon(Icons.shopping_bag,color: LoginPage.theamColor,),myCartIcon = Icon(Icons.shopping_cart,color: LoginPage.theamColor,),myUploadIcon = Icon(Icons.cloud_upload,color: LoginPage.theamColor,),myWishlistIcon = Icon(Icons.favorite,color: LoginPage.theamColor,),logoutIcon = Icon(Icons.logout,color: LoginPage.theamColor,),aboutIcon = Icon(Icons.help_rounded,color: LoginPage.theamColor,);
//   @override
//   Widget build(BuildContext context) {
//
//     double Height = MediaQuery.of(context).size.height;
//     double Width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       backgroundColor: LoginPage.bgColor,
//       appBar: AppBar(
//         backgroundColor: LoginPage.bgColor,
//         centerTitle: true,
//         shadowColor: LoginPage.shadowColor,
//         title: Text("Home Page",style: TextStyle(fontFamily: "Merriweather",fontWeight: FontWeight.bold,color: LoginPage.theamColor),),
//
//         actions: [
//           Container(
//               margin: EdgeInsets.all(6),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                   color: LoginPage.bgColor,
//                   boxShadow: [BoxShadow(
//                     blurRadius:2,
//                     offset: Offset(4, 4),
//                     color: Color(0xFFA7A9AF),
//                   ),
//                     BoxShadow(
//                       blurRadius: 2,
//                       offset: Offset(-4, -4),
//                       color: Colors.white,
//                     ),
//                   ]
//               ),
//               child: IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart,))),
//         ],
//       ),
//       drawer: DrawerApp(Width,Height),
//       body: Container(
//           child:  ListView(
//             children: [
//
//               GFCarousel(
//                 autoPlay: true,
//                 items: banner.map(
//                       (url) {
//                     return Container(width: 450,
//                       margin: EdgeInsets.all(8.0),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                         child: Image.network(
//                             url,
//                             fit: BoxFit.cover,
//                             width: 500.0
//                         ),
//                       ),
//                     );
//                   },
//                 ).toList(),
//                 onPageChanged: (index) {
//                   setState(() {
//                     index;
//                   });
//                 },
//               ),
//               Container(
//                 width: Width,
//                 margin: EdgeInsets.only(top: Height*0.02,),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     AnimatedContainer(
//                       width:Width*0.8,
//                       height: Width*0.12,
//                       duration: Duration(milliseconds: 200),
//
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(Height*0.02,),
//                           color: LoginPage.bgColor,
//                           boxShadow: [BoxShadow(
//                             blurRadius: searchIsSet?2:Blureadious,
//
//                             offset: Offset(-4, -4),
//                             color: Colors.white60,
//                             inset: searchIsSet,
//                           ),BoxShadow(
//                             blurRadius: searchIsSet?2:Blureadious,
//                             offset: Offset(4, 4),
//                             color: LoginPage.shadowColor,
//                             inset: searchIsSet,
//                           ),]
//                       ),
//                       child: Center(
//                         child: TextField(
//                           maxLines: 1,
//                           controller: Search,
//                           cursorColor:LoginPage.theamColor ,
//                           clipBehavior: Clip.antiAlias,
//
//                           decoration: InputDecoration(prefixIcon: Icon(Icons.search,color: LoginPage.theamColor,),border: InputBorder.none,
//                             focusedBorder: InputBorder.none,
//                             suffixIcon: searchIsSet?IconButton(onPressed: (){
//                               setState(() {
//                                 Search.text = '';
//                                 errorMsgSearch = "No Search Found!!!";
//                               });
//                             }, icon: Icon(Icons.clear,color: Color(0xF13272EC),)):null,
//                             errorText: searchIsValid?null:errorMsgSearch,errorStyle: searchIsValid?null:TextStyle(color: Colors.red,),hintText:  "Search Your Product 😊",),
//
//                           onTap: () {
//                             setState(() {
//                               searchIsSet = true;
//                             });
//                           },
//                           onChanged: (mobile) {
//
//                             setState(() {
//
//                             });
//                           },
//                         ),
//                       ),
//                     ),
//                     Container(
//                         width: Width*0.12,
//                         height: Height*0.06,
//                         margin: EdgeInsets.only(right: Width*0.015,left: Width*0.03,),
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.all(Radius.circular(Height*0.02)),
//                             color: LoginPage.bgColor,
//                             boxShadow: [BoxShadow(
//                               blurRadius:2,
//                               offset: Offset(4, 4),
//                               color: Color(0xFFA7A9AF),
//                             ),
//                               BoxShadow(
//                                 blurRadius: 2,
//                                 offset: Offset(-4, -4),
//                                 color: Colors.white,
//                               ),
//                             ]
//                         ),
//                         child: IconButton(onPressed: (){
//                           setState(() {
//                             searchIsSet=!searchIsSet;
//                           });
//                         }, icon: Icon(Icons.search,))),
//                   ],
//                 ),          ),
//
//               Container(
//                 height: Height*0.082,
//
//                 // margin: EdgeInsets.only(top: Height*0.01,bottom: Height*0.01),
//                 child: ListView.builder(scrollDirection: Axis.horizontal,itemCount:Catagory.length,itemBuilder: (context, index) {
//                   return Container(
//
//                     margin: EdgeInsets.only(left: Width*0.02,right: Width*0.02,top: Height*0.01,bottom: Height*0.01),
//                     child: InkWell(
//                         onTap:(){
//
//                           setState(() {
//
//                             for(int i=0;i<backIsSet.length;i++){
//                               if(index==i){
//                                 backIsSet[index]=true;
//                                 catIndex=index;
//                               }else{
//                                 backIsSet[i]=false;
//                               }
//                             }
//
//                             viewProductData(index);
//
//                           });
//                         },
//                         child:backIsSet[index]?AnimatedContainer(
//                             duration: Duration(milliseconds: 100),
//                             height: Height*0.06,
//                             padding: EdgeInsets.all(Height*0.01),
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.all(Radius.circular(Height*0.01)),
//                                 color: LoginPage.bgColor,
//                                 boxShadow: [BoxShadow(
//                                   blurRadius:2,
//                                   offset: Offset(4, 4),
//                                   color: Color(0xFFA7A9AF),
//                                 ),
//                                   BoxShadow(
//                                     blurRadius: 2,
//                                     offset: Offset(-4, -4),
//                                     color: Colors.white,
//                                   ),
//                                 ]
//                             ),
//                             child: Center(child: Text("${Catagory[index]}",style: TextStyle(fontFamily: "Merriweather",fontWeight: FontWeight.bold,color: LoginPage.theamColor,fontSize: Height*0.024))
//                             )
//                         ):Container(
//                             height: Height*0.06,
//                             padding: EdgeInsets.all(Height*0.01),
//                             child: Center(child: Text("${Catagory[index]}",style: TextStyle(fontFamily: "Merriweather",fontWeight: FontWeight.bold,color: Colors.black,fontSize: Height*0.019))
//                             )
//                         )),
//                   );
//                 },),
//               ),
//
//               status?Products(catIndex):Container()
//
//
//               // ListView.builder(itemCount:Catagory.length,itemBuilder: (context, index) {
//               //   return Column(
//               //     children: [
//               //       Container(
//               //         decoration: BoxDecoration(
//               //             color: LoginPage.bgColor,
//               //             boxShadow: [BoxShadow(
//               //               blurRadius:3,
//               //               offset: Offset(5, 5),
//               //               color: Color(0xFFA7A9AF),
//               //             ),
//               //               BoxShadow(
//               //                 blurRadius: 3,
//               //                 offset: Offset(-5, -5),
//               //                 color: Colors.white,
//               //               ),
//               //             ]
//               //         ),
//               //         child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               //           children: [
//               //             Container(
//               //                 margin: EdgeInsets.only(top: 5,left: 10,bottom: 5),padding: EdgeInsets.all(5),
//               //                 child: Text("${Catagory[index]}",style: TextStyle(fontWeight: FontWeight.bold,color: LoginPage.theamColor),)),
//               //             InkWell(onTap: () async {
//               //               setState(() {
//               //                 backIsSet[index] = !backIsSet[index];
//               //               });
//               //
//               //               await Future.delayed(Duration(milliseconds: 300),() {
//               //
//               //                 setState(() {
//               //                   backIsSet[index] = false;
//               //                 });
//               //
//               //               } ,);
//               //
//               //             },
//               //               child: AnimatedContainer(
//               //                 duration: Duration(milliseconds: 200),
//               //                 padding: EdgeInsets.all(5),
//               //                 margin: EdgeInsets.only(top: 5,right: 10,bottom: 5),
//               //                 width: Width*0.13,height: Width*0.13,
//               //                 decoration: BoxDecoration(
//               //                     shape: BoxShape.circle,
//               //                     // image: DecorationImage(image: AssetImage("Asset/Icons/Google__G__Logo.svg.webp")),
//               //                     color: Colors.grey.shade300,
//               //                     boxShadow: [BoxShadow(
//               //                       blurRadius: backIsSet[index]?1:3,
//               //                       offset: backIsSet[index]?Offset(1, 1):Offset(5, 5),
//               //                       color: Color(0xFFA7A9AF),
//               //
//               //                       inset: backIsSet[index],
//               //                     ),BoxShadow(
//               //                       blurRadius: backIsSet[index]?1:3,
//               //                       offset: backIsSet[index]?Offset(-1, -1):Offset(-5, -5),
//               //                       // color: Color(0xF13272EC),
//               //                       color: Colors.white,
//               //                       inset: backIsSet[index],
//               //                     ),]
//               //                 ),
//               //                 child: Center(child: IconButton(onPressed: () async {
//               //                   setState(() {
//               //                     backIsSet[index] = !backIsSet[index];
//               //                   });
//               //
//               //                   await Future.delayed(Duration(milliseconds: 300),() {
//               //
//               //                     setState(() {
//               //                       backIsSet[index] = false;
//               //                     });
//               //
//               //                   } ,);
//               //                 }, icon: Icon(Icons.arrow_forward_ios,color: LoginPage.theamColor,)),),
//               //               ),
//               //             ),
//               //
//               //           ],
//               //         ),
//               //       ),
//               //       Transform.rotate(
//               //
//               //         alignment: Alignment(0,0),
//               //         angle: 139.8,
//               //         child: Container(
//               //           height: Width,
//               //           width: Width*0.6,
//               //           color: LoginPage.bgColor,
//               //           child: ClickableListWheelScrollView(loop: true,
//               //               scrollController: scrollControl['$index'], child: ListWheelScrollView.useDelegate(
//               //                 itemExtent: Height*0.27,physics: FixedExtentScrollPhysics(),diameterRatio: 3,
//               //                 //     onSelectedItemChanged: (value) {
//               //                 //   setState(() {
//               //                 //     print("jfmxlmldslml$value");
//               //                 //     // for(int i = 0;i<containerSize.length;i++){
//               //                 //     //
//               //                 //     //   if(i == value){
//               //                 //     //     containerSize[value] = true;
//               //                 //     //   }else{
//               //                 //     //     containerSize[value] = false;
//               //                 //     //   }
//               //                 //     // }
//               //                 //   });
//               //                 // },
//               //                 childDelegate: ListWheelChildBuilderDelegate(
//               //                   builder: (context, indexproduct) {
//               //                     return Products(indexproduct,Width,Height);
//               //                   },childCount: 5,),controller:scrollControl['$index'],), itemHeight: Height*0.27, itemCount: 5),
//               //         ),
//               //       ),
//               //     ],
//               //   );
//               // },) ,
//             ],
//           )
//       ),
//     );
//
//   }
//
//   @override
//   void initState() {
//     for(int i=0;i<Catagory.length;i++){
//       CatagoryData.add([]);
//     }
//     viewProductData(0);
//     DrawerIcons();
//
//   }
//   void DrawerIcons(){
//     myProfileIcon = Icon(Icons.person,color: myProfileIsSet?LoginPage.theamColor:Colors.black26,);
//     bussinessIcon = Icon(Icons.shopping_bag,color: bussinessIsSet?LoginPage.theamColor:Colors.black26,);
//     myCartIcon = Icon(Icons.shopping_cart,color: myCartIsSet?LoginPage.theamColor:Colors.black26,);
//     myUploadIcon = Icon(Icons.cloud_upload,color: myUploadIsSet?LoginPage.theamColor:Colors.black26,);
//     myWishlistIcon = Icon(Icons.favorite,color: myWishlistIsSet?LoginPage.theamColor:Colors.black26,);
//     logoutIcon = Icon(Icons.logout,color: logoutIsSet?LoginPage.theamColor:Colors.black26,);
//     aboutIcon = Icon(Icons.help_rounded,color: aboutIsSet?LoginPage.theamColor:Colors.black26,);
//   }
//
//   Widget DrawerApp(double Width,double Height) {
//     return Drawer(
//
//       width: Width*0.8,
//       backgroundColor: Colors.transparent,
//
//       child: Container(
//         decoration: BoxDecoration(
//             color: LoginPage.bgColor,
//             boxShadow: [BoxShadow(
//               blurRadius:10,
//               offset: Offset(10, 10),
//               color: Color(0xFFA7A9AF),
//             ),
//               BoxShadow(
//                 blurRadius: 10,
//                 offset: Offset(-10, -10),
//                 color: Color(0xF13272EC),
//               ),
//             ]
//         ),
//         child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Center(
//               child: Container(
//                 height: Height*0.32,
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: Height*0.04,
//                     ),
//                     InkWell(
//                       onTap: () async {
//                         setState(() {
//                           profileImgIsSet = !profileImgIsSet;
//                         });
//
//                         await Future.delayed(Duration(milliseconds: 400),() {
//
//                           setState(() {
//                             profileImgIsSet = false;
//                           });
//
//                         } ,);
//                         // ImagePickerOption();
//                       },
//                       child: AnimatedContainer(
//                           duration: Duration(milliseconds: 300),
//
//                           decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: Colors.grey.shade300,
//                               boxShadow: [BoxShadow(
//                                 blurRadius: profileImgIsSet?1:5,
//                                 offset: profileImgIsSet?Offset(7, 7):Offset(7, 7),
//                                 color: Color(0xFFA7A9AF),
//                                 inset: profileImgIsSet,
//                               ),BoxShadow(
//                                 blurRadius: profileImgIsSet?1:5,
//                                 offset: profileImgIsSet?Offset(-7, -7):Offset(-7, -7),
//                                 // color: Color(0xF13272EC),
//                                 color: Colors.white,
//                                 inset: profileImgIsSet,
//                               ),]
//                           ),
//                           child: Padding(
//                             padding: EdgeInsets.all(5),
//                             child: CircleAvatar(
//                               radius: 60,
//                               backgroundColor: Colors.transparent,
//                               backgroundImage: NetworkImage("https://lirmo.000webhostapp.com/${Loding.sp!.getString('imagepath')}"),
//                             ),
//                           )
//                       ),
//                     ),
//                     SizedBox(
//                       height: Height*0.01,
//                     ),
//                     Center(
//                       child: Text("Hello",style: TextStyle(fontWeight: FontWeight.bold,color: LoginPage.theamColor,fontFamily: "Merriweather"),),
//                     ),SizedBox(
//                       height: Height*0.01,
//                     ),
//                     Center(
//                       child: Text("${Loding.sp!.getString('name')}",style: TextStyle(fontWeight: FontWeight.bold,color: LoginPage.theamColor,fontFamily: "Merriweather"),),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//
//             Container(
//               child: Column(
//                 children: [
//                   InkWell(
//                       onTap: () async {
//                         setState(() {
//                           myProfileIsSet = true;
//                           bussinessIsSet = false;
//                           myUploadIsSet = false;
//                           myCartIsSet = false;
//                           myWishlistIsSet = false;
//                           DrawerIcons();
//                         });
//                       },
//                       child: drawerTag(myProfileIsSet,myProfileIcon,myProfileName,Width,Height)),
//                   InkWell(
//                       onTap: () async {
//                         setState(() {
//                           myUploadIsSet = true;
//                           myProfileIsSet = false;
//                           bussinessIsSet = false;
//                           myCartIsSet = false;myWishlistIsSet = false; DrawerIcons();
//
//
//                           Navigator.push(context, MaterialPageRoute(builder: (context) => UploadProduct()));
//
//                         });
//
//
//                       },
//                       child: drawerTag(myUploadIsSet,myUploadIcon,"Upload Product",Width,Height)),
//                   InkWell(
//                       onTap: () async {
//                         setState(() {
//                           myCartIsSet = true;
//                           myProfileIsSet = false;
//                           bussinessIsSet = false;
//                           myUploadIsSet = false;myWishlistIsSet = false; DrawerIcons();
//                         });
//
//                       },
//                       child: drawerTag(myCartIsSet,myCartIcon,"My Cart",Width,Height)),
//                   InkWell(
//                       onTap: () async {
//                         setState(() {
//                           myWishlistIsSet = true;
//                           myCartIsSet = false;
//                           myProfileIsSet = false;
//                           bussinessIsSet = false;
//                           myUploadIsSet = false; DrawerIcons();
//                         });
//                       },
//                       child: drawerTag(myWishlistIsSet,myWishlistIcon,"My Wishlist",Width,Height)),
//                 ],
//               ),
//             ),
//             Container(
//               child: Column(
//                 children: [
//                   InkWell(
//                       onTap: () async {
//                         setState(() {
//                           logoutIsSet = true;
//                           aboutIsSet = false; DrawerIcons();
//
//                           Loding.sp!.setBool("loginsstus", false).then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),)));
//
//                         });
//                       },
//                       child: drawerTag(logoutIsSet,logoutIcon,"Logout",Width,Height)),
//                   InkWell(
//                       onTap: () async {
//                         setState(() {
//                           aboutIsSet = true;
//                           logoutIsSet = false; DrawerIcons();
//                         });
//                       },
//                       child: drawerTag(aboutIsSet,aboutIcon,"Help and Feedback",Width,Height)),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget drawerTag(bool Pressed, Icon leadingIcon, String TagName, double Width, double Height,) {
//     return AnimatedContainer(
//       height: Height*0.06,
//       duration: Duration(milliseconds: 200),
//       margin: EdgeInsets.all(10),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           color: Colors.grey.shade300,
//           boxShadow: [Pressed?BoxShadow(
//             blurRadius: Pressed?2:Blureadious,
//
//             offset: Pressed?Offset(-5, -5):-direction,
//             color: Colors.white60,
//             inset: Pressed,
//           ):
//           BoxShadow(
//             color: Colors.white60,
//           )
//             ,Pressed?BoxShadow(
//               blurRadius: Pressed?2:Blureadious,
//               offset: Pressed?Offset(5, 5):direction,
//               color: Color(0xFFA7A9AF),
//               inset: Pressed,
//             ): BoxShadow(
//               color: Colors.white60,
//             ),]
//
//       ),
//       child: Row(mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//
//           Container(margin: EdgeInsets.only(left: Width*0.02),
//               child: leadingIcon),
//           Container(margin: EdgeInsets.only(left: Width*0.05),
//               child: Text("${TagName}",style: TextStyle(fontFamily: "Merriweather",fontWeight: FontWeight.bold,color: Pressed?LoginPage.theamColor:Colors.black26,),)),
//
//         ],
//       ),
//     );
//   }
//
//   Future<void> viewProductData(int index) async {
//     setState(() {
//       status =false;
//       CatagoryName = "${Catagory[index]}";
//     });
//     iteamId.clear();
//     favorite.clear();
//     mainImg.clear();
//     img1.clear();
//     img2.clear();
//     img3.clear();
//     img4.clear();
//     sellingPrice.clear();
//     discount.clear();
//     MRPPrice.clear();
//     productDetail.clear();
//     productName.clear();
//     stock.clear();
//     Loding.sp =await SharedPreferences.getInstance();
//
//     HomePage.ids = Loding.sp!.getString('id')??"0";
//     HomePage.viewData = {
//       'id': '${HomePage.ids}',
//       'Catagory':"${Catagory[index]}",
//       'Catagorylen':"${Catagory.length}"
//     };
//
//     var Url = Uri.parse("https://lirmo.000webhostapp.com/viewProduct.php");
//     var responce = await http.post(Url ,body : HomePage.viewData);
//
//     var viewProductData  = jsonDecode(responce.body);
//     print("=====${viewProductData}");
//     GetProduct getProductData=GetProduct.fromjson(viewProductData);
//     setState(() {
//       noOfData = int.parse(getProductData.view.toString());
//     });
//     for(int i=0;i<noOfData;i++){
//       favorite.add(false);
//       iteamId.add(getProductData.Product[i].iteamId);
//       stock.add(getProductData.Product[i].stock);
//       productDetail.add(getProductData.Product[i].productDetail);
//       productName.add(getProductData.Product[i].productname);
//       mainImg.add(getProductData.Product[i].mainImg);
//       img1.add (getProductData.Product[i].Img1);
//       img2.add(getProductData.Product[i].Img2);
//       img3.add(getProductData.Product[i].Img3);
//       img4.add(getProductData.Product[i].Img4);
//       sellingPrice.add(getProductData.Product[i].sellingPrice);
//       MRPPrice.add(getProductData.Product[i].MRP);
//       var d= 100-(double.parse(getProductData.Product[i].sellingPrice)*100/double.parse(getProductData.Product[i].MRP));
//
//       var dis =double.parse(d.toStringAsFixed(2));
//       discount.add(dis);
//     }
//
//
//     setState(() {
//       status = true;
//     });
//   }
//
//   Widget Products(int index) {
//     return Container(
//
//       width: HomePage.Width*0.96,
//       height: HomePage.Height*0.42,
//
//       color: Colors.transparent,
//
//       child: GridView.builder(
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1 ,mainAxisExtent:HomePage.Width*0.5 ),
//         itemCount: noOfData,scrollDirection: Axis.horizontal, itemBuilder: (context, index) {
//         return InkWell(
//
//           onTap: (){
//             Navigator.push(context, MaterialPageRoute(builder: (context) => ViewProduct(productName[index],mainImg[index],img1[index],img2[index],img3[index],img4[index],sellingPrice[index],MRPPrice[index],discount[index],CatagoryName,productDetail[index]),));
//
//           },
//           child: Container(
//
//             margin: EdgeInsets.only(bottom:HomePage.Height*0.01,top:HomePage.Height*0.01,left:HomePage.Width*0.03 ),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(HomePage.Width*0.03),
//                 color: Colors.white,
//                 boxShadow: [BoxShadow(
//                   blurRadius: 3,
//
//                   offset: Offset(-4, -4),
//                   color: Colors.white60,
//
//                 )
//                   ,BoxShadow(
//                     blurRadius: 3,
//                     offset: Offset(4, 4),
//                     color: Color(0xFFA7A9AF),
//
//                   ),]
//
//             ),
//
//             child: Column(
//               children: [
//                 Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       alignment: Alignment.centerRight,
//                       child: IconButton(onPressed: (){
//                         showDialog(context: context, builder: (context) {
//                           return Center(
//                             child: Container(
//                               width: HomePage.Width*0.8,
//                               height: HomePage.Height*0.25,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(HomePage.Width*0.03),
//                                   color: Colors.white,
//                                   boxShadow: [BoxShadow(
//                                     blurRadius: 5,
//
//                                     offset: Offset(-4, -4),
//                                     color: Colors.white,
//
//                                   )
//                                     ,BoxShadow(
//                                       blurRadius: 5,
//                                       offset: Offset(4, 4),
//                                       color: Color(0xFF797A7C),
//
//                                     ),]
//
//                               ),
//                               child: Center(
//                                 child: Column(
//                                   children: [
//                                     SizedBox(
//
//                                       height: HomePage.Height*0.1,
//                                     ),
//                                     Text("You Want to Delete This Cataloge?",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: HomePage.Height*0.019 ),),
//                                     SizedBox(
//
//                                       height: HomePage.Height*0.01,
//                                     ),
//                                     Container(
//                                       child: Row(mainAxisAlignment: MainAxisAlignment.end,
//                                         children: [
//                                           TextButton(onPressed: () async {
//                                             Map deleteProduct = {
//                                               'iteamId':'${iteamId[index]}'
//                                             };
//                                             var Url = Uri.parse("https://lirmo.000webhostapp.com/deleteProduct.php");
//                                             var responce = await http.post(Url ,body :deleteProduct);
//                                             var data  = jsonDecode(responce.body);
//                                             setState(() {
//                                               noOfData--;
//                                               favorite.add(false);
//                                               iteamId.removeAt(index);
//                                               productName.removeAt(index);
//                                               mainImg.removeAt(index);
//                                               img1.removeAt(index);
//                                               img2.removeAt(index);
//                                               img3.removeAt(index);
//                                               img4.removeAt(index);
//                                               sellingPrice.removeAt(index);
//                                               MRPPrice.removeAt(index);
//                                               discount.removeAt(index);
//                                             });
//                                             Navigator.pop(context);
//                                           }, child: Text("Yes",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: HomePage.Height*0.019))),
//                                           TextButton(onPressed: (){
//                                             Navigator.pop(context);
//                                           }, child: Text("No",style: TextStyle(fontWeight: FontWeight.bold,color: LoginPage.theamColor,fontSize: HomePage.Height*0.019)))
//                                         ],),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           );
//                         },);
//                         setState(() {
//
//                         });
//                       }, icon: Icon(Icons.delete_forever,color: Colors.red,)),
//                     ),
//                     Container(
//                       alignment: Alignment.centerRight,
//                       child: IconButton(onPressed: (){
//                         showDialog(context: context, builder: (context) {
//                           return Center(
//                             child: Container(
//                               width: HomePage.Width*0.8,
//                               height: HomePage.Height*0.25,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(HomePage.Width*0.03),
//                                   color: Colors.white,
//                                   boxShadow: [BoxShadow(
//                                     blurRadius: 5,
//
//                                     offset: Offset(-4, -4),
//                                     color: Colors.white,
//
//                                   )
//                                     ,BoxShadow(
//                                       blurRadius: 5,
//                                       offset: Offset(4, 4),
//                                       color: Color(0xFF797A7C),
//
//                                     ),]
//
//                               ),
//                               child: Center(
//                                 child: Column(
//                                   children: [
//                                     SizedBox(
//
//                                       height: HomePage.Height*0.1,
//                                     ),
//                                     Text("You Want to Upadate This Cataloge?",style: TextStyle(fontWeight: FontWeight.bold,color: LoginPage.theamColor,fontSize: HomePage.Height*0.019 ),),
//                                     SizedBox(
//
//                                       height: HomePage.Height*0.01,
//                                     ),
//                                     Container(
//                                       child: Row(mainAxisAlignment: MainAxisAlignment.end,
//                                         children: [
//                                           TextButton(
//                                               onPressed: ()  {
//
//                                                 Navigator.pop(context);
//                                                 Navigator.push(context, MaterialPageRoute(builder: (context) =>UpdateProduct(productName[index],mainImg[index],img1[index],img2[index],img3[index],img4[index],sellingPrice[index],MRPPrice[index],discount[index],CatagoryName,productDetail[index],stock[index],iteamId[index])));
//
//
//                                               }, child: Text("Yes",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: HomePage.Height*0.019))),
//                                           TextButton(onPressed: (){
//                                             Navigator.pop(context);
//                                           }, child: Text("No",style: TextStyle(fontWeight: FontWeight.bold,color: LoginPage.theamColor,fontSize: HomePage.Height*0.019)))
//                                         ],),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           );
//                         },);
//                         setState(() {
//
//                         });
//                       }, icon: Icon(Icons.edit,color: LoginPage.theamColor,)),
//                     ),
//                     Container(
//                       alignment: Alignment.centerRight,
//                       child: IconButton(onPressed: (){
//                         setState(() {
//                           favorite[index] = !favorite[index];
//                         });
//                       }, icon: favorite[index]?Icon(Icons.favorite,color: Colors.red,):Icon(Icons.favorite_border,color: Colors.red,)),
//                     ),
//                   ],
//                 ),
//                 Container(
//                   // width: HomePage.Width*0.4,
//                     height: HomePage.Height*0.15,
//                     child: Image(image: NetworkImage("https://lirmo.000webhostapp.com/${mainImg[index]}"),fit: BoxFit.contain,)),
//                 Container(alignment: Alignment.centerLeft,padding: EdgeInsets.only(left:HomePage.Height*0.01),
//                     height: HomePage.Height*0.085,
//                     child: Text("${productName[index]}",style: TextStyle(color: LoginPage.theamColor,fontWeight: FontWeight.bold, ),)),
//                 Container(alignment: Alignment.centerLeft,height: HomePage.Height*0.03,padding: EdgeInsets.only(left:HomePage.Height*0.01),
//                     child: Text("${sellingPrice[index]} Rs.",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
//                 Container(alignment: Alignment.centerLeft,height: HomePage.Height*0.03,padding: EdgeInsets.only(left:HomePage.Height*0.01),
//                     child: Text("Discount ${discount[index]}%",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)),
//                 Container(alignment: Alignment.centerLeft,height: HomePage.Height*0.03,padding: EdgeInsets.only(left:HomePage.Height*0.01),child: Text("MRP :${MRPPrice[index]} Rs.",style: TextStyle(color: LoginPage.bgColor,fontWeight: FontWeight.bold),)),
//               ],
//             ),
//           ),
//         );
//       },),
//     );
//   }
//
//
//
//
// }
//
//
//
//
//
//
//
// class GetProduct {
//   int conection,view;
//   List<ProductData> Product;
//   // List<ProductData> product;
//
//   GetProduct(this.conection, this.view, this.Product);
//   factory GetProduct.fromjson(viewProductData) {
//     var list =viewProductData['Product'] as List;
//     List<ProductData> data;
//     if(list.isNotEmpty) {
//       data = list.map((e) => ProductData.json(e)).toList();
//       return GetProduct(viewProductData['conection'], viewProductData['view'], data );
//     }else
//       return GetProduct(viewProductData['conection'], viewProductData['view'], viewProductData['Product'] );
//   }
// }
// class ProductData {
//   var iteamId,id;
//   String catagory,productname,productDetail,mainImg,Img1,Img2,Img3,Img4;
//   var sellingPrice,MRP;
//   var stock;
//
//   ProductData(
//       this.iteamId,
//       this.id,
//       this.catagory,
//       this.productname,
//       this.productDetail,
//       this.mainImg,
//       this.Img1,
//       this.Img2,
//       this.Img3,
//       this.Img4,
//       this.sellingPrice,
//       this.MRP,
//       this.stock);
//   factory ProductData.json(e){
//     return ProductData(e['iteamId'],e['id'], e['catagory'], e['productname'], e['productDetail'], e['mainImg'], e['Img1'], e['Img2'], e['Img3'], e['Img4'], e['sellingPrice'], e['MRP'], e['stock']);
//   }
// }