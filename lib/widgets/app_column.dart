import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homie_cuisine/widgets/small_text.dart';

import 'big_text.dart';

class AppColumn extends StatelessWidget {
  const AppColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Bigtext(text: "CHINESE SIDE"),
        Bigtext(text: "Made By: M.faizan"),
        SizedBox(height: 10,),
        Row(
          children: [
            Wrap(
              children: List.generate(5, (index) => Icon(Icons.star, color:Colors.deepOrange, size: 15,)),
            ),
            SizedBox(width: 10,),
            Smalltext(text: "4.5", color: Colors.black,),
            SizedBox(width: 10,),
            Smalltext(text: "1287", color: Colors.black,),
            SizedBox(width: 10,),
            Smalltext(text: "Comments", color: Colors.black,)
          ],
        ),
        SizedBox(height: 10,),
      ],
    );
  }
}
