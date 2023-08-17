import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:walki/layout/cubit/cubit.dart';
import 'package:walki/modules/login/login.dart';
import 'package:walki/modules/updateprofile.dart';
import 'package:walki/shared/colors/colors.dart';
import 'package:walki/shared/components/components.dart';
import 'package:walki/shared/variables.dart';

Color start = HexColor("#214E8A").withOpacity(0.99);//.withAlpha(250);//.withOpacity(0.9);
Color end = HexColor("#FD5B1F").withOpacity(0.66);//.withOpacity(0.7);

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.0),
        child: AppBar(
          elevation: 0,

        ),

      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          //gradient: RadialGradient(colors: colors)
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                //  // tileMode: TileMode.mirror,
                //  // transform: Matrix4.translationValues(x, y, z),
                stops: [

                  0.1,1.0,

                ],
                colors: [
                  //Colors.blue,

                  //Colors.orange,
                  start,end,


                ]
            )
        ),
        child: Column(
          children: [
            SizedBox(height: 40),
            Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                Text("Wa",style: TextStyle(fontFamily:"Poppins",fontSize: 50,fontWeight: FontWeight.w400,color: HexColor("#FFFFFF")),),
                Text("l",style: TextStyle(fontFamily:"Poppins",fontSize: 50,fontWeight: FontWeight.w400,color: HexColor("#FD5B1F")),),
                Text("k",style: TextStyle(fontFamily:"Poppins",fontSize: 50,fontWeight: FontWeight.w400,color: HexColor("#FFFFFF")),),
                Text("i",style: TextStyle(fontFamily:"Poppins",fontSize: 50,fontWeight: FontWeight.w400,color: HexColor("#FD5B1F")),),
                Text("e",style: TextStyle(fontFamily:"Poppins",fontSize: 50,fontWeight: FontWeight.w400,color: HexColor("#FFFFFF")),),

              ],),
            SizedBox(height:  MediaQuery.of(context).size.height*0.2,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: defaultButton(function: (){}, text: "Gifts"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: defaultButton(function: (){}, text: "Accessibility"),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: defaultButton(function: (){
                navigateTo(context, UpdateProfile());
              }, text: "Edit Profile"),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: defaultButton(
                  background: orangetextColor,
                  function: (){
                    logout(context);
              }, text: "LogOut"),
            ),

          ],
        ),
      ),
    );
  }
}
