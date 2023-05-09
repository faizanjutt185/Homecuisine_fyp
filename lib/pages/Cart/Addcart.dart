import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homie_cuisine/widgets/big_text.dart';
import '../Chefs/Dishes.dart';


class Addcart extends StatelessWidget {
  // const Addcart({Key? key}) : super(key: key);
  TextEditingController dateController = TextEditingController();
  /*@override
  void initState(){
    super.initState();
    dateController.text="";
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: AlertDialog(
        title: Text("Confirm Delivery Date and time"),
        content: TextField(
          controller: dateController,
          decoration: const InputDecoration(
            icon: Icon(Icons.calendar_today),
            labelText: "Select Date",
          ),
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2023),
            );
            if (pickedDate != null) {
              /*setState((){
                dateController.text=pickedDate.toString();
              });*/
            } else {
              print("Not Selected");
            }
          },
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.deepOrange
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Dishes()));
            },
            child:
            Bigtext(text: "Add More Dishes", color: Colors.black54, size: 15,),
          ),
          TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.deepOrange
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Dishes()));
            },
            child:
            Bigtext(text: "OK", color: Colors.black54, size: 15,),
          )
        ],
      )),
    );
  }
}