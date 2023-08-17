
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:walki/shared/colors/colors.dart';
import 'package:readmore/readmore.dart';
import '../layout/cubit/cubit.dart';
import '../layout/cubit/states.dart';
import '../shared/components/components.dart';

var commentController = TextEditingController();

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //var cubit =walkieCubit.get(context);

    return BlocConsumer<walkieCubit,WalkieStates>(
      listener: (context,state){},
      builder: (context,state)=>
          Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(0.0),
          child: AppBar(

            elevation: 0,

          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: IconButton(
                          onPressed: (){
                            Navigator.pop(context);
                          }, icon: Image.asset("assets/images/Vector.png")),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CircleAvatar(
                            radius: 18,
                            backgroundColor: HexColor("#5E5E5E"),
                          ),
                          CircleAvatar(
                            radius: 17,
                            backgroundColor: Colors.white,
                            child: Icon(Icons.search,color: bluecolor),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 18.0),
                  width: 250,
                  child:
                  Text("What Are You Tinking About Mahmoud?",
                    style: TextStyle(
                        fontFamily:"Poppins",
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                       ),),
                ),
                Container(
                  height: 40,
                  margin: EdgeInsets.symmetric(horizontal: 40.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color:HexColor("#1A000000"),
                          blurRadius: 0.16,
                          offset: Offset(0.0, 0.4),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(16)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: (){},
                            child: Text("Ask",
                              style: TextStyle(
                                fontFamily:"Poppins",
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: bluecolor
                              ),),

                        ),
                        TextButton(onPressed: (){},
                            child: Text("Event",
                              style: TextStyle(
                                fontFamily:"Poppins",
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                  color: bluecolor
                              ),),

                        ),
                        TextButton(onPressed: (){},
                            child: Text("Trip",
                              style: TextStyle(
                                fontFamily:"Poppins",
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                  color: bluecolor
                              ),),

                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color:HexColor("#1A000000"),
                          blurRadius: 0.16,
                          offset: Offset(0.0, 0.4),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    children: [
                      Row(

                       children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 19,
                                  backgroundColor: HexColor("#AFBACA"),

                                ),
                                CircleAvatar(
                                  radius: 17,
                                  backgroundImage: AssetImage("assets/images/im1.jpeg"),
                                )
                              ],
                            ),
          ),
                          Expanded(
                            child: Container(
                             padding: EdgeInsets.only(right: 8.0,left: 8.0),
                              height: 35,
                              decoration: BoxDecoration(
                                  color: HexColor("#F4F4F4"),
                                  borderRadius: BorderRadius.circular(30)
                              ),
                              child: Center(
                                child: Text("What Are You Thinking About Mahmoud?",
                                  style: TextStyle(
                                    fontFamily:"Poppins",
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,color: HexColor("#5E5E5E")
                                  ),
                                overflow: TextOverflow.ellipsis,),
                              ),
                            ),
                          )



                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 58.0,bottom: 10.0),
                        child: Divider(
                          thickness: 1,
                          color: HexColor("#5E5E5E") ,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: (){
                                Navigator.pop(context);
                              }, icon: Image.asset("assets/images/post.png")),
                          Text("Post",
                            style: TextStyle(
                              color: bluecolor,
                              fontFamily:"Poppins",
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),),
                          SizedBox(width: 50,),
                          IconButton(
                              onPressed: (){
                                Navigator.pop(context);
                              }, icon: Image.asset("assets/images/reel.png")),
                          Text("Reel",
                            style: TextStyle(
                              color: bluecolor,
                              fontFamily:"Poppins",
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),),

                        ],)

                    ],
                  )
                ),
                SizedBox(height: 15,),
                Container(
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color:HexColor("#1A000000"),
                            blurRadius: 0.16,
                            offset: Offset(0.0, 0.4),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("I Can Suggest For You Top",
                          style: TextStyle(
                            fontFamily:"Poppins",
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),),

                         Padding(
                           padding: const EdgeInsets.symmetric(vertical: 16.0),
                           child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Stack(
                                   alignment: Alignment.center,
                                   children: [
                                     Container(
                                         width: 62,
                                         height: 29,
                                         decoration: BoxDecoration(
                                             color: orangetextColor,
                                             borderRadius: BorderRadius.circular(30)
                                         ),


                                         ),
                                    Container(
                                           width: 60,
                                           height: 27,
                                           decoration: BoxDecoration(
                                               color: walkieCubit.get(context).isCafe ? orangetextColor : Colors.white,
                                               borderRadius: BorderRadius.circular(30)
                                           ),
                                           child: Center(
                                             child:
                                             GestureDetector(
                                               onTap: (){
                                                 print("${walkieCubit.get(context).isCafe}");
                                                 walkieCubit.get(context).changeCafeButton();
                                               },
                                               child: Text("Cafe",
                                                 style:  TextStyle(
                                                     fontFamily:"Poppins",
                                                     fontSize: 10,
                                                     fontWeight: FontWeight.w400,
                                                     color: walkieCubit.get(context).isCafe?whitetextColor:HexColor("#214E8A")),),
                                             ),
                                           ),

                                         ),



                                   ],
                                 ),
                                Stack(
                                   alignment: Alignment.center,
                                   children: [
                                     Container(
                                         width: 122,
                                         height: 29,
                                         decoration: BoxDecoration(
                                             color: orangetextColor,
                                             borderRadius: BorderRadius.circular(30)
                                         ),


                                         ),
                                    Container(
                                           width: 120,
                                           height: 27,
                                           decoration: BoxDecoration(
                                               color: walkieCubit.get(context).isRetaurant ? orangetextColor : Colors.white,
                                               borderRadius: BorderRadius.circular(30)
                                           ),
                                           child: Center(
                                             child:
                                             GestureDetector(
                                               onTap: (){
                                                 print("${walkieCubit.get(context).isRetaurant}");
                                                 walkieCubit.get(context).changeRetaurantButton();
                                               },
                                               child: Text("Restaurants",
                                                 style:  TextStyle(
                                                     fontFamily:"Poppins",
                                                     fontSize: 10,
                                                     fontWeight: FontWeight.w400,
                                                     color: walkieCubit.get(context).isRetaurant?whitetextColor:HexColor("#214E8A")),),
                                             ),
                                           ),

                                         ),



                                   ],
                                 ),
                                Stack(
                                   alignment: Alignment.center,
                                   children: [
                                     Container(
                                         width: 122,
                                         height: 29,
                                         decoration: BoxDecoration(
                                             color: orangetextColor,
                                             borderRadius: BorderRadius.circular(30)
                                         ),


                                         ),
                                    Container(
                                           width: 120,
                                           height: 27,
                                           decoration: BoxDecoration(
                                               color: walkieCubit.get(context).isShopping ? orangetextColor : Colors.white,
                                               borderRadius: BorderRadius.circular(30)
                                           ),
                                           child: Center(
                                             child:
                                             GestureDetector(
                                               onTap: (){
                                                 print("${walkieCubit.get(context).isShopping}");
                                                 walkieCubit.get(context).changeShoppingButton();
                                               },
                                               child: Text("ShoppingPlaces",
                                                 style:  TextStyle(
                                                     fontFamily:"Poppins",
                                                     fontSize: 10,
                                                     fontWeight: FontWeight.w400,
                                                     color: walkieCubit.get(context).isShopping?whitetextColor:HexColor("#214E8A")),),
                                             ),
                                           ),

                                         ),



                                   ],
                                 ),


                              ],),
                         ),


                      ],
                    )
                ),
                SizedBox(height: 15,),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),),
                 // margin: EdgeInsets.symmetric(horizontal: 10.0),
                  elevation: 2,
                  child: Column(
                    children: [
                      Row(
                       crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.all(14.0),

                            //padding: EdgeInsets.all(24.0),
                            width: 50.0,
                            child: Stack(
                              alignment: AlignmentDirectional.center,

                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        //  // tileMode: TileMode.mirror,
                                        //  // transform: Matrix4.translationValues(x, y, z),
                                        stops: [
                                          0.1,1.0,
                                        ],
                                        colors: [
                                          startAvatar,
                                          endAvatar,
                                        ]
                                    ),
                                    shape: BoxShape.circle,

                                  ),
                                  child: CircleAvatar(
                                    radius: 31.0,
                                    backgroundColor: Colors.transparent,
                                  ),
                                ),
                                CircleAvatar(
                                  radius: 24.0,
                                  backgroundColor: Colors.white,
                                ),

                                CircleAvatar(
                                  backgroundImage: AssetImage("assets/images/im1.jpeg"),
                                  radius: 22.0,
                                ),





                              ],
                            ),),
                          Padding(
                            padding: const EdgeInsets.only(top: 36.0),
                            child: Text("Mahmoud ",
                              style: TextStyle(
                                  fontFamily:"Poppins",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: bluecolor),),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(top: 36.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Frio Cafe ",
                                  style: TextStyle(
                                      fontFamily:"Poppins",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: HexColor("#214E8A")),),
                                Container(
                                  width: 60,
                                  height: 1.0,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        //  // tileMode: TileMode.mirror,
                                        //  // transform: Matrix4.translationValues(x, y, z),
                                        stops: [
                                          0.1,1.0,
                                        ],
                                        colors: [
                                          endAvatar,
                                          startAvatar,

                                        ]
                                    ),
                                    //shape: BoxShape.circle,

                                  ),

                                )

                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(onPressed: (){},
                                  icon: Icon(Icons.more_vert,size: 35,color: orangetextColor,)),
                            ],
                          )


                        ],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        height: 400,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage("assets/images/ismailia.png",),fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(20)
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                InkWell(
                                    onTap: (){},
                                    //padding: EdgeInsets.all(0.0),
                                    child: Icon(
                                      Icons.favorite_border_outlined,
                                      color: bluecolor,
                                      size: 32,

                                    )),
                                Text("200 ",
                                  style: TextStyle(
                                      fontFamily:"Poppins",
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: bluecolor),),
                              ],
                            ),
                            SizedBox(width: 10,),
                            Column(
                              children: [
                                InkWell(
                                    onTap: (){},
                                    // padding: EdgeInsets.all(0.0),
                                    child: Container(
                                      padding: EdgeInsets.only(bottom: 5,top: 4),
                                      child: Image.asset("assets/images/comment.png"),
                                    )),
                                Text("200",
                                  style: TextStyle(
                                      fontFamily:"Poppins",
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: bluecolor),),
                              ],
                            ),
                            SizedBox(width: 10,),
                            Column(
                              children: [
                                InkWell(
                                    onTap: (){
                                      print("helllo comment");
                                    },
                                    // padding: EdgeInsets.all(0.0),
                                    child: Container(
                                      padding: EdgeInsets.only(bottom: 5,top: 4),
                                      child: Image.asset("assets/images/share.png"),
                                    )),
                                Text("200 ",
                                  style: TextStyle(
                                      fontFamily:"Poppins",
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: bluecolor),),
                              ],
                            ),
                            Spacer(),
                            InkWell(onTap: (){},
                                child: Icon(Icons.location_on_outlined,color: bluecolor,size: 32,))

                          ],),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text("Mohmoud_74 ",
                                  style: TextStyle(
                                    fontFamily:"Poppins",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),),
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
                                          color: walkieCubit.get(context).isFollowing ? orangetextColor : Colors.white,
                                          borderRadius: BorderRadius.circular(30)
                                      ),
                                      child: Center(
                                        child:
                                        GestureDetector(
                                          onTap: (){
                                            print("${walkieCubit.get(context).isFollowing}");
                                            walkieCubit.get(context).changeFollowingButton();
                                          },
                                          child: Text("${walkieCubit.get(context).followText}",
                                            style:  TextStyle(
                                                fontFamily:"Poppins",
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
                                                color: walkieCubit.get(context).isFollowing?whitetextColor:HexColor("#214E8A")),),
                                        ),
                                      ),

                                    ),



                                  ],
                                ),

                              ],
                            ),
                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                 Expanded(
                                   child:
                                   ReadMoreText(
                                     'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                                     trimLines: 3,
                                     colorClickableText: Colors.pink,
                                     trimMode: TrimMode.Line,
                                     trimCollapsedText: 'See more',
                                     trimExpandedText: 'See less',
                                     style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400,fontFamily: 'Poppins'),
                                     moreStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w400,fontFamily: 'Poppins',color: bluecolor),
                                     lessStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w400,fontFamily: 'Poppins',color: bluecolor),
                                   )
                                 ),

                                ],
                              ),),


                          ],
                        ),
                      ),
                      Card(
                        margin: EdgeInsets.symmetric(horizontal: 8.0,vertical: 15.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),

                        ),
                        child:Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2.0 ,horizontal: 8.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 12,
                                backgroundImage: AssetImage("assets/images/im1.jpeg"),
                              ),

                              Container(
                                padding: EdgeInsets.only(left: 8.0),
                                height: 40,
                                width: 250,
                                child: defaultFormfield2(
                                  //assetName: "assets/images/im1.jpeg",
                                    issearch: true,
                                    controller: commentController,
                                    hint: "add comment",
                                    type: TextInputType.text,
                                    validate: (value){}),
                              )

                            ],
                          ),
                        ),



                      ),






                    ],

                  ),
                ),
                SizedBox(height: 15,),
                Container(
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color:HexColor("#1A000000"),
                            blurRadius: 0.90,
                            offset: Offset(0.0, 0.4),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Padding(
                          padding: const EdgeInsets.only(right:50.0),
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                          fontFamily:"Poppins",
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                                color: Colors.black
                      ),
                              children: <TextSpan>[
                                 TextSpan(text: 'you can book a tour to suze canal now with offer '),
                                 TextSpan(text: '10% off', style: TextStyle(
                                     fontFamily:"Poppins",
                                     fontSize: 14,
                                     fontWeight: FontWeight.w600,
                                     color: orangetextColor)),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Spacer(),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 82,
                                  height: 25,
                                  decoration: BoxDecoration(
                                      color: bluecolor,
                                      borderRadius: BorderRadius.circular(30)
                                  ),


                                ),
                                Container(
                                  width: 80,
                                  height: 23,
                                  decoration: BoxDecoration(
                                      color: walkieCubit.get(context).isbooked ?bluecolor : Colors.white,
                                      borderRadius: BorderRadius.circular(30)
                                  ),
                                  child: Center(
                                    child:
                                    GestureDetector(
                                      onTap: (){
                                        print("${walkieCubit.get(context).isbooked}");
                                        walkieCubit.get(context).changeBookingTourButton();
                                      },
                                      child: Text("${walkieCubit.get(context).bookText}",
                                        style:  TextStyle(
                                            fontFamily:"Poppins",
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            color: walkieCubit.get(context).isbooked ? whitetextColor:HexColor("#214E8A")),),
                                    ),
                                  ),

                                ),



                              ],
                            ),
                          ],
                        ),


                      ],
                    )
                ),
                Card(

                  margin: EdgeInsets.symmetric(horizontal: 0.0,vertical: 20),
                  elevation: 5,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 14.0),
                        child: Row(
                          children: [
                            Text("Events will comming soon ",
                              style: TextStyle(
                                fontFamily:"Poppins",
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),),
                            Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("View all ",
                                  style: TextStyle(
                                      fontFamily:"Poppins",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: HexColor("#214E8A")),),
                                Container(
                                  width: 50,
                                  height: 1.2,
                                  color: HexColor("#FF5213"),

                                )

                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 210,
                        margin: EdgeInsets.only(top: 15,bottom: 30.0),
                        child: ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context,index)=>EventItem(),
                            separatorBuilder: (context,index)=>SizedBox(width: 16.0,),
                            itemCount: 5),
                      )


                    ],

                  ),


                ),
                Container(
                  margin: EdgeInsets.only(bottom: 60),
                    padding: EdgeInsets.only(top: 11.0,left:5.0,bottom:11.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color:HexColor("#1A000000"),
                            blurRadius: 0.90,
                            offset: Offset(0.0, 0.4),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Container(
                     // margin: EdgeInsets.only(top: 4.0,left:4.0,bottom:4.0),
                      decoration: BoxDecoration(
                          color: HexColor("#F1F1F1"),
                          borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20))
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 108,
                            height: 99,
                            decoration: BoxDecoration(
                                color: HexColor("#F1F1F1"),
                                borderRadius: BorderRadius.only(bottomRight: Radius.circular(50)),
                              image: DecorationImage(image: AssetImage("assets/images/ismailia.png"))
                            ),
                          ),
                          Expanded(child: Container(
                            height: 99,
                            padding: EdgeInsets.only(left: 10.0,top:10.0,bottom: 4.0),
                            child:Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Save 15% or more",
                                  style: TextStyle(
                                      fontFamily:"Poppins",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      //color: HexColor("#214E8A"
                                      )),
                                Text("Plan Your Dream Trip With a Getaway Deal",
                                  style: TextStyle(
                                      fontFamily:"Poppins",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      //color: HexColor("#214E8A"
                                      )),

                              ],
                            ) ,
                          )),
                           Container(
                             height: 99,
                             padding: EdgeInsets.only(right: 4.0,bottom: 10.0,top: 2.0),
                            //color: Colors.green,
                            child: Column(
                              children: [
                                Container(
                                  width: 54,
                                  height: 45.5,
                                 // margin: EdgeInsets.only(bottom: 10.0),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("assets/images/offer15.png"))
                                  ),
                                ),
                                Spacer(),
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      width: 62,
                                      height: 25,
                                      decoration: BoxDecoration(
                                          color: bluecolor,
                                          borderRadius: BorderRadius.circular(30)
                                      ),


                                    ),
                                    Container(
                                      width: 60,
                                      height: 23,
                                      decoration: BoxDecoration(
                                          color: walkieCubit.get(context).isTripbooked ?bluecolor : Colors.white,
                                          borderRadius: BorderRadius.circular(30)
                                      ),
                                      child: Center(
                                        child:
                                        GestureDetector(
                                          onTap: (){
                                            print("${walkieCubit.get(context).isTripbooked}");
                                            walkieCubit.get(context).changeBookingTripButton();
                                          },
                                          child: Text("${walkieCubit.get(context).bookTripText}",
                                            style:  TextStyle(
                                                fontFamily:"Poppins",
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
                                                color: walkieCubit.get(context).isTripbooked ? whitetextColor:HexColor("#214E8A")),),
                                        ),
                                      ),

                                    ),



                                  ],
                                ),
                              ],
                            ),

                          )
                        ],
                      ),
                    ),
                ),

              ],
            ),
          ),
        )
      ),
    );
  }
}