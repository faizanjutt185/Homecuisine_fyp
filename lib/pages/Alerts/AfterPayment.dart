import 'package:flutter/material.dart';
import 'package:homie_cuisine/widgets/small_text.dart';

import '../../NavBar.dart';
import '../../widgets/big_text.dart';
import '../Cart/cart_page.dart';
import '../home/main_foodpage.dart';

class AfterPayment extends StatelessWidget {
  const AfterPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),

      body: Center(
        child: AlertDialog(
          title: Text("THANK YOU"),
          titlePadding: EdgeInsets.only(left: 85,top: 20),
          content:
             Bigtext(text: 'You have Successfully placed your order', size: 14,),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.deepOrange
              ),
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Mainfoodpage()));
              },
              child:
              Bigtext(text: 'Explore More Dishes'),
            ),

          ],
        ),
      ),

    );
  }
}
