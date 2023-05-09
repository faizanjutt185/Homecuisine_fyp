import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homie_cuisine/pages/auth/sign_in_page.dart';
import 'package:homie_cuisine/utils/dimensions.dart';
import 'package:homie_cuisine/widgets/small_text.dart';

import '../../widgets/big_text.dart';
import '../Cart/cart_page.dart';
import 'AfterPayment.dart';

class Payments extends StatelessWidget {
  const Payments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: Container(
        height: 350,
        width: Dimensions.screenWidth,
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(left: 0.0, top: 2, right: 20)),
            Container(
              padding: EdgeInsets.only(left: 0.0),
              width: 70,
              height: 60,
              color: Colors.white70,
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/hbl.png"),
              ),
            ),
            Smalltext(
              text: "Homie Cuisine",
              color: Colors.black54,
            ),
            Smalltext(
              text: "REF NO: 12894202",
              color: Colors.black54,
            ),
            Column(children: [
              Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20),
                      labelText: "Card Number",
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20),
                      labelText: "Valid Thru DD/MM/YY",
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20),
                      labelText: "Card Holder Name",
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20),
                      labelText: "Cvv",
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Column(
                children: [
                  TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.teal,
                      ),
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AfterPayment()));
                      },
                      child: Smalltext(text:'PAY PAYMENT', size: 25, color: Colors.white70,)
                  ),
                ],
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
