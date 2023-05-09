import 'package:flutter/material.dart';
import 'package:homie_cuisine/utils/dimensions.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final IconData icon;
  const AppTextField({Key? key,
  required this.textController,
  required this.icon,
  required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: Dimensions.height20, right: Dimensions.height20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimensions.radius30),
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                spreadRadius: 7,
                offset: Offset(1, 10),
                color: Colors.grey.withOpacity(0.2)
            )
          ]
      ),
      child: TextField(
        controller: textController,
        decoration: InputDecoration(
          //hintText
            hintText: hintText,
            prefixIcon: Icon(icon, color: Colors.deepOrange,),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                borderSide: BorderSide(
                  width: 1.0,
                  color: Colors.white,
                )
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                borderSide: BorderSide(
                  width: 1.0,
                  color: Colors.white,
                )
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
            )
          // prefixicon //focusedBorder //enabledBorder //border
        ),

      ),
    );
  }
}
