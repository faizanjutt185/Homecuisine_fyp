import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homie_cuisine/widgets/big_text.dart';
import 'package:homie_cuisine/widgets/small_text.dart';
import '../../NavBar.dart';
import 'food_page_body.dart';
//import 'package:flutter/src/material/drawer.dart';

class Mainfoodpage extends StatefulWidget {
  const Mainfoodpage({Key? key}) : super(key: key);
  @override
  State<Mainfoodpage> createState() => _MainfoodpageState();
}
class _MainfoodpageState extends State<Mainfoodpage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.deepOrange,
        //centerTitle: false,
        titleSpacing: 0,
        title: Column(children: [
          Bigtext(text: 'HOMIE CUISINE', color: Colors.white, size: 43,),
          Row(
            children: [
              Smalltext(text: '     Order Hygienic Homemade Food', color: Colors.white,size: 16,)
            ],
          )

        ],),

         // centerTitle: true,
        ),
      drawer: NavBar(),

      body: Column(
        children: [
          Expanded(child: SingleChildScrollView(
            child: FoodPageBody(),
          )),
        ],
      ),
    );
  }
}