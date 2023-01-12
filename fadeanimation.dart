// import 'package:ecommerce/HomePage.dart';
// import 'package:ecommerce/LoginPage.dart';
// import 'package:ecommerce/MyCart.dart';
// import 'package:ecommerce/Payment.dart';
// import 'package:ecommerce/main.dart';
// import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
// import 'package:flutter/material.dart';
// import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
// import 'package:getwidget/components/carousel/gf_carousel.dart';
// class ViewProduct extends StatefulWidget {
//   var productName,mainImg,img1,img2,img3,img4,sellingPrice,mrpPrice,discount,Catagory,productDetail;
//   ViewProduct(this.productName, this.mainImg, this.img1, this.img2, this.img3, this.img4, this.sellingPrice, this.mrpPrice, this.discount,this.Catagory, this.productDetail);
//
//
//
//   @override
//   State<ViewProduct> createState() => _ViewProductState();
// }
//
// class _ViewProductState extends State<ViewProduct> {
//   int Qty = 1,total= 0;
//   List<String> pName = [],mainImg=[],price=[],disPrice = [],qty= [];
//   List ProductImages = [],image = [true,false,false,false,false],productColors = [Colors.black,Colors.blue,Colors.red,Colors.yellow,],colors = [true,false,false,false,false];
//   bool favorite =false,addToCart =false,qtyMinus = false,qtyPluse = false,addToCartbutton =false,buyNowButton =false;
//   @override
//   void initState() {
//     ProductImages.clear();
//     ProductImages.add("https://lirmo.000webhostapp.com/${widget.mainImg}");
//     ProductImages.add("https://lirmo.000webhostapp.com/${widget.img1}");
//     ProductImages.add("https://lirmo.000webhostapp.com/${widget.img2}");
//     ProductImages.add("https://lirmo.000webhostapp.com/${widget.img3}");
//     ProductImages.add("https://lirmo.000webhostapp.com/${widget.img4}");
//     pName.add(widget.productName);
//     mainImg.add("https://lirmo.000webhostapp.com/${widget.mainImg}");
//     price.add(widget.sellingPrice);
//     disPrice.add(widget.discount.toString());
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: LoginPage.bgColor,
//       appBar: AppBar(
//         backgroundColor: LoginPage.bgColor,
//
//         elevation: 0,
//         // title: Text("${widget.Catagory}",style: TextStyle(fontWeight: FontWeight.bold,color: LoginPage.theamColor),),
//         actions: [
//           // InkWell(
//           //   onTap: (){
//           //     setState(() {
//           //
//           //       addToCart = !addToCart;
//           //     });
//           //   },
//           //   child: Container(
//           //       margin: EdgeInsets.all(HomePage.Width*0.015),
//           //       decoration: BoxDecoration(
//           //           borderRadius: BorderRadius.all(Radius.circular(HomePage.Height*0.01)),
//           //           color: LoginPage.bgColor,
//           //           boxShadow: [BoxShadow(
//           //             blurRadius:2,
//           //             offset: Offset(4, 4),
//           //             color: Color(0xFFA7A9AF),
//           //             inset :addToCart,
//           //           ),
//           //             BoxShadow(
//           //               blurRadius: 2,
//           //               offset: Offset(-4, -4),
//           //               color: Colors.white,
//           //               inset :addToCart,
//           //             ),
//           //           ]
//           //       ),
//           //       child: IconButton(onPressed: (){ setState(() {
//           //
//           //         addToCart = !addToCart;
//           //       });}, icon: Icon(Icons.shopping_cart,))),
//           // ),
//           Container(
//
//             margin: EdgeInsets.all(HomePage.Width*0.015),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.circular(HomePage.Height*0.01)),
//                 color: LoginPage.bgColor,
//                 boxShadow: [BoxShadow(
//                   blurRadius:2,
//                   offset: Offset(4, 4),
//                   color: Color(0xFFA7A9AF),inset :favorite,
//                 ),
//                   BoxShadow(
//                     blurRadius: 2,
//                     offset: Offset(-4, -4),
//                     color: Colors.white,inset :favorite,
//                   ),
//                 ]
//             ),
//             alignment: Alignment.centerRight,
//             child: IconButton(onPressed: (){
//               setState(() {
//                 favorite = !favorite;
//               });
//             }, icon: favorite?Icon(Icons.favorite,color: Colors.red,):Icon(Icons.favorite_border,color: Colors.red,)),
//           ),
//
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(children: [
//           SizedBox(
//             height: HomePage.Height*0.01,
//           ),
//           GFCarousel(
//             height: MediaQuery.of(context).size.height*0.37,
//             // autoPlay: true,
//             items: ProductImages.map(
//                   (url) {
//                 return InkWell(
//                   onTap: (){
//
//                   },
//                   child: Container(
//                     width: HomePage.Width,
//
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(HomePage.Width*0.03),
//                         color: Colors.white,
//                         boxShadow: [BoxShadow(
//                           blurRadius: 3,
//
//                           offset: Offset(-4, -4),
//                           color: Colors.white60,
//
//                         )
//                           ,BoxShadow(
//                             blurRadius: 3,
//                             offset: Offset(4, 4),
//                             color: Color(0xFFA7A9AF),
//
//                           ),]
//
//                     ),
//                     margin: EdgeInsets.only(top: HomePage.Height*0.009,bottom:HomePage.Height*0.009,left:  HomePage.Width*0.015,right: HomePage.Width*0.015,),
//
//                     child: ClipRRect(
//                       child: Container(
//                         width: double.infinity,
//                         child: Image.network(
//                             url,
//                             fit: BoxFit.contain,
//                             width: HomePage.Width*0.9
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ).toList(),
//             onPageChanged: (index) {
//               setState(() {
//                 for(int i=0;i<image.length;i++) {
//                   if (i == index) {
//                     image[i] = true;
//                   } else {
//                     image[i] = false;
//                   }
//                 }
//               });
//             },
//           ),
//           Container(
//             height: HomePage.Height*0.02,
//             child: Row(mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding:EdgeInsets.all(HomePage.Width*0.01),
//                   child: Container(
//                     width: HomePage.Width*0.02,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: image[0]?Colors.black38:Colors.transparent,
//                       border: Border.all(color: Colors.black38),
//                     ),
//
//                   ),
//                 ), Padding(
//                   padding:EdgeInsets.all(HomePage.Width*0.01),
//                   child: Container(
//                     width: HomePage.Width*0.02,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: image[1]?Colors.black38:Colors.transparent,
//                       border: Border.all(color: Colors.black38),
//                     ),
//
//                   ),
//                 ), Padding(
//                   padding:EdgeInsets.all(HomePage.Width*0.01),
//                   child: Container(
//                     width: HomePage.Width*0.02,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: image[2]?Colors.black38:Colors.transparent,
//                       border: Border.all(color: Colors.black38),
//                     ),
//
//                   ),
//                 ), Padding(
//                   padding:EdgeInsets.all(HomePage.Width*0.01),
//                   child: Container(
//                     width: HomePage.Width*0.02,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: image[3]?Colors.black38:Colors.transparent,
//                       border: Border.all(color: Colors.black38),
//                     ),
//
//                   ),
//                 ), Padding(
//                   padding:EdgeInsets.all(HomePage.Width*0.01),
//                   child: Container(
//                     width: HomePage.Width*0.02,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: image[4]?Colors.black38:Colors.transparent,
//                       border: Border.all(color: Colors.black38),
//                     ),
//
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//               alignment: Alignment.centerLeft,
//               padding: EdgeInsets.only(top:HomePage.Height*0.01,left: HomePage.Width*0.025,right: HomePage.Width*0.025),
//               child: Text("${widget.productName}.",style: Theme.of(context).textTheme.headline6)),
//           Container(
//               height: HomePage.Height*0.07,
//               padding: EdgeInsets.only(top:HomePage.Height*0.01,left: HomePage.Width*0.025,right: HomePage.Width*0.025),
//               child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       Icon(Icons.currency_rupee,color: Colors.black),
//                       SizedBox(
//                         width: HomePage.Width*0.015,
//                       ),
//                       Text("${widget.sellingPrice}",style: Theme.of(context).textTheme.headline5),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment. spaceAround,
//                     children: [
//                       InkWell(
//                         onTap: () async {
//                           setState(() {
//
//                             qtyMinus = !qtyMinus;
//                             if(Qty>1){
//                               Qty--;
//                               total = int.parse(widget.sellingPrice)*Qty;
//                             }
//                           });
//                           await Future.delayed(Duration(milliseconds: 300),() {
//                             setState(() {
//                               qtyMinus= false;
//                             });
//                           },);
//                         },
//                         child: Container(
//                             width: HomePage.Width*0.11,
//                             height: HomePage.Width*0.11,
//                             alignment: Alignment.center,
//                             decoration: BoxDecoration(
//                               // borderRadius: BorderRadius.all(Radius.circular(HomePage.Height*0.01)),
//                                 color: LoginPage.bgColor,
//                                 shape: BoxShape.circle,
//                                 boxShadow: [BoxShadow(
//                                   blurRadius:1,
//                                   offset: Offset(2, 2),
//                                   color: Color(0xFFA7A9AF),
//                                   inset :qtyMinus,
//                                 ),
//                                   BoxShadow(
//                                     blurRadius: 1,
//                                     offset: Offset(-2, -2),
//                                     color: Colors.white,
//                                     inset :qtyMinus,
//                                   ),
//                                 ]
//                             ),
//                             child: Center(
//                               child: IconButton(onPressed: () async {
//                                 setState(() {
//                                   if(Qty>1){
//                                     Qty--;total = int.parse(widget.sellingPrice)*Qty;
//                                   }
//                                   qtyMinus =!qtyMinus;
//                                 });
//                                 await Future.delayed(Duration(milliseconds:300),() {
//                                   setState(() {
//                                     qtyMinus= false;
//                                   });
//                                 },);
//                               }, icon: Icon(Icons.remove), ),
//                             )),
//                       ),
//                       SizedBox(
//                         width: HomePage.Width*0.02,
//                       ),
//                       Container(
//                           width: HomePage.Width*0.15,
//                           height: HomePage.Width*0.2,
//                           alignment: Alignment.center,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.all(Radius.circular(HomePage.Height*0.01)),
//                               color: LoginPage.bgColor,
//                               boxShadow: [BoxShadow(
//                                   blurRadius:2,
//                                   offset: Offset(2, 2),
//                                   color: Color(0xFFA7A9AF),
//                                   inset: true
//                               ),
//                                 BoxShadow(
//                                     blurRadius: 2,
//                                     offset: Offset(-2, -2),
//                                     color: Colors.white,
//                                     inset: true
//                                 ),
//                               ]
//                           ),
//                           child: Center(
//                               child:Text("${Qty}",style: Theme.of(context).textTheme.headline5,)
//                           )),
//                       SizedBox(
//                         width: HomePage.Width*0.02,
//                       ),
//                       InkWell(
//                         onTap: () async {
//                           setState(() {
//                             if(Qty>0){
//                               Qty++;total = int.parse(widget.sellingPrice)*Qty;
//                             }
//                             qtyPluse = !qtyPluse;
//                           });
//                           await Future.delayed(Duration(milliseconds: 300),() {
//                             setState(() {
//                               qtyPluse= false;
//                             });
//                           },);
//                         },
//                         child: Container(
//                           // margin: EdgeInsets.all(HomePage.Height*0.02),
//                             width: HomePage.Width*0.11,
//                             height: HomePage.Width*0.11,
//                             // alignment: Alignment.center,
//                             decoration: BoxDecoration(
//                               // borderRadius: BorderRadius.all(Radius.circular(HomePage.Height*0.01)),
//                                 color: LoginPage.bgColor,
//                                 shape: BoxShape.circle,
//                                 boxShadow: [BoxShadow(
//                                   blurRadius:1,
//                                   offset: Offset(2,2),
//                                   color: Color(0xFFA7A9AF),
//                                   inset :qtyPluse,
//                                 ),
//                                   BoxShadow(
//                                     blurRadius: 1,
//                                     offset: Offset(-2, -2),
//                                     color: Colors.white,
//                                     inset :qtyPluse,
//                                   ),
//                                 ]
//                             ),
//                             child: Center(
//                               child: IconButton(onPressed: () async {
//                                 setState(() {
//                                   if(Qty>0){
//                                     Qty++;total = int.parse(widget.sellingPrice)*Qty;
//                                   }
//                                   qtyPluse =!qtyPluse;
//                                 });
//                                 await Future.delayed(Duration(milliseconds:300),() {
//                                   setState(() {
//                                     qtyPluse= false;
//                                   });
//                                 },);
//                               }, icon: Icon(Icons.add), ),
//                             )),
//                       ),
//                       SizedBox(width: HomePage.Width*0.02,)
//                     ],
//                   )
//                 ],
//               )),
//
//           SizedBox(
//             height: HomePage.Height*0.02,
//           ),
//           Container(
//               height: HomePage.Height*0.07,
//               padding: EdgeInsets.only(top:HomePage.Height*0.01,left: HomePage.Width*0.025,right: HomePage.Width*0.025),
//               child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//
//                   Text("Colors :",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black45),),
//                   Container(
//                     height: HomePage.Height*0.07,
//                     width: HomePage.Height*0.35,
//
//                     child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,mainAxisSpacing: HomePage.Width*0.01),scrollDirection: Axis.horizontal, itemCount: productColors.length,itemBuilder: (context, index) {
//                       return Container(
//
//                           width: HomePage.Width*0.1,
//                           height: HomePage.Width*0.1,
//                           margin: EdgeInsets.all(HomePage.Width*0.01),
//                           // alignment: Alignment.center,
//                           decoration: BoxDecoration(
//                             // borderRadius: BorderRadius.all(Radius.circular(HomePage.Height*0.01)),
//                               color: LoginPage.bgColor,
//                               border: colors[index]?Border.all(color: productColors[index],width: 2):null,
//                               shape: BoxShape.circle,
//                               boxShadow: [BoxShadow(
//                                 blurRadius:1,
//                                 offset: Offset(2,2),
//                                 color: Color(0xFFA7A9AF),
//                                 inset :colors[index],
//                               ),
//                                 BoxShadow(
//                                   blurRadius: 1,
//                                   offset: Offset(-2, -2),
//                                   color: Colors.white,
//                                   inset :colors[index],
//                                 ),
//                               ]
//                           ),
//                           child: Center(
//                               child: InkWell(onTap: () {
//                                 setState(() {
//                                   for(int i=0;i<colors.length;i++){
//                                     if(i==index){
//                                       colors[index]=true;
//                                     }else{
//                                       colors[i]=false;
//                                     }
//                                   }
//
//                                 });
//                               },
//                                 child: Container(
//                                   margin: EdgeInsets.all(HomePage.Height*0.005),
//                                   decoration: BoxDecoration(
//                                     // borderRadius: BorderRadius.all(Radius.circular(HomePage.Height*0.01)),
//                                       color: productColors[index],
//                                       shape: BoxShape.circle,
//                                       boxShadow: [BoxShadow(
//                                         blurRadius:1,
//                                         offset: Offset(2,2),
//                                         color: colors[index]?productColors[index]:Color(0xFFA7A9AF),
//                                         inset :colors[index],
//                                       ),
//                                         BoxShadow(
//                                           blurRadius: 1,
//                                           offset: Offset(-2, -2),
//                                           color: colors[index]?productColors[index]:Colors.white,
//                                           inset :colors[index],
//                                         ),
//                                       ]
//                                   ),
//
//                                 ),
//                               )
//                           ));
//                     },),
//                   ),
//                 ],
//               )),
//           SizedBox(
//             height: HomePage.Height*0.02,
//           ),
//           Container(
//             alignment: Alignment.centerLeft,
//             height: HomePage.Height*0.04, padding: EdgeInsets.only(top:HomePage.Height*0.01,left: HomePage.Width*0.025,right: HomePage.Width*0.025),
//             child: Text("Product Description :-",style:TextStyle(fontWeight: FontWeight.bold,color: LoginPage.theamColor)),
//           ),
//           Container(
//             // height: HomePage.Height*0.2,
//             padding: EdgeInsets.only(top:HomePage.Height*0.01,left: HomePage.Width*0.025,right: HomePage.Width*0.025),
//             child: SingleChildScrollView(child: Text("${widget.productDetail}",style:TextStyle(fontWeight: FontWeight.bold,color: Colors.black38))),
//           ),
//           SizedBox(
//             height: HomePage.Height*0.02,
//           ),
//           Container(
//             height: HomePage.Height*0.1,
//             child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 InkWell(
//                   onTap: () async {
//                     setState(() {
//                       addToCartbutton = !addToCartbutton;
//                       qty.add(Qty.toString());
//
//                     });
//                     await Future.delayed(Duration(milliseconds: 300),() {
//                       setState(() {
//                         addToCartbutton= false;
//                       });
//                     },);
//
//
//                     // productName,mainImg,img1,img2,img3,img4,sellingPrice,mrpPrice,discount,Catagory,productDetail;
//                     // Loding.sp!.setStringList('productName', pName);
//                     // Loding.sp!.setStringList('mainImg', mainImg);
//                     // Loding.sp!.setStringList('sellingPrice', price);
//                     // Loding.sp!.setStringList('discount', disPrice);
//                     // Loding.sp!.setStringList('Qty', qty);
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => MyCart(
//                       pName,
//                       mainImg,
//                       price,
//                       disPrice,
//                       qty,
//                     ),));
//                   },
//                   child: Container(
//                       width: HomePage.Width*0.47,
//                       margin: EdgeInsets.all(HomePage.Width*0.01),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.all(Radius.circular(HomePage.Height*0.01)),
//                           color: LoginPage.theamColor,
//                           boxShadow: [BoxShadow(
//                             blurRadius:4,
//                             offset: Offset(4, 4),
//                             color: Color(0xFFA7A9AF),
//                             inset :addToCartbutton,
//                           ),
//                             BoxShadow(
//                               blurRadius: 4,
//                               offset: Offset(-4, -4),
//                               color: Colors.white,
//                               inset :addToCartbutton,
//                             ),
//                           ]
//                       ),
//                       child: ListTile(
//
//                         leading: IconButton(onPressed: ()async{ setState(() {
//                           addToCartbutton = !addToCartbutton;
//                         });
//                         await Future.delayed(Duration(milliseconds: 300),() {
//                           setState(() {
//                             addToCartbutton= false;
//                           });
//                         },);
//                         }, icon: Icon(Icons.shopping_cart,color: Colors.white,)),title: Text("Add To Cart",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,),),
//                       )),
//                 ),
//                 InkWell(
//                   onTap: () async {
//                     setState(() {
//                       buyNowButton = !buyNowButton;
//                     });
//                     await Future.delayed(Duration(milliseconds: 300),() {
//                       setState(() {
//                         buyNowButton= false;
//                       });
//                     },);
//
//
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => Payment(widget.productName,total,widget.productDetail),));
//                   },
//                   child: Container(
//                       width: HomePage.Width*0.47,
//                       margin: EdgeInsets.all(HomePage.Width*0.01),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.all(Radius.circular(HomePage.Height*0.01)),
//                           color: Colors.green,
//                           boxShadow: [BoxShadow(
//                             blurRadius:4,
//                             offset: Offset(4, 4),
//                             color: Color(0xFFA7A9AF),
//                             inset :buyNowButton,
//                           ),
//                             BoxShadow(
//                               blurRadius: 4,
//                               offset: Offset(-4, -4),
//                               color: Colors.white,
//                               inset :buyNowButton,
//                             ),
//                           ]
//                       ),
//                       child: ListTile(
//
//                         leading: IconButton(onPressed: ()async{ setState(() {
//                           buyNowButton = !buyNowButton;
//                         });
//                         await Future.delayed(Duration(milliseconds: 300),() {
//                           setState(() {
//                             buyNowButton= false;
//                           });
//                         },);
//                         }, icon: Icon(Icons.shopping_bag,color: Colors.white,)),title: Text("Buy Now",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,),),
//                       )),
//                 ),
//               ],
//             ),
//           )
//
//         ],),
//       ),
//     );
//   }
// }
