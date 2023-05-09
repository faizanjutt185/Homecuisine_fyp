import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/dimensions.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';
import '../Cart/Addcart.dart';
import '../auth/sign_in_page.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'Meal_Plan.dart';

class Homechefs extends StatelessWidget {
  const Homechefs({Key? key}) : super(key: key);
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
              text: "Home Chefs",
              color: Colors.white,
              size: 33,
            ),
          ],
        ),
        // centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 10,
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
                                text: "Faizan's Kitchen",
                                size: 25,
                                color: Colors.black54,
                              ),
                              //Icon(Icons.star), Icon(Icons.star), Icon(Icons.star),
                              Smalltext(
                                text: "Chef Rating:",
                                size: 18,
                                color: Colors.black54,
                              ),
                              Column(
                                children: [
                                  RatingBar.builder(
                                    initialRating: 4,
                                    minRating: 1,
                                    maxRating: 5,
                                    unratedColor: Colors.grey,
                                    itemCount: 5,
                                    itemSize: 15,
                                    itemPadding:
                                        EdgeInsets.symmetric(horizontal: 2.0),
                                    itemBuilder: (context, index) =>
                                        Icon(Icons.star, color: Colors.amber),
                                    onRatingUpdate: (ratingvalue) {},
                                  ),
                                ],
                              ),
                              Smalltext(
                                text: "Rs.800 for 2 Days",
                                size: 16,
                                color: Colors.black54,
                              ),
                            ],
                          ),
                          Container(
                            color: Colors.deepOrange,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 0.0, vertical: 0.0),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignInPage()));
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.symmetric(horizontal: 15.0),
                                textStyle: TextStyle(
                                  color: Colors.deepOrange,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2)),
                                ),
                              ),
                              child: Text(
                                "View Menu",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
