import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:homie_cuisine/pages/Cart/Addcart.dart';
import 'package:homie_cuisine/pages/home/main_foodpage.dart';
import 'package:homie_cuisine/utils/dimensions.dart';
import 'package:homie_cuisine/widgets/app_icon.dart';
import 'package:homie_cuisine/widgets/small_text.dart';

import '../../widgets/big_text.dart';
import '../Alerts/AfterPayment.dart';
import '../Alerts/Payments.dart';
import '../Alerts/PromoCode.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.deepOrange,
        //centerTitle: false,
        titleSpacing: 0,
        title: Column(
          children: [
            Align(
              alignment: Alignment.center,
            ),
            Bigtext(
              text: "Your Cart",
              color: Colors.white,
              size: 33,
            ),
          ],
        ),
        // centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 40,
            color: Colors.white,
            padding: EdgeInsets.only(top: 0, left: 5),
            child: Row(
              children: [
                Bigtext(
                  text: "Delivery on:",
                  color: Colors.black54,
                  size: 25,
                ),
              ],
            ),
          ),
          /*Divider(
            color: Colors.black,
            thickness: 1,
          ),

          Row(
            children: [
              Container(
                height: Dimensions.height30,
                width: Dimensions.width20 / 2,
              ),
              Icon(
                Icons.remove,
                color: Colors.deepOrange,
              ),
              SizedBox(
                width: Dimensions.width10 / 2,
              ),
              Bigtext(text: "0"),
              SizedBox(
                width: Dimensions.width10 / 2,
              ),
              Icon(
                Icons.add,
                color: Colors.deepOrange,
              ),
              Bigtext(
                text: 'saag with 2 roti',
                size: 22,
                color: Colors.black54,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Smalltext(
                    text: 'Rs.800',
                    size: 20,
                    color: Colors.black54,
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Container(
                height: Dimensions.height45,
                width: Dimensions.width20 / 2,
              ),
              Icon(
                Icons.remove,
                color: Colors.deepOrange,
              ),
              SizedBox(
                width: Dimensions.width10 / 2,
              ),
              Bigtext(text: "0"),
              SizedBox(
                width: Dimensions.width10 / 2,
              ),
              Icon(
                Icons.add,
                color: Colors.deepOrange,
              ),
              Bigtext(
                text: 'saag with 2 roti',
                size: 22,
                color: Colors.black54,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Smalltext(
                    text: 'Rs.800',
                    size: 20,
                    color: Colors.black54,
                  ),
                ],
              ),
            ],
          ),*/
          Divider(
            color: Colors.black,
            thickness: 1,
          ),
          Column(
            children: [
              TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                  ),
                  onPressed: () {},
                  child: Smalltext(
                    text: 'Bargain With Chef',
                    color: Colors.black54,
                    size: 20,
                  )),
            ],
          ),
          Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top: 5, left: 8),
                child: Bigtext(text: 'Customize Recipe Instructions'),
              ),
            ],
          ),
          Column(
            children: [TextFormField()],
          ),
          Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top: 2, left: 8),
                child: Bigtext(
                  text: "Sub Total",
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Smalltext(
                    text: "Rs.520",
                    size: 20,
                    color: Colors.black54,
                  ),
                ],
              ),
            ],
          ),
          Divider(
            color: Colors.black,
            thickness: 1,
          ),
          Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top: 0, left: 8),
                child: Bigtext(
                  text: "Delivery Charges",
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Smalltext(
                    text: "Rs.1040",
                    size: 20,
                    color: Colors.black54,
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top: 0, left: 8),
                child: Bigtext(
                  text: "Promo Code",
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => PromoCode()));
                    },
                    child: Smalltext(
                      text: "Code",
                      color: Colors.black54,
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                    ),
                  )
                ],
              ),
              Divider(
                color: Colors.black,
                thickness: 1,
              ),
              Column(children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(top: 0, left: 8),
                  child: Bigtext(
                    text: "Order Total",
                    size: 22,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Smalltext(
                      text: "Rs.1140",
                      size: 20,
                      color: Colors.black54,
                    ),
                  ],
                ),
              ]),
              Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(top: 0, left: 8),
                    child: Bigtext(
                      text: "Delivery Address",
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(top: 5, left: 8),
                    child: Bigtext(
                      text: "Payment",
                      size: 22,
                    ),
                  ),
                  Column(
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Payments()));
                          },
                          child: Smalltext(
                            text: "Credit or Debit Card",
                            size: 16,
                            color: Colors.blueAccent,
                          ))
                    ],
                  ),
                  Column(
                    children: [
                      TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.deepOrange,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AfterPayment()));
                          },
                          child: Smalltext(
                            text: 'Place Order',
                            size: 25,
                            color: Colors.black54,
                          )),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
