

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../shared/colors/colors.dart';
import '../shared/components/components.dart';
import 'hi_sir.dart';
import 'onboard.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        GestureDetector(
          onTap: (){
            navigateTo(context, OnBoard());
          },
          child: Container(
            width: double.infinity,
            height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/women.png",),fit: BoxFit.fill)
          ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                            Container(
                              width: 450,
                              height: 380,
                              child: Stack(
                                children: [
                                  Positioned(
                                      left: 0,
                                      right: 0,
                                      top: 100,

                                      child: Image.asset("assets/images/lines.png",fit: BoxFit.cover,)

                                  ),
                                  Positioned(
                                      left: 8,
                                      right: 8,
                                      top: 60,

                                      child: Image.asset("assets/images/photoss.png",fit: BoxFit.cover,)

                                  ),

                                ],),
                            ),
                          Container(

                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Find New Places",
                          style: TextStyle(
                            fontSize: 33,color: whitetextColor,
                            fontWeight: FontWeight.w400,
                            overflow: TextOverflow.ellipsis,
                            fontFamily:"Poppins",
                          ),
                          maxLines: 2,),
                        Row(
                        mainAxisAlignment:MainAxisAlignment.center,
                          children: [
                            Text("With ",style: TextStyle(fontFamily:"Poppins",fontSize: 40,fontWeight: FontWeight.w400,color: HexColor("#FFFFFF")),),

                            Text("Wa",style: TextStyle(fontFamily:"Poppins",fontSize: 50,fontWeight: FontWeight.w400,color: HexColor("#FFFFFF")),),
                            Text("l",style: TextStyle(fontFamily:"Poppins",fontSize: 50,fontWeight: FontWeight.w400,color: HexColor("#FD5B1F")),),
                            Text("k",style: TextStyle(fontFamily:"Poppins",fontSize: 50,fontWeight: FontWeight.w400,color: HexColor("#FFFFFF")),),
                            Text("i",style: TextStyle(fontFamily:"Poppins",fontSize: 50,fontWeight: FontWeight.w400,color: HexColor("#FD5B1F")),),
                            Text("e",style: TextStyle(fontFamily:"Poppins",fontSize: 50,fontWeight: FontWeight.w400,color: HexColor("#FFFFFF")),),

                          ],),
                        Container(
                          width: 280,
                          child: Text("With Walkie Then You Will Find New Places And You Will Can Go To It",
                                  style: TextStyle(
                                    fontSize: 12,color: whitetextColor,
                                    fontWeight: FontWeight.w400,
                                    overflow: TextOverflow.ellipsis,
                                    fontFamily:"Poppins",
                                  ),
                                  maxLines: 3,),
                        ),
                        SizedBox(height: 70.0,),
                       Text("loading...",
                         style: TextStyle(
                          fontSize: 10,color: orangetextColor,
                          fontWeight: FontWeight.w400,
                          overflow: TextOverflow.ellipsis,
                          fontFamily:"Poppins",
                        ),),
                      ],
                    ),
                  )






                ],
              ),
            ),

          ),
        )
        // Stack(
        //         alignment: Alignment.topCenter,
        //        //clipBehavior:Clip.none,
        //
        //         children: [
        //           Container(
        //             width:  MediaQuery.of(context).size.width,
        //           height: MediaQuery.of(context).size.height,
        //             child: Image.asset("assets/images/women.png",fit: BoxFit.cover,),
        //           ),
        //           Container(
        //             width: double.infinity,
        //             height: MediaQuery.of(context).size.height*0.5,
        //             child: Stack(
        //               children: [
        //                 Positioned(
        //                     left: 0,
        //                     right: 0,
        //                     top: 100,
        //
        //                     child: Image.asset("assets/images/lines.png",fit: BoxFit.fitHeight,)
        //
        //                 ),
        //                 Positioned(
        //                     left: 8,
        //                     right: 8,
        //
        //                     top: 50,
        //
        //                     child: Image.asset("assets/images/photos.png",fit: BoxFit.fitHeight,)
        //
        //                 ),
        //               ],),
        //           ),
        //           Positioned(
        //             bottom: 30,
        //             child: Container(
        //               padding: EdgeInsets.all(8),
        //               width:  MediaQuery.of(context).size.width,
        //               height: MediaQuery.of(context).size.height*0.5,
        //               child: Column(
        //                 children: [
        //                   Expanded(child: Text("Find New Places",
        //                     style: TextStyle(
        //                         fontSize: 35,color: whitetextColor,
        //                         fontWeight: FontWeight.w400,
        //                         overflow: TextOverflow.ellipsis,
        //                       fontFamily:"Poppins",
        //                     ),
        //                   maxLines: 2,)),
        //                   Row(
        //                     mainAxisAlignment:MainAxisAlignment.center,
        //                     children: [
        //                       Text("With ",style: TextStyle(fontFamily:"Poppins",fontSize: 40,fontWeight: FontWeight.w400,color: HexColor("#FFFFFF")),),
        //
        //                       Text("Wa",style: TextStyle(fontFamily:"Poppins",fontSize: 50,fontWeight: FontWeight.w400,color: HexColor("#FFFFFF")),),
        //                       Text("l",style: TextStyle(fontFamily:"Poppins",fontSize: 50,fontWeight: FontWeight.w400,color: HexColor("#FD5B1F")),),
        //                       Text("k",style: TextStyle(fontFamily:"Poppins",fontSize: 50,fontWeight: FontWeight.w400,color: HexColor("#FFFFFF")),),
        //                       Text("i",style: TextStyle(fontFamily:"Poppins",fontSize: 50,fontWeight: FontWeight.w400,color: HexColor("#FD5B1F")),),
        //                       Text("e",style: TextStyle(fontFamily:"Poppins",fontSize: 50,fontWeight: FontWeight.w400,color: HexColor("#FFFFFF")),),
        //
        //                     ],),
        //                   Expanded(
        //                     child: Padding(
        //                       padding: const EdgeInsets.symmetric(horizontal: 24.0),
        //                       child: Text("With Walkie Then You Will Find New Places And You Will Can Go To It",
        //                         style: TextStyle(
        //                         fontSize: 16,color: whitetextColor,
        //                         fontWeight: FontWeight.w400,
        //                         overflow: TextOverflow.ellipsis,
        //                         fontFamily:"Poppins",
        //                       ),
        //                       maxLines: 3,),
        //                     ),
        //                   ),
        //                   Text("loading...",style: TextStyle(
        //                     fontSize: 10,color: orangetextColor,
        //                     fontWeight: FontWeight.w400,
        //                     overflow: TextOverflow.ellipsis,
        //                     fontFamily:"Poppins",
        //                   ),),
        //                   // Text("walkie",style: TextStyle(fontSize: 10),),
        //                 ],),
        //             ),
        //           )
        //
        //
        //
        //
        //         ],
        //       ),


        );



  }
}
