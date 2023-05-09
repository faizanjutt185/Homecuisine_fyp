import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';
import 'package:date_time_picker/date_time_picker.dart';

import 'Proceed_Order.dart';
class MealPlan extends StatefulWidget {
  @override
  _MealPlanState createState() => _MealPlanState();
}

class _MealPlanState extends State<MealPlan> {
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

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
              text: "Meal Plan",
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
              Padding(
                padding: EdgeInsets.only(top: 5),
              ),
              Bigtext(
                text: "MENU",
                size: 25,
                color: Colors.black54,
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 4,
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
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                              Smalltext(
                                text: "Price 500 per Meal",
                                size: 18,
                                color: Colors.black54,
                              ),
                              Column(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 170,
                                    child: TextField(
                                      decoration: const InputDecoration(
                                          icon: Icon(Icons.calendar_today),
                                          labelText: "Select Date/Time"),
                                      readOnly: true,
                                      onTap: () async {
                                        DateTime? pickedDate = await showDatePicker(
                                            context: context,
                                            initialDate: _selectedDate!,
                                            firstDate: DateTime(2021),
                                            lastDate: DateTime(2023));
                                        if (pickedDate != null) {
                                          setState(() {
                                            _selectedDate = pickedDate;
                                          });
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
                          Checkbox(
                            value: false,
                            onChanged: (bool? value) {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
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
                      child: Smalltext(text:'Proceed to Order', size: 18, color: Colors.black54,)
                  ),
                ],
              ),
            ],
          ),
        ),
      ), // centerTitle: true,
    );
  }
}
class DateController {
  final TextEditingController controller = TextEditingController();

  void dispose() {
    controller.dispose();
  }
}