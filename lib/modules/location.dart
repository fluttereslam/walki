import 'package:flutter/material.dart';
import 'package:walki/shared/colors/colors.dart';
import 'package:walki/shared/components/components.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double titlepadding = MediaQuery.of(context).size.width*0.16;
    return Scaffold(

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.0),
        child: AppBar(
          elevation: 0,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0,top: 8.0),
                    child: IconButton(
                        onPressed: (){
                          Navigator.pop(context);
                        }, icon: Image.asset("assets/images/Vector.png")),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 4.0,left: titlepadding),
                    child: Text("Location",
                      style:  TextStyle(
                          fontFamily:"Poppins",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: bluecolor),),
                  ),


                ],
              ),
              SizedBox(height: 16.0,),
              Row(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Padding(
                  padding: EdgeInsets.only(left: 24,right: 8),
                    child: CircleAvatar(radius: 3,backgroundColor: orangetextColor,)),
                  Text("Google Map Location", style: TextStyle(
                      fontFamily:"Poppins",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: orangetextColor
                  ),),

                ],
              ),
              InkWell(
                onTap: (){
                  shoeToast(message: "No given Location",
                      state: ToastStates.SUCCESS);
                },
                child: Container(
                  width: double.infinity,
                  height: 170,
                  margin: EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/images/location.png"),fit: BoxFit.fill)
                  )
                ),
              ),
              Row(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 24,right: 8),
                      child: CircleAvatar(radius: 3,backgroundColor: orangetextColor,)),
                  Text("By Bus", style: TextStyle(
                      fontFamily:"Poppins",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: orangetextColor
                  ),),

                ],
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.all(16),
                decoration:BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),

                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Text("You will travel from the Ramses station to the Sidi Gaber station, then take a bus to the Victoria area, then you will head to Al-Eqbal Street, you will find the shop",
                  style:  TextStyle(
                      fontFamily:"Poppins",
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      ),),
              )
            ],

          ),
        ),
      ),



    );
  }

}
