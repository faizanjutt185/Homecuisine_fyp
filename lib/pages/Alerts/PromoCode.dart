import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:homie_cuisine/widgets/big_text.dart';

import '../Cart/cart_page.dart';
import '../Chefs/Dishes.dart';


class PromoCode extends StatelessWidget {
  const PromoCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AlertDialog(
          title: Text("ADD PromoCode For Discounts"),
          content: TextField(
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.only(left: 75),
            labelText: "Enter Code Here",
            ),
          ),
          actions: [
            TextButton(
                style: TextButton.styleFrom(
              backgroundColor: Colors.deepOrange
            ),
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CartPage()));
              },
              child:
              Bigtext(text: 'No'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.deepOrange
              ),
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CartPage()));
              },
              child:
              Bigtext(text: 'Yes'),
            ),

          ],
        ),
      ),
    );
  }
}
