import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homie_cuisine/pages/auth/sign_in_page.dart';
import 'package:homie_cuisine/pages/food/popular_food_detail.dart';
import 'package:homie_cuisine/utils/dimensions.dart';
import 'package:homie_cuisine/widgets/big_text.dart';
import 'package:homie_cuisine/widgets/small_text.dart';

import '../../Chef to Customer/Dishess.dart';
import '../../routes/route_helper.dart';
import '../../widgets/app_column.dart';
import '../Chefs/All_chefs.dart';
import '../Disease search/Disease_page.dart';
import '../Weekly Meal Plan/Home_Chefs.dart';
import '../Weekly Meal Plan/weekly_chefs.dart';
import 'Search_Foods.dart';

//import '../widgets/icon_and_text_widget.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
 // final searchTextController = TextEditingController();
  PageController pageController = PageController(viewportFraction: 0.90);
  var _currPageValue = 0.0;
  double scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      //searchbar of Main Dashboard
      Container(
        width: Dimensions.screenWidth,
        margin: const EdgeInsets.only(top: 10),
        height: 50,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: (Colors.grey.withOpacity(0.5)),
                spreadRadius: 2,
                blurRadius: 10,
                offset: Offset(0, 3),
              ),
            ]),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Row(
            children: [
              Icon(
                CupertinoIcons.search,
                color: Colors.deepOrange,
              ),
              Container(
                height: 50,
                width: 300,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: TextFormField(
                  //  controller: searchTextController,
                    decoration: InputDecoration(
                      hintText: "Search For Dishes or Fav Chiefs",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(right: 20)),
              Flexible(
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    child: Text('Search'),
                    onPressed: () {
                     // searchFoods(context, searchTextController.text);
                    },
                  ),
                ),
              ),


            ],
          ),
        ),
        //category
      ),
      //Slider section
      Container(
        // color: Colors.deepOrange,
        height: 290,
        margin: const EdgeInsets.only(top: 15),
        child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, position) {
              return _buildPageItem(position);
            }),
      ),
      //dots
      DotsIndicator(
        dotsCount: 5,
        position: _currPageValue,
        decorator: DotsDecorator(
          activeColor: Colors.deepOrange,
          size: const Size.square(9.0),
          activeSize: const Size(18.0, 9.0),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
      ),
      //popular text
      SizedBox(
        height: Dimensions.height10,
      ),
      Container(
        margin: EdgeInsets.only(left: Dimensions.width30),
        child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Bigtext(text: "Recommended"),
          SizedBox(
            width: Dimensions.width10,
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 3),
            child: Bigtext(text: ".", color: Colors.black),
          ),
          SizedBox(
            width: Dimensions.width10,
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 2),
            child: Smalltext(
              text: "Food Pairing",
              color: Colors.black,
            ),
          )
        ]),
      ),





      //Bottom Further menu options navigate to different screens
      ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 1,
        itemBuilder: (context, index) {
          return Container(
              height: Dimensions.listViewTextContSize,
              width: Dimensions.screenWidth,
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                BoxShadow(
                blurRadius: 5,
              ),
            ],
              ),
            margin: EdgeInsets.only(
              top: Dimensions.height10,
              left: Dimensions.width20,
              right: Dimensions.width20,
            ),
            child: ListTile(
              title: Bigtext(
                text: "Popular Dishes", size: 24,
                color: Colors.white,
              ),
              subtitle: Smalltext(
                text: "Browse through our entire selection", size: 19,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CustomerUI(),
                  ),
                );
              },
            ),
          );
        },
      ), //For upper comment after work
      ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 1,
        itemBuilder: (context, index) {
          return Container(
            height: Dimensions.listViewTextContSize,
            width: Dimensions.screenWidth,
            decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                ),
              ],
            ),
            margin: EdgeInsets.only(
              top: Dimensions.height10,
              left: Dimensions.width20,
              right: Dimensions.width20,
            ),
            child: ListTile(
              title: Bigtext(
                text: "Weekly Meal Plans", size: 24,
                color: Colors.white,
              ),
              subtitle: Smalltext(
                text: "Order from selected menus", size: 19,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WeeklyChefs(),
                  ),
                );
              },
            ),
          );
        },
      ),
      ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 1,
        itemBuilder: (context, index) {
          return Container(
            height: Dimensions.listViewTextContSize,
            width: Dimensions.screenWidth,
            decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                ),
              ],
            ),
            margin: EdgeInsets.only(
              top: Dimensions.height10,
              left: Dimensions.width20,
              right: Dimensions.width20,
            ),
            child: ListTile(
              title: Bigtext(
                text: "Meet Our Chefs", size: 24,
                color: Colors.white,
              ),
              subtitle: Smalltext(
                text: "View our chefs and their specialities", size: 19,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AllChefsPage(),
                  ),
                );
              },
            ),
          );
        },
      ),
      ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 1,
        itemBuilder: (context, index) {
          return Container(
            height: Dimensions.listViewTextContSize,
            width: Dimensions.screenWidth,
            decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                ),
              ],
            ),
            margin: EdgeInsets.only(
              top: Dimensions.height10,
              left: Dimensions.width20,
              right: Dimensions.width20,
              bottom: Dimensions.height10,
            ),
            child: ListTile(
              title: Bigtext(
                text: "Search Food", size: 24,
                color: Colors.white,
              ),
              subtitle: Smalltext(
                text: "Healthy food base on diseases", size: 19,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DiseaseSearchScreen(),
                  ),
                );
              },
            ),
          );
        },
      ),
    ]);
  }
  Widget _buildPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          scaleFactor + (_currPageValue - index + 1) * (1 - scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - scaleFactor);
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - scaleFactor) / 2, 1);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteHelper.getPopularFood());
            },
            child: Container(
              height: Dimensions.pageViewContainer,
              margin: EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: index.isEven ? Colors.deepOrange : Colors.deepOrange,
                  image: DecorationImage(
                      image: AssetImage("assets/images/image3.jpg"))),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: Dimensions.pageViewTextContainer,
                margin: EdgeInsets.only(left: 40, right: 40, bottom: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black54,
                          blurRadius: 5.0,
                          offset: Offset(5, 5))
                    ]),
                child: Container(
                  padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                  child: AppColumn(),
                ),
              ))
        ],
      ),
    );
  }
}
