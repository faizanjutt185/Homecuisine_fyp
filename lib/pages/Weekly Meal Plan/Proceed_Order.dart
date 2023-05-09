import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/dimensions.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';
import '../Alerts/Payments.dart';
import '../Alerts/PromoCode.dart';

class ProceedOrder extends StatelessWidget {
  //const ProceedOrder({Key? key}) : super(key: key);

  TextEditingController dateController = TextEditingController();

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
              text: "Cart",
              color: Colors.white,
              size: 33,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 2,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) => Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                  child: Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding:
                      EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 65.0,
                            height: 65.0,
                            color: Colors.deepOrange,
                            child: CircleAvatar(
                              backgroundColor: Colors.deepOrange,
                              foregroundColor: Colors.deepOrange,
                              backgroundImage:
                              AssetImage("assets/images/Faizans.jpg"),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Bigtext(
                                text: "Desi Saag | 2 Roti",
                                size: 23,
                                color: Colors.black54,
                              ),
                              //Icon(Icons.star), Icon(Icons.star), Icon(Icons.star),
                              Smalltext(
                                text: "Price 500 per Meal",
                                size: 18,
                                color: Colors.black54,
                              ),

                              //Set the date or time here for Meal Plan

                              Column(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 200,
                                    child: TextField(
                                      controller: dateController,
                                      decoration: const InputDecoration(
                                          icon: Icon(Icons.calendar_today),
                                          labelText: "Select Date/Time"),
                                      readOnly: true,
                                      onTap: () async {
                                        DateTime? pickedDate =
                                        await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(2021),
                                            lastDate: DateTime(2023));
                                        if (pickedDate != null) {
                                        } else {
                                          print("Not Selected");
                                        }
                                      },
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          Container(
                            //color: Colors.deepOrange,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 0.0, vertical: 0.0),
                            child: Text(
                              "Rs 520",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    child: Bigtext(
                        text: "How many people are you subscribing for?"),
                  )
                ],
              ),
              Row(
                children: [
                  SizedBox(
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
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(top: 2, left: 8),
                    child: Bigtext(text: "Days You Are Subscribing for"),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(top: 0, left: 8),
                    child: Bigtext(text: "Thu - Fri", color: Colors.deepOrange),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(top: 2, left: 8),
                    child: Bigtext(
                      text: "Price Per Meal",
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
                      text: "Total Meal Plan Amount",
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
              Column(children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(top: 0, left: 8),
                  child: Bigtext(
                    text: "Delivery Fee Per Day",
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Smalltext(
                      text: "Rs.100",
                      size: 20,
                      color: Colors.black54,
                    ),
                  ],
                ),
              ]),
              Column(children: [
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
                      child: Text("Code"),
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
                Column(children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(top: 0, left: 8),
                    child: Bigtext(
                      text: "Payment",
                      size: 22,
                    ),
                  ),
                  Column(
                    children: [
                      TextButton(
                          onPressed:() {
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
                          onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProceedOrder()));
                          },
                          child: Smalltext(text:'Place Order', size: 25, color: Colors.black54,)
                      ),
                    ],
                  ),
                ]),
              ]),
            ],
          ),
        ),
      ),

    );
  }
}
