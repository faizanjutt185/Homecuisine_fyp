import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:homie_cuisine/pages/home/main_foodpage.dart';
import 'package:homie_cuisine/utils/dimensions.dart';

import '../../widgets/app_column.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';
import '../../widgets/exandable_text_widget.dart';
import '../../widgets/small_text.dart';
import '../Cart/cart_page.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background image
          Positioned(
            left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularFoodImgSize,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                        image:  AssetImage(
                            "assets/images/image5.jpg"
                        )
                    )
                ),
              )),
          //icon widgets
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //For another page
                  GestureDetector(
                    onTap:(){
                       Get.to(()=>Mainfoodpage());
                    },
                      child:
                  AppIcon(icon: Icons.arrow_back_ios, iconsize: 5,)),
                  GestureDetector(
                    onTap: (){
                      Get.to(()=>CartPage());
                    },
                      child: AppIcon(icon: Icons.shopping_cart_rounded, iconsize: 5,))
                ],

          )),
          //introduction of food
          Positioned(
            left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.popularFoodImgSize-20,
              child: Container(
                padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20,top: Dimensions.height20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius20),
                    topLeft: Radius.circular(Dimensions.radius20),

                  ),
                  color: Colors.white
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(),
                    SizedBox(height: Dimensions.height20,),
                    Bigtext(text: "Introduce"),
                    SizedBox(height: Dimensions.height20,),
                    
                    Expanded(child: SingleChildScrollView(child: ExpandableTextWidget(text: "Biryani is prepared from basmati rice mixed with several spices and cooked in a special way. Chicken Biryani, Mutton Biryani and Veg Biryani are some of the variants of this delicious dish. This dish is my favourite because it has a lip-smacking flavour, and I love to eat it at least once a week Biryani is prepared from basmati rice mixed with several spices and cooked in a special way.")))
                  ],
                ),
              ))
        ],
      ),
      bottomNavigationBar: Container(
        height: 120,
        padding: EdgeInsets.only(top: Dimensions.height30, bottom: Dimensions.height30, left: Dimensions.width20, right: Dimensions.width20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20*2),
            topRight: Radius.circular(Dimensions.radius20*2)
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white
              ),
              child: Row(
                children: [
                  Icon(Icons.remove, color: Colors.deepOrange,),
                  SizedBox(width: Dimensions.width10/2,),
                  Bigtext(text: "0"),
                  SizedBox(width: Dimensions.width10/2,),
                  Icon(Icons.add, color: Colors.deepOrange,)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20),
              child: Bigtext(text: " \$10 | Add to cart ", color: Colors.deepOrange),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.black
              ),
            )
          ],
        ),
      ),
    );
  }
}
