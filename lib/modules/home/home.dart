

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';
import 'package:walki/layout/cubit/cubit.dart';
import 'package:walki/layout/cubit/states.dart';
import 'package:walki/models/get_all_bussenes.dart';
import 'package:walki/modules/addstory.dart';
import 'package:walki/modules/allevents.dart';
import 'package:walki/modules/checkinterrests.dart';
import 'package:walki/modules/location.dart';
import 'package:walki/modules/notification.dart';
import 'package:walki/modules/osama.dart';
import 'package:walki/modules/profile.dart';
import 'package:walki/modules/search/homesearch.dart';

import '../../shared/colors/colors.dart';
import '../../shared/components/components.dart';
import '../../shared/components/myapp.dart';

class homeScreen extends StatefulWidget {
  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
 // const homeScreen({Key? key}) : super(key: key);
 //  var searchController = TextEditingController();
 //
 //  var commentController = TextEditingController();
 //
 //  final formKey = GlobalKey<FormState>();

  Color start = HexColor("#F4511E");
//.withAlpha(250);//.withOpacity(0.9);
  Color end = HexColor("#000000");

  @override
  Widget build(BuildContext context) {

    //var cubit = walkieCubit.get(context);

    return BlocConsumer<walkieCubit,WalkieStates>(
      listener: (context,state){
        if(state is walkiegetBusinessesByIdSuccesState){
          print(state.getBussenesById.business![0].name);
          print(state.getBussenesById.business![0].id);
        }
      },
      builder: (context,state){

      //  walkieCubit.get(context).getPostsData();

      return    SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(width: double.infinity,height: 320,),
                Stack(
                  children: [
                    Container(
                      width: double.infinity,height: 300,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("assets/images/ismailia.png",),fit: BoxFit.fill),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 300.0,
                      decoration: BoxDecoration(
                        // image: DecorationImage(image: AssetImage("assets/images/ismailia.png",),fit: BoxFit.fill),
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            //  // tileMode: TileMode.mirror,
                            //  // transform: Matrix4.translationValues(x, y, z),
                            stops: [

                              0.1,1.0,

                            ],
                            colors: [

                              isstart,isend,


                            ]
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: (){
                               navigateTo(context, CheckInterrests());
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 10,right: 16.0),
                                  width: 30,
                                  height: 15,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(image: AssetImage("assets/images/Vector.png",),fit: BoxFit.fill)
                                  ),
                                ),
                              ),
                              IconButton(
                                  onPressed: (){
                                    navigateTo(context, NotificationScreen());
                                    // walkieCubit.get(context).getProfileData();
                                    // print("USER ID ID ID :::::::::::::::${walkieCubit.get(context).myId}");

                                  },
                                  icon: Icon(Icons.notifications_none_sharp,size: 28,color: Colors.white)),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: InkWell(
                                  onTap: (){
                                    navigateTo(context,ProfileScreen());
                                  },
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: 19,
                                        backgroundColor: HexColor("#AFBACA"),
                                      ),
                                      ConditionalBuilder(
                                        condition: walkieCubit.get(context).getProfileModel != null,
                                        builder: (context)=>CircleAvatar(
                                          radius: 18,
                                          backgroundImage: NetworkImage("${walkieCubit.get(context).getProfileModel!.data![0].avatar ??"https://cdn.pixabay.com/user/2023/02/26/11-15-00-151_250x250.png"}"),
                                        ),
                                        fallback: (context)=>CircleAvatar(
                                          radius: 18,
                                          backgroundColor: Colors.grey,
                                          //backgroundImage: AssetImage("assets/images/im1.jpeg"),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16,),
                            // width: 260,
                            // height: 140,
                            child: Column(
                              crossAxisAlignment:CrossAxisAlignment.start ,
                              //mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("Hi ",
                                      style: TextStyle(
                                          fontFamily:"Poppins",
                                          fontSize: 32,
                                          fontWeight: FontWeight.w400,
                                          color: HexColor("#F3B13E")),),

                                    ConditionalBuilder(
                                       condition: walkieCubit.get(context).getProfileModel != null,
                                        builder: (context)=>
                                       Text(

                                        "${walkieCubit.get(context).getProfileModel!.data![0].firstName}",
                                        style: TextStyle(
                                            fontFamily:"Poppins",
                                            fontSize: 24,
                                            fontWeight: FontWeight.w400,
                                            color: HexColor("#FFFFFF")),
                                        overflow: TextOverflow.ellipsis,),
                                      fallback: (context)=> CircularProgressIndicator(),
                                    ),
                                    SizedBox(width: 10,),
                                    Expanded(

                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Icon(Icons.waving_hand_rounded,size: 24,color: Colors.orangeAccent,),
                                          ],
                                        )),


                                  ],
                                ),
                                Container(
                                  width: 200,
                                  child:  Text("Let's find some places near from you ",
                                    style: TextStyle(
                                        fontFamily:"Poppins",
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: HexColor("#FFFFFF")),),
                                ),


                                Padding(
                                  padding: const EdgeInsets.only(top: 30.0,left: 30.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(

                                        "Welcome to",
                                        style: TextStyle(
                                            fontFamily:"Poppins",
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: HexColor("#FFFFFF")),
                                        overflow: TextOverflow.ellipsis,),
                                      // Row(
                                      //   children: [
                                      //     Text(
                                      //
                                      //       "Ismalia",
                                      //       style: TextStyle(
                                      //           fontFamily:"Poppins",
                                      //           fontSize: 22,
                                      //           fontWeight: FontWeight.w400,
                                      //           color: HexColor("#FFFFFF")),
                                      //       overflow: TextOverflow.ellipsis,),
                                      //     IconButton(
                                      //         onPressed: (){},
                                      //         icon: Icon(Icons.keyboard_arrow_down_outlined,color: Colors.white,size: 30.0,))
                                      //   ],
                                      // ),
                                      DropdownButton(
                                        underline: Container(height: 0.1,),
                                        dropdownColor: Colors.grey.withOpacity(0.8),
                                        isExpanded:false,
                                        hint: Text("${walkieCubit.get(context).selectedplaceItem ?? "Ismailia"}",
                                          style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.w500,fontFamily:"Poppins",),),
                                        value: walkieCubit.get(context).selectedplaceItem,
                                        icon: const Icon(Icons.keyboard_arrow_down,color: Colors.white,size: 30.0,),
                                        style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.w500,fontFamily:"Poppins",),
                                        items: walkieCubit.get(context).placeItem.map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: Text(items),
                                          );
                                        }).toList(),
                                        onChanged: (String? item){
                                          walkieCubit.get(context).changeselectedplaceItem(item);
                                          print(walkieCubit.get(context).selectedplaceItem );
                                        },),

                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),



                        ],
                      ),
                    ),
                  ],
                ),

                //HomeSearch
                Positioned(
                    bottom: 0.0,
                    left: 32.0,
                    right: 32.0,
                    child: InkWell(
                      onTap:() {
                        navigateTo(context, HomeSearch());

                      },
                      child: Container(
                        height: 48,

                        decoration: BoxDecoration(
                            color: HexColor("#FFFFFF"),
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child: //Icons.search
                           Row(
                             children: [
                               Expanded(
                                   flex:1,
                                   child: Icon(Icons.search,size: 24,color: Colors.grey,)),
                               Expanded(
                                   flex: 3,
                                   child: Text("Search",
                                     style: TextStyle(
                                       fontFamily:"Poppins",
                                       fontSize: 14,
                                       fontWeight: FontWeight.w400,
                                       color: Colors.grey),))

                             ],
                           )
                      ),
                    )
                )
              ],
            ),
            SizedBox(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.only(left: 14.0,top: 10.0,bottom: 10.0),
                child: Text("Stories ",
                  style: TextStyle(
                      fontFamily:"Poppins",
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: HexColor("#214E8A")),),
              ),
            ),
            ConditionalBuilder(
              condition: walkieCubit.get(context).getPostModel != null && walkieCubit.get(context).getProfileModel != null && walkieCubit.get(context).getAllBussenesModel !=null,
              builder: (context)=>showStoriesAndPosts(
                  context,
                  walkieCubit.get(context),

                  walkieCubit.get(context).getPostModel!,

                  walkieCubit.get(context).getProfileModel!,state,true),

              fallback: (context)=>Center(child: CircularProgressIndicator(),),

            ),
            // Card(
            //  margin: EdgeInsets.symmetric(horizontal: 0.0,vertical: 10),
            //   elevation: 4,
            //   child: Column(
            //     children: [
            //       Padding(
            //         padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 14.0),
            //         child: Row(
            //           children: [
            //             Text("Recommended ",
            //               style: TextStyle(
            //                 fontFamily:"Poppins",
            //                 fontSize: 14,
            //                 fontWeight: FontWeight.w600,
            //               ),),
            //             Spacer(),
            //             Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Text("View all ",
            //                   style: TextStyle(
            //                       fontFamily:"Poppins",
            //                       fontSize: 12,
            //                       fontWeight: FontWeight.w400,
            //                       color: HexColor("#214E8A")),),
            //                 Container(
            //                   width: 50,
            //                   height: 1.2,
            //                   color: HexColor("#FF5213"),
            //
            //                 )
            //
            //               ],
            //             ),
            //           ],
            //         ),
            //       ),
            //       Container(
            //         padding: EdgeInsets.only(bottom: 16.0),
            //         height: 217,
            //         child: ListView.separated(
            //           padding: EdgeInsets.only(left: 14,right: 4),
            //             shrinkWrap: true,
            //             physics: NeverScrollableScrollPhysics(),
            //             scrollDirection: Axis.horizontal,
            //             itemBuilder: (context,index)=>RecommendedCafeItem(walkieCubit.get(context).getAllBussenesModel,index),
            //             separatorBuilder: (context,index)=>SizedBox(width: 26,),
            //             itemCount: walkieCubit.get(context).getAllBussenesModel!.data!.length),
            //       )
            //
            //     ],
            //
            //   ),
            //
            //
            // ),
            // // ListView.separated(
            // //     padding: EdgeInsets.all(0.0),
            // //     physics: NeverScrollableScrollPhysics(),
            // //     shrinkWrap: true,
            // //     itemBuilder: (context,index)=>restaurantItem(walkieCubit.get(context), commentController),
            // //     separatorBuilder: (context,index)=> SizedBox(height: 20,),
            // //     itemCount: 2),
            // Card(
            //
            //   margin: EdgeInsets.symmetric(horizontal: 0.0,vertical: 10.0),
            //   elevation: 3,
            //   child: Column(
            //     children: [
            //       Padding(
            //         padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 14.0),
            //         child: Row(
            //           children: [
            //             Text("Top Restaurants ",
            //               style: TextStyle(
            //                 fontFamily:"Poppins",
            //                 fontSize: 14,
            //                 fontWeight: FontWeight.w600,
            //               ),),
            //             Spacer(),
            //             Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Text("View all ",
            //                   style: TextStyle(
            //                       fontFamily:"Poppins",
            //                       fontSize: 12,
            //                       fontWeight: FontWeight.w400,
            //                       color: HexColor("#214E8A")),),
            //                 Container(
            //                   width: 50,
            //                   height: 1.2,
            //                   color: HexColor("#FF5213"),
            //
            //                 )
            //
            //               ],
            //             ),
            //           ],
            //         ),
            //       ),
            //       Container(
            //         margin: EdgeInsets.only(bottom: 14),
            //         height: 217,
            //         child: ListView.separated(
            //           padding: EdgeInsets.only(left: 14.0,right: 4.0),
            //             shrinkWrap: true,
            //             physics: NeverScrollableScrollPhysics(),
            //             scrollDirection: Axis.horizontal,
            //             itemBuilder: (context,index)=>TopRestaurantItem(),
            //             separatorBuilder: (context,index)=>SizedBox(width: 26,),
            //             itemCount: 10),
            //       )
            //
            //
            //     ],
            //
            //   ),
            //
            //
            // ),
            Card(

              margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 0.0,bottom: 35),
              elevation: 1,
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
                            GestureDetector(
                              onTap: (){
                                navigateTo(context, AllEvents());
                              },
                              child: Text("View all ",
                                style: TextStyle(
                                    fontFamily:"Poppins",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: HexColor("#214E8A")),),
                            ),
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

          ],
        ),);}
      );


  }

}

// Widget TopRestaurantItem(){
//   return Stack(
//     alignment: Alignment.center,
//     children: [
//       Container(
//         width: 157,
//         height: 237,
//         decoration: BoxDecoration(
//           color: HexColor("#214E8A"),
//           borderRadius: BorderRadius.circular(20),
//         ),
//       ),
//       Container(
//         width: 157,
//         height: 237,
//         child: Card(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20),),
//           margin: EdgeInsets.all(1),
//
//           child: Column(
//             children: [
//               Container(
//                 width: 155,
//                 height: 110,
//                 decoration: BoxDecoration(
//                   // color: HexColor("#214E8A"),
//                     borderRadius: BorderRadius.circular(20),
//                     image: DecorationImage(image: AssetImage("assets/images/ismailia.png"),fit: BoxFit.fill)
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(4.0),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: Text("Frio Cafee",
//                         style: TextStyle(
//                             fontFamily:"Poppins",
//                             fontSize: 16,
//                             fontWeight: FontWeight.w400,
//                             color: orangetextColor
//                         ),
//                         maxLines: 1,overflow: TextOverflow.ellipsis,),
//                     ),
//                     InkWell(
//                         onTap: (){},
//                         child: Icon(Icons.favorite_border,color: orangetextColor,))
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 4.0),
//                   child: Text(
//                     "bnvbnvbntrdcfefsdddhhhhjhjhhhhhhhhhhhetgsdfscsxxd",
//                     style: TextStyle(color: bluecolor),
//                     overflow: TextOverflow.ellipsis,maxLines: 2,),
//                 ),
//               ),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.only(bottom: 8.0,left: 4,right: 4),
//                   child: Row(
//                     children: [
//                       Icon(Icons.star,size: 14,color: orangetextColor,),
//                       Icon(Icons.star,size: 14,color: orangetextColor,),
//                       Icon(Icons.star,size: 14,color: orangetextColor,),
//                       Icon(Icons.star,size: 14,color: orangetextColor,),
//                       Icon(Icons.star,size: 14,),
//
//                       Text(
//                         " 4.5 ",
//                         style: TextStyle(color: bluecolor),),
//                       Expanded(
//                         child: InkWell(
//                           onTap: (){},
//                           child: Container(
//                             height: 24,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(20),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.grey,
//                                   //  spreadRadius: 5,
//                                   // blurRadius: 7,
//                                   offset: Offset(0, 0.5), // changes position of shadow
//                                 ),
//                               ],
//
//
//                             ),
//                             child: Center(
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text(
//                                     "Details",
//                                     style: TextStyle(color: orangetextColor,fontSize: 7),
//                                   ),
//                                   Icon(Icons.arrow_forward,color: orangetextColor,size: 14,)
//                                 ],
//                               ),
//                             ),
//
//                           ),
//                         ),
//                       )
//
//
//                     ],
//                   ),
//                 ),
//               )
//
//               // SizedBox(height: 100,)
//
//
//
//
//             ],
//           ),
//         ),
//       )
//     ],
//   );
// }






