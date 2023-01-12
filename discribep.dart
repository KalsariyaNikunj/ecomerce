import 'package:flutter/material.dart';
import 'package:loginpage/viewproduct.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class diproduct extends StatefulWidget {
  diproduct(this.productdata);

  Productdata productdata;

  @override
  State<diproduct> createState() => _diproductState();
}

class _diproductState extends State<diproduct> {
  String? name;
  String? images;
  String? price;
  String? stoke;
  String? discription;
  Razorpay _razorpay = Razorpay();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    images = widget.productdata.pIMAGES;
    name = widget.productdata.pNAME;
    price = widget.productdata.pPRICE;
    stoke = widget.productdata.pSTOKE;
    discription = widget.productdata.pDISCRIPTION;
  }

  @override
  Widget build(BuildContext context) {
    double theight = MediaQuery
        .of(context)
        .size
        .height;
    double twidth = MediaQuery
        .of(context)
        .size
        .width;
    double sbheigth = MediaQuery
        .of(context)
        .padding
        .top;
//    double nvheight = MediaQuery.of(context).padding.bottom;

    double
    abheight = kToolbarHeight;

    double bheight = theight - (sbheigth); //+ nvheight );


    return Scaffold(
      appBar: AppBar(title: Center(child: Text("${name}"))),
      body: Column(children: [
        Container(height: bheight * 0.50, width: double.infinity,
          child: Image.network(
              "https://nikunjstore.000webhostapp.com/Imagesdata/addproduct/${images}"),

        ),

        Container(height: bheight * 0.10, width: double.infinity,
          child: Center(child: Text("Price=${price}")),
        ),
        Container(height: bheight * 0.10, width: double.infinity,
          child: Center(child: Text("Stoke=${stoke}")),
        ),
        Container(height: bheight * 0.10, width: double.infinity,
          child: Center(child: Text("Discription=${discription}")),
        ),


        Row(children: [
          InkWell(onTap: () {

          },
            child: Container(height: bheight * 0.10,
              width: twidth * 0.50,
              color: Colors.red,
              child: Center(child: Text("Add to Cart")),),
          ),
          InkWell(onTap: () {
    _razorpay = Razorpay();

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
          openCheckout() ;

    }










          ,
            child: Container(height: bheight * 0.10,
              width: twidth * 0.50,color: Colors.blue,
              child: Center(child: Text("Buy")),),
          )
        ],)


      ]),
    );
  }
void _handlePaymentSuccess(PaymentSuccessResponse response) {

  var orderId = response.orderId;
  var signature = response.signature;
  var paymentId = response.paymentId;

  //Do your stuff

}

void _handlePaymentError(PaymentFailureResponse response) {
  var code= response.code;
  var message = response.message ;
}

void _handleExternalWallet(ExternalWalletResponse response) {

}
void openCheckout() {
  //create a Map which details

  var options = {

    "key": "rzp_test_aFwY27xruUecqu",
    "amount":1,
    "name": "test",
    "description": "Test Payment",
 //  "order_id":,
    "timeout": "60",
    "theme.color": "#5eba7d",
    "currency": "INR",
    "prefill": {"contact": "546338833332", "email": "test@testing.com"},

  };
  try {
    _razorpay.open(options);
  } catch (e) {
    print(e.toString());
  }
}

}
