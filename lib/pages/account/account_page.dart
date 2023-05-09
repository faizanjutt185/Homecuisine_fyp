import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homie_cuisine/widgets/app_icon.dart';
import 'package:homie_cuisine/widgets/big_text.dart';

import '../../utils/dimensions.dart';
import '../../widgets/account_widget.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Column(children: [
          Align(
            alignment: Alignment.center,
          ),

          Bigtext(text: 'Profile', color: Colors.black, size: 30,),
        ],
        ),
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: Dimensions.height20),
        child: Column(

          children: [
            //Profile icon
            AppIcon(icon: Icons.person,
                iconsize: Dimensions.height45+Dimensions.height30,
                backgroundColor: Colors.deepOrange,
              iconColor: Colors.black54,
              size: Dimensions.height15*10,),
            SizedBox(height: Dimensions.height30,),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //Name
                    AccountWidget(
                        appIcon: AppIcon(icon: Icons.person,
                          iconsize: Dimensions.height10*5/2,
                          backgroundColor: Colors.deepOrange,
                          iconColor: Colors.black54,
                          size: Dimensions.height10*5,),

                        bigtext: Bigtext(text: "Faizan")
                    ),
                    SizedBox(height: Dimensions.height20,),
                    //Contact
                    AccountWidget(
                        appIcon: AppIcon(icon: Icons.phone,
                          iconsize: Dimensions.height10*5/2,
                          backgroundColor: Colors.deepOrange,
                          iconColor: Colors.black54,
                          size: Dimensions.height10*5,),

                        bigtext: Bigtext(text: "03226677558")
                    ),
                    SizedBox(height: Dimensions.height20,),
                    //Gender
                    AccountWidget(
                        appIcon: AppIcon(icon: Icons.person_search,
                          iconsize: Dimensions.height10*5/2,
                          backgroundColor: Colors.deepOrange,
                          iconColor: Colors.black54,
                          size: Dimensions.height10*5,),

                        bigtext: Bigtext(text: "Male")
                    ),
                    SizedBox(height: Dimensions.height20,),
                    //Address
                    AccountWidget(
                        appIcon: AppIcon(icon: Icons.location_on,
                          iconsize: Dimensions.height10*5/2,
                          backgroundColor: Colors.deepOrange,
                          iconColor: Colors.black54,
                          size: Dimensions.height10*5,),

                        bigtext: Bigtext(text: "Fill in your Address")
                    ),
                    SizedBox(height: Dimensions.height20,),
                    //Email
                    AccountWidget(
                        appIcon: AppIcon(icon: Icons.email,
                          iconsize: Dimensions.height10*5/2,
                          backgroundColor: Colors.deepOrange,
                          iconColor: Colors.black54,
                          size: Dimensions.height10*5,),

                        bigtext: Bigtext(text: "bscs-fa19-004@tuf.edu.pk")
                    ),
                    SizedBox(height: Dimensions.height20,),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
