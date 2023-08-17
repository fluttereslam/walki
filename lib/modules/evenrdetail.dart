

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:readmore/readmore.dart';
import 'package:walki/shared/components/components.dart';

import '../shared/colors/colors.dart';

class EventDetail extends StatelessWidget {
  const EventDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.0),
        child: AppBar(
          elevation: 0,
        ),
      ),
      body: SingleChildScrollView(

        child: Column(

          children: [
            Stack(
             // alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: double.infinity,
                  height: 380,
                ),
                Stack(
                    children: [
                      Container(
                        height: 320,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage("assets/images/image11.png"),fit: BoxFit.fill)
                        ),
                      ),
                      Positioned(
                        top: 16.0,
                        left: 24.0,
                        child: IconButton(
                              onPressed: (){
                                // Navigator.pop(context);
                              }, icon: Image.asset("assets/images/Vector.png")),
                      ),

                    ],
                  ),

                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.infinity,
                        height: 100,
                      padding: EdgeInsets.only(top: 10,left: 18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(49),topRight: Radius.circular(49))
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 27,
                            backgroundImage: AssetImage("assets/images/image11.png"),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 9.0,right: 23.0),
                            child: Text("Mohmoud",
                              style: TextStyle(
                                fontFamily:"Poppins",
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: bluecolor
                              ),),
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 62,
                                height: 25,
                                decoration: BoxDecoration(
                                    color: orangetextColor,
                                    borderRadius: BorderRadius.circular(30)
                                ),


                              ),
                              Container(
                                width: 60,
                                height: 23,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30)
                                ),
                                child: Center(
                                  child:
                                  GestureDetector(
                                    onTap: (){

                                    },
                                    child: Text("follow",
                                      style:  TextStyle(
                                          fontFamily:"Poppins",
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                          color:HexColor("#214E8A")),),
                                  ),
                                ),

                              ),



                            ],
                          ),

                        ],
                      ),
                      ),
                ),



              ],
            ),
           Container(
             padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Cairo Tower",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,fontFamily: 'Poppins'),),
                      Spacer(),
                      InkWell(
                          onTap: (){},
                          child: Icon(Icons.location_on_outlined,size: 27,color: bluecolor,)),
                      Text("elzmalek, cairo",style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600,fontFamily: 'Poppins'),),

                    ],
                  ),
                  Text("Sat jan at 8pm ",
                    style: TextStyle(
                        fontFamily:"Poppins",
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: orangetextColor
                    ),),
                  Padding(
                    padding: const EdgeInsets.only(top: 34.0,bottom: 17.0),
                    child: Text("Trip Details",
                      style: TextStyle(
                          fontFamily:"Poppins",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: bluecolor
                      ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 50.0),
                    child:ReadMoreText(
                      'Flutter is Google’s mobile UI open source Flutter is Google’s mobile UI open source Flutter is Google’s mobile UI open source Flutter is Google’s mobile UI open source Flutter is Google’s mobile UI open source Flutter is Google’s mobile UI open source Flutter is Google’s mobile UI open source Flutter is Google’s mobile UI open source Flutter is Google’s mobile UI open source Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                      trimLines: 9,
                      colorClickableText: Colors.pink,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'See more',
                      trimExpandedText: 'See less',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400,fontFamily: 'Poppins'),
                      moreStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w400,fontFamily: 'Poppins',color: bluecolor),
                      lessStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w400,fontFamily: 'Poppins',color: bluecolor),
                    )
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: defaultButton(
                        function: (){},
                        background: bluecolor,
                        text: "Book Now"),
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
