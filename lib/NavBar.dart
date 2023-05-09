import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:homie_cuisine/pages/account/account_page.dart';
import 'package:homie_cuisine/pages/auth/sign_in_page.dart';
import 'package:homie_cuisine/pages/home/main_foodpage.dart';
import 'package:homie_cuisine/widgets/big_text.dart';
class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.deepOrange,
      child: ListView(
        
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.deepOrange,
            ),
            accountName: Bigtext(text: 'MENU', size: 40), accountEmail: null,),
          ListTile(
            leading: Icon(Icons.favorite , color: Colors.white,),
            title: Bigtext(text: 'My favorites', color: Colors.white,) ,
            onTap: () {
              Get.to(()=>null);
            },
          ),
          ListTile(
            leading: Icon(Icons.sticky_note_2_sharp, color: Colors.white,),
            title: Bigtext(text: 'My Orders', color: Colors.white,),
            onTap: () {
              Get.to(()=>null);
            },
          ),
          ListTile(
            leading: Icon(Icons.person, color: Colors.white,),
            title: Bigtext(text: 'My Profile', color: Colors.white,),
            onTap: () {
              Get.to(()=>AccountPage());
            },
          ),
          ListTile(
            leading: Icon(Icons.wallet, color: Colors.white,),
            title: Bigtext(text: 'My Wallet', color: Colors.white,),
            onTap: () {
              Get.to(()=>null);
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart_outlined, color: Colors.white,),
            title: Bigtext(text: 'Shopping Cart', color: Colors.white,),
            textColor: Colors.black,
            onTap: () {
              Get.to(()=> null );
            },
          ),
          ListTile(
            leading: Icon(Icons.share, color: Colors.white,),
            title: Bigtext(text: 'Share App', color: Colors.white,),
            onTap: () {
              Get.to(()=>null);
            },
          ),
          ListTile(
            leading: Icon(Icons.info_outline, color: Colors.white,),
            title: Bigtext(text: 'About', color: Colors.white,),
            onTap: () {
              Get.to(()=>null);
            },
          ),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.white,),
            title: Bigtext(text: 'Log Out', color: Colors.white,),
            onTap: () {
              Get.to(()=>SignInPage());
            },
          )
        ],
      ),

    );
  }
}
