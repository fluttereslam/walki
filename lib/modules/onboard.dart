import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:walki/modules/splash.dart';
import 'package:walki/shared/components/components.dart';

import '../shared/colors/colors.dart';
import 'login/login.dart';

class OnBoard extends StatelessWidget {
  //const HiSir({Key? key}) : super(key: key);
  Color start = HexColor("#214E8A").withOpacity(0.9);//.withAlpha(250);//.withOpacity(0.9);
  Color startg = HexColor("#C8C8C8").withOpacity(0.99);//.withAlpha(250);//.withOpacity(0.9);
  Color end = HexColor("#FD5B1F").withOpacity(0.75);
  Color endg = HexColor("#000000").withOpacity(0.95);
  @override
  Widget build(BuildContext context) {
   // var center = MediaQuery.of(context).size.width
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
            image: DecorationImage(image: AssetImage("assets/images/women.png",),fit: BoxFit.fill)
        ),
        child: SingleChildScrollView(
          child: Column(
           // mainAxisSize:MainAxisSize.max ,
            mainAxisAlignment: MainAxisAlignment.end,
                children: [

              SizedBox(height: 353,),
                  Container(
                    padding: const EdgeInsets.only(left: 16.0,bottom: 40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          //mainAxisAlignment:MainAxisAlignment.center,
                          children: [
                            Text("Wa",style: TextStyle(fontFamily:"Poppins",fontSize: 40,fontWeight: FontWeight.w400,color: HexColor("#FFFFFF")),),
                            Text("l",style: TextStyle(fontFamily:"Poppins",fontSize: 40,fontWeight: FontWeight.w400,color: HexColor("#FD5B1F")),),
                            Text("k",style: TextStyle(fontFamily:"Poppins",fontSize: 40,fontWeight: FontWeight.w400,color: HexColor("#FFFFFF")),),
                            Text("i",style: TextStyle(fontFamily:"Poppins",fontSize: 40,fontWeight: FontWeight.w400,color: HexColor("#FD5B1F")),),
                            Text("e",style: TextStyle(fontFamily:"Poppins",fontSize: 40,fontWeight: FontWeight.w400,color: HexColor("#FFFFFF")),),

                          ],),
                        Container(
                          width: 220,
                          height: 58,
                          child: Text("With Walkie Then You Will Find New Places And You Will Can Go To It",
                            style: TextStyle(
                              fontSize: 10,color: whitetextColor,
                              fontWeight: FontWeight.w400,
                              overflow: TextOverflow.ellipsis,
                              fontFamily:"Poppins",
                            ),
                            maxLines: 3,),
                        ),
                        SizedBox(height: 30.0),
                        Container(
                          width: 58,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                radius: 5.0,
                                backgroundColor: HexColor("#FD5B1F"),
                              ),
                              CircleAvatar(
                                radius: 5.0,
                                backgroundColor: HexColor("#FD5B1F"),
                              ),
                              Container(
                                width: 24,
                                height: 8,
                                decoration: BoxDecoration(
                                    color: HexColor("#FD5B1F"),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(50),
                                      topLeft: Radius.circular(50),
                                      bottomRight: Radius.circular(50),
                                      bottomLeft: Radius.circular(50),

                                    )
                                ),
                              )

                            ],),
                        ),

                      ],
                    ),
                  ),

                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        width: 300,
                        height: 120,
                        child: ClipPath(
                          clipper: CustomClipPath3(),
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    //  // tileMode: TileMode.mirror,
                                    //  // transform: Matrix4.translationValues(x, y, z),
                                    stops: [

                                      0.0,1.0,

                                    ],
                                    colors: [
                                      //Colors.blue,

                                      //Colors.orange,
                                      startg,endg,


                                    ]
                                )

                            ),
                            child: Padding(
                              padding:  EdgeInsets.only(top: 30,right: 36),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.keyboard_arrow_up,color: Colors.white,),
                                  TextButton(
                                    onPressed: (){
                                      navigateTo(context,Log_in());
                                    },
                                    child: Text(
                                      "Skip",
                                      style:
                                      TextStyle(
                                          fontFamily:"Poppins",
                                          fontSize: 12,fontWeight: FontWeight.w400,
                                          color: HexColor("#FFFFFF")),),
                                  ),
                                ],
                              ),
                            ),
                          ),),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,

                        children: [

                          Expanded(
                            child: ClipPath(
                              clipper: CustomClipPath(),
                              child: Container(
                                height: 150,
                                width: 300,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        //  // tileMode: TileMode.mirror,
                                        //  // transform: Matrix4.translationValues(x, y, z),
                                        stops: [

                                          0.2,1.0,

                                        ],
                                        colors: [
                                          //Colors.blue,

                                          //Colors.orange,
                                          start,end,


                                        ]
                                    )
                                ),
                                child:Padding(
                                  padding: const EdgeInsets.only(top: 2,left: 0,right: 80),
                                  child: TextButton(
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Previous",
                                      style:
                                      TextStyle(
                                          fontFamily:"Poppins",
                                          fontSize: 10,fontWeight: FontWeight.w400,
                                          color: HexColor("#FFFFFF")),),
                                  ),
                                ),

                              ),
                            ),
                          ),
                          SizedBox(width: 30,),
                          Expanded(
                            child: ClipPath(
                              clipper: CustomClipPath2(),
                              child: Container(
                                height: 150,
                                width: 300,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        //  // tileMode: TileMode.mirror,
                                        //  // transform: Matrix4.translationValues(x, y, z),
                                        stops: [

                                          0.2,1.0,

                                        ],
                                        colors: [
                                          //Colors.blue,

                                          //Colors.orange,
                                          start,end,


                                        ]
                                    )



                                ),
                                child: Padding(
                                  padding:  EdgeInsets.only(top: 2,left: 80),
                                  child: TextButton(
                                    onPressed: (){
                                      navigateAndFinish(context,Log_in());
                                    },
                                    child: Text(
                                      "Next",
                                      style:
                                      TextStyle(
                                          fontFamily:"Poppins",
                                          fontSize: 12,fontWeight: FontWeight.w400,
                                          color: HexColor("#FFFFFF")),),
                                  ),
                                ),
                              ),
                            ),
                          ),

                        ],),
                    ],),








                ],
              ),
        ),


      ),
    );
  }
}
