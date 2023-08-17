

import 'package:card_swiper/card_swiper.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:walki/layout/cubit/cubit.dart';
import 'package:walki/layout/cubit/states.dart';
import 'package:walki/models/allreelsmodel.dart';
import 'package:walki/modules/comment/commentsscreen.dart';
import 'package:walki/modules/reals/vidio.dart';
import 'package:walki/shared/colors/colors.dart';
import 'package:walki/shared/components/components.dart';
import '../lovesscreen.dart';

class RealPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<walkieCubit,WalkieStates>(
      listener: (context,state){},
      builder: (context,state){
     return   Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(0.0),
            child: AppBar(
              elevation: 0,
            ),
          ),
          body:ConditionalBuilder(
            condition: walkieCubit.get(context).allReelsModel !=null,
            builder: (context)=>Container(
              child:
                  Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          return Stack(
                            children: [
                              VideoApp(
                                src:walkieCubit.get(context).allReelsModel!.reels![index].reelUrl,
                              ),
                              reelOptions(walkieCubit.get(context),walkieCubit.get(context).allReelsModel,index,context),
                            ],
                          );
                        },
                        itemCount: walkieCubit.get(context).allReelsModel!.reels!.length,
                        scrollDirection: Axis.vertical,
                      ),

            ),
            fallback: (context)=>Center(child: CircularProgressIndicator(),),
          ),
          // bottomNavigationBar: BottomNavigationBar,

        );
      },

    );
  }
}



Widget reelOptions(cubit,AllReelsModel? model,index,context){
  return Container(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: (){},
                child: Text("Nearby",
                    style:TextStyle(
                        fontFamily:"Poppins",
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white
                    ))),
            TextButton(
                onPressed: (){},
                child: Text("Following",
                    style:TextStyle(
                        fontFamily:"Poppins",
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white
                    ))),
            TextButton(
                onPressed: (){},
                child: Text("For You",
                    style:TextStyle(
                        fontFamily:"Poppins",
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white
                    ))),
            IconButton(onPressed: (){}, icon: Icon(Icons.search,size: 24,color: Colors.white,))
          ],
        ),
        Expanded(child: Container()),
        Container(
          margin: EdgeInsets.only(bottom: 72.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,

                children: [

                  SizedBox(height: 50),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage("${model!.reels![index].user!.avatar ?? "https://cdn.pixabay.com/user/2023/02/26/11-15-00-151_250x250.png"}"),
                        //child: Icon(Icons.person, size: 18),
                        radius: 16,
                      ),
                      SizedBox(width: 6),
                      Text('${model.reels![index].user!.fullName}',
                        style: TextStyle(
                            fontFamily:"Poppins",
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: whitetextColor),),
                      SizedBox(width: 10),
                      SizedBox(width: 6),
                     if (model.reels![index].user!.id.toString() != cubit.myId.toString()) Stack(
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
                                color: cubit.RFollowings[model.reels![index].user!.id] ? orangetextColor : Colors.grey,
                                borderRadius: BorderRadius.circular(30)
                            ),
                            child: Center(
                              child:
                              GestureDetector(
                                onTap: (){
                                  //print("IDDDDDDDDDD:;;;;;;${cubit.myId}::::::::::::::${model.reels![index].user!.id.toString() != cubit.myId.toString()}");
                                  cubit.changeReelFollowing(model.reels![index].user!.id);


                                },
                                child: Text("${cubit.RFollowings[model.reels![index].user!.id] ? "Following" : "Follow" }",
                                  style:  TextStyle(
                                      fontFamily:"Poppins",
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: cubit.RFollowings[model.reels![index].user!.id]?whitetextColor:HexColor("#214E8A")),),
                              ),
                            ),

                          ),



                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: 6),
                  // Text('Flutter is beautiful and fast 💙❤💛 ..'),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      Container(
                        margin: EdgeInsets.only(left: 24.0),
                        width:244,
                        child:
                        Text("${model.reels![index].reelTitle}",
                          style: TextStyle(
                              fontFamily:"Poppins",
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: whitetextColor),
                          overflow: TextOverflow.ellipsis,maxLines: 4,),
                      ),


                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                              onTap: (){
                                // cubit.incresepostlines();
                              },
                              child: Icon(Icons.keyboard_arrow_up,size: 28,color: Colors.orangeAccent,)),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.only(left: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.music_note,
                          size: 15,
                          color: Colors.white,
                        ),
                        Text('Original Audio - some music track--',
                          style: TextStyle(
                              fontFamily:"Poppins",
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: whitetextColor),),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap:(){
                      cubit.changeReelFavorites(model.reels![index].id);
                      },
                      onDoubleTap: (){
                       navigateTo(context, FavoriteScreen(model.reels![index].likes));
                      },
                      child: Icon(
                        (cubit.RFavorites[model.reels![index].id]) ? Icons.favorite: Icons.favorite_border_outlined,
                        color: (cubit.RFavorites[model.reels![index].id])? orangetextColor:Colors.white,

                      )),
                  Text('${model.reels![index].likesCount}', style: TextStyle(
                      fontFamily:"Poppins",
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: whitetextColor),),
                  SizedBox(height: 10),
                  IconButton(
                      onPressed: (){
                       navigateTo(context, CommentScreen(model.reels![index].comments,model.reels![index].id,false,));
                      }
                      ,icon: Icon(Icons.comment_rounded,color: whitetextColor,)),
                  Text('${model.reels![index].commentsCount}', style: TextStyle(
                      fontFamily:"Poppins",
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: whitetextColor),),
                  SizedBox(height: 10),
                  InkWell(
                      onTap: (){
                        print("helllo comment");
                      },
                      // padding: EdgeInsets.all(0.0),
                      child: Container(
                        // padding: EdgeInsets.only(bottom: 5,top: 4),
                        child: Image.asset("assets/images/share1.png"),
                      )),
                  SizedBox(height: 10),
                  InkWell(
                      onTap: (){
                        print("helllo comment");
                      },
                      // padding: EdgeInsets.all(0.0),
                      child: Container(
                        // padding: EdgeInsets.only(bottom: 5,top: 4),
                        child: Image.asset("assets/images/sharew.png"),
                      )),

                  SizedBox(height: 5),
                  IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.location_on_outlined,color: whitetextColor,)),

                  SizedBox(height: 20),

                ],
              )
            ],
          ),
        ),


      ],
    ),
  );
}