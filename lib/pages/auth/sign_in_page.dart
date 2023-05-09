import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:homie_cuisine/pages/auth/sign_up_page.dart';
import 'package:homie_cuisine/pages/home/main_foodpage.dart';
import 'package:homie_cuisine/utils/dimensions.dart';
import 'package:homie_cuisine/widgets/big_text.dart';

import '../../Chef pages/Dashboard/Sign_in.dart';
import '../../Methods/Methods.dart';
import '../../widgets/app_text_field.dart';
import '../home/home_page.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    bool isLoading = false;
    
    
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: isLoading
          ? Center(
        child: Container(
          height: Dimensions.screenHeight / 20,
          width: Dimensions.screenWidth / 20,
          child: CircularProgressIndicator(),
        ),
      )
          : SingleChildScrollView(
            child: Column(
        children: [
            SizedBox(height: Dimensions.screenHeight*0.05,),
            //app logo
            Container(
              height: Dimensions.screenHeight*0.25,
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 80,
                  backgroundImage: AssetImage(
                      "assets/images/Splash.png"
                  ),
                ),
              ),
            ),
            //welcome
            Container(
              margin: EdgeInsets.only(left: Dimensions.width20),
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                      "Sign in",
                    style: TextStyle(
                      fontSize: Dimensions.font20*3+Dimensions.font20/2,
                      fontWeight: FontWeight.bold
                    ),
                  ),
              Text(
                "Sign into your account",
                style: TextStyle(
                    fontSize: Dimensions.font20,
                  color: Colors.grey[500],
                ),
              )
                ],
              ),
            ),
            SizedBox(height: Dimensions.height20,),
            //your email
            AppTextField(textController: emailController,
                icon: Icons.email,
                hintText: "Email"),
            SizedBox(height: Dimensions.height20,),
            //your password
            AppTextField(textController: passwordController,
                icon: Icons.password_sharp,
                hintText: "Password"),
            SizedBox(height: Dimensions.height20,),
            //tag line
            //signup options
            RichText(
                text: TextSpan(
                    text: "Sign in as a",
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: Dimensions.font20
                    ),
                    children: [
                      TextSpan(
                          recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>Signin(), transition: Transition.fade),
                          text: " Chef",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: Dimensions.font20
                          ))

                    ]
                )
            ),
            SizedBox(height: Dimensions.screenHeight*0.03,),
            //Sign in
            Container(
              width: Dimensions.screenWidth / 2,
              height: Dimensions.screenHeight / 13,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: Colors.deepOrange),
              child: GestureDetector(
                onTap: () {
                  if (
                  emailController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty) {
                    setState(() {
                      isLoading = true;
                    });
                    login(emailController.text, passwordController.text)
                        .then((user) {
                      if(user != null){
                        print("Login Successfully");
                        setState(() {
                          isLoading = false;
                        });
                        Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
                      }else{
                        print("Login Failed");
                      }
                    });
                  } else {
                    print("Please fill form corectly");
                  }
                //  NavigationBars();
                },
                child: Container(
                  width: Dimensions.screenWidth / 2,
                  height: Dimensions.screenHeight / 13,
                  decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(Dimensions.radius30),
                      color: Colors.deepOrange),
                  child: Center(
                    child: Bigtext(
                      text: "Log in",
                      size: Dimensions.font20 + Dimensions.font20 / 2,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: Dimensions.screenHeight*0.03,),
            //signup options
            RichText(
                text: TextSpan(
                    text: "Don't have an account?",
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: Dimensions.font20
                    ),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>SignUpPage(), transition: Transition.fade),
                    text: " Create",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: Dimensions.font20
                    ))

                  ]
                )
            ),


        ],
      ),
          ),
    );
  }

  void setState(Null Function() param0) {}
}
