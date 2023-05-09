import 'package:get/get.dart';
import 'package:homie_cuisine/pages/auth/sign_in_page.dart';
import 'package:homie_cuisine/pages/food/popular_food_detail.dart';
import 'package:homie_cuisine/pages/home/home_page.dart';
import 'package:homie_cuisine/pages/home/main_foodpage.dart';

import '../pages/Splash/splash_page.dart';
class RouteHelper{
 // static const String homepage="/home-page";
  static const String splashPage="/splash-page";
  static const String initial="/";
  static const String popularFood="/popular-food";
 // static const String recommendedFood="/recommended-food";

 // static String gethomepage()=>'$homepage';
  static String getSplashPage()=>'$splashPage';
  static String getInitial()=>'$initial';
  static String getPopularFood()=>'$popularFood';
 // static String getRecommendedFood()=>'$recommendedFood';



  static List<GetPage> routes=[
   // GetPage(name: homepage, page: ()=>HomePage()),
    GetPage(name: splashPage, page: ()=>SplashScreen()),
    GetPage(name: initial, page: ()=>SignInPage()),//Start mein SignInPage show ho uska lya HomePage()
    GetPage(name:popularFood, page: (){

      return PopularFoodDetail();
    },
         transition: Transition.circularReveal
   ),
   // GetPage(name:recommendedFood, page: (){

    //  return recommendedFoodDetail();
   // },
   //     transition: Transition.circularReveal
   // ),

  ];
}