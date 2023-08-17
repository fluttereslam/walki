

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:walki/layout/cubit/cubit.dart';
import 'package:walki/layout/cubit/states.dart';
import 'package:walki/layout/home_layout.dart';
import 'package:walki/shared/colors/colors.dart';
import 'package:walki/shared/variables.dart';

import '../models/get_profile_model.dart';
import '../shared/components/components.dart';
import 'addpost/addpost.dart';
import 'home/play_post_video.dart';
//var commentController = TextEditingController();

class OtherUserProfileScreen extends StatefulWidget {
  GetProfileModel? model;
  OtherUserProfileScreen(this.model,{Key? key}) : super(key: key);

  @override
  State<OtherUserProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<OtherUserProfileScreen> with TickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {

    TabController  tabController = TabController(vsync:this,length:3);



    return BlocConsumer<walkieCubit,WalkieStates>(
        listener: (context,state){},
        builder: (context,state)
        {
      if(widget.model!=null) {
            List<Widget> tabs = [
              ProfilePostBuilder(widget.model, state, context, true),
              ProfilePhotosBuilder(widget.model),
              ProfileVideosBuilder(widget.model, false),
              // Container(
              //   padding: EdgeInsets.only(bottom: 8),
              //   child: ListView.separated(
              //       shrinkWrap: true,
              //       physics: NeverScrollableScrollPhysics(),
              //       itemBuilder: (context,index)=>ReviewBuilder(),
              //       separatorBuilder: (context,index)=>Divider(thickness: 1,height: 1,color: bluecolor,),
              //       itemCount: 10),
              // ),
            ];

            return Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(0.0),
                child: AppBar(
                  elevation: 0,
                ),
              ),
              body: ConditionalBuilder(
                condition: widget.model != null &&
                    state is WalkieGetOtherUserProfileDataSuccesState,
                builder: (context) => SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  navigateAndFinish(context, HomeLayout());
                                },
                                icon: Image.asset("assets/images/Vector.png")),
                            Spacer(),
                            IconButton(
                                onPressed: () {
                                  // Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.more_vert,
                                  size: 35,
                                  color: orangetextColor,
                                )),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Row(
                          children: [
                            Spacer(),
                            if(widget.model!.data![0].id.toString() == walkieCubit.get(context).myId.toString())Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                    width: 52,
                                    height: 25,
                                    decoration: BoxDecoration(
                                        color: bluecolor,
                                        borderRadius:
                                            BorderRadius.circular(30))),
                                Container(
                                  width: 50,
                                  height: 23,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        navigateAndFinish(context, AddPost());
                                      },
                                      child: Text(
                                        "Post",
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: bluecolor),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      profileData(widget.model),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        margin: EdgeInsets.all(10.0),
                        elevation: 2,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 24,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 6.0),
                              height: 40,
                              child: TabBar(
                                controller: tabController,
                                indicatorColor: orangetextColor,
                                indicatorSize: TabBarIndicatorSize.label,
                                labelColor: orangetextColor,
                                unselectedLabelColor: bluecolor,
                                indicatorWeight: 2.2,
                                onTap: (index) {
                                  print(index);
                                  walkieCubit
                                      .get(context)
                                      .changeTabindex(index);
                                },
                                labelStyle: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                                tabs: [
                                  Tab(
                                    text: "Posts",
                                  ),
                                  Tab(
                                    text: "Photos",
                                  ),
                                  Tab(
                                    text: "Videos",
                                  ),
                                  // Tab(
                                  //   text: "Reviews",
                                  // ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 16.0,
                            ),
                            Container(
                              child: tabs[walkieCubit.get(context).tabindex],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                fallback: (context) => Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }
      else{
        return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(0.0),
              child: AppBar(
                elevation: 0,
              ),
            ),
            body: Center(child: CircularProgressIndicator(),));
      }
        }
    );
  }
}

//
// Widget ReviewBuilder(){
//   return Container(
//     padding: EdgeInsets.all(16.0),
//     child:
//     Column(
//       children: [
//         Row(
//           children: [
//             Stack(
//               alignment: Alignment.center,
//               children: [
//                 CircleAvatar(
//                   radius: 19,
//                   backgroundColor: HexColor("#AFBACA"),
//
//                 ),
//                 CircleAvatar(
//                   radius: 17,
//                   backgroundImage: AssetImage("assets/images/im1.jpeg"),
//                 )
//               ],
//             ),
//             SizedBox(width: 10.0,),
//             Text("Mahmoud ",
//               style: TextStyle(
//                 fontFamily:"Poppins",
//                 fontSize: 14,
//                 fontWeight: FontWeight.w600,
//                 color: HexColor("#214E8A"),
//               ),),
//             Text("Ali",
//               style: TextStyle(
//                 fontFamily:"Poppins",
//                 fontSize: 14,
//                 fontWeight: FontWeight.w600,
//                 color: HexColor("#214E8A"),
//               ),),
//
//           ],
//         ),
//         Padding(
//           padding: const EdgeInsets.only(left: 8.0),
//           child: Text("I really like the atmosphere, good coffee, and nice interior. This is a good place to study or chill with friends.",
//             style: TextStyle(
//               fontFamily:"Poppins",
//               fontSize: 12,
//               fontWeight: FontWeight.w400,
//              // color: HexColor("#214E8A"),
//             ),),
//         ),
//
//       ],
//     ),
//   ) ;
// }


Widget profileData(GetProfileModel? model){
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),),
    margin: EdgeInsets.all(10.0),
    elevation: 2,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: CircleAvatar(
              radius: 74,
              backgroundColor: bluecolor,
              backgroundImage: NetworkImage("${model!.data![0].avatar ?? defaultAvatar}"),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text("${model.data![0].fullName}",
                      style: TextStyle(
                        fontFamily:"Poppins",
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                        color: HexColor("#214E8A"),
                      ),),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.check_circle,color: orangetextColor,),
                  ),

                ],),
              Text("${model.data![0].bio ?? defaultBio}",
                style: TextStyle(
                  fontFamily:"Poppins",
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: HexColor("#214E8A"),
                ),),
            ],
          ),
          SizedBox(height: 32,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("1",
                          style: TextStyle(
                              fontFamily:"Poppins",
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: HexColor("#214E8A"),
                              overflow: TextOverflow.ellipsis
                          ),),
                        Text("Photos",
                          style: TextStyle(
                            fontFamily:"Poppins",
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: HexColor("#214E8A"),
                          ),),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("${model.data![0].followers!.length}",
                          style: TextStyle(
                              fontFamily:"Poppins",
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: HexColor("#214E8A"),
                              overflow: TextOverflow.ellipsis
                          ),),
                        Text("Followers",
                          style: TextStyle(
                            fontFamily:"Poppins",
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: HexColor("#214E8A"),
                          ),),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("${model.data![0].following!.length}",
                        style: TextStyle(
                            fontFamily:"Poppins",
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: HexColor("#214E8A"),
                            overflow: TextOverflow.ellipsis
                        ),),
                      Text("Following",
                        style: TextStyle(
                          fontFamily:"Poppins",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: HexColor("#214E8A"),
                        ),),
                    ],
                  ),
                ),


              ],),
          ),
          SizedBox(height: 32,),
          Row(
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 102,
                      height: 32,
                      decoration: BoxDecoration(
                          color: orangetextColor,
                          borderRadius: BorderRadius.circular(30)
                      ),


                    ),
                    Container(
                      width: 100,
                      height: 30,
                      decoration: BoxDecoration(
                          color:  Colors.white,
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: Center(
                        child:
                        GestureDetector(
                          onTap: (){
                            // print("${cubit.isFollowing}");
                            // cubit.changeFollowingButton();
                          },
                          child: Text("follow",
                            style:  TextStyle(
                                fontFamily:"Poppins",
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: HexColor("#214E8A")),),
                        ),
                      ),

                    ),



                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 102,
                      height: 32,
                      decoration: BoxDecoration(
                          color: orangetextColor,
                          borderRadius: BorderRadius.circular(30)
                      ),


                    ),
                    Container(
                      width: 100,
                      height: 30,
                      decoration: BoxDecoration(
                          color:  Colors.white,
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: Center(
                        child:
                        GestureDetector(
                          onTap: (){
                            // print("${cubit.isFollowing}");
                            // cubit.changeFollowingButton();
                          },
                          child: Text("Message",
                            style:  TextStyle(
                                fontFamily:"Poppins",
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: HexColor("#214E8A")),),
                        ),
                      ),

                    ),



                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 28,),
        ],
      ),
    ),
  );
}



Widget ProfilePostBuilder(GetProfileModel? model,state,context,bool? IsPost){
  return Container(
    padding: EdgeInsets.only(bottom: 8),
    child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context,index)=>ProfileItem(
            walkieCubit.get(context),
            model,
            index,
            context,
            state,IsPost),
        separatorBuilder: (context,index)=>SizedBox(height: 30,),
        itemCount: model!.data![0].posts!.length),
  );
}
Widget ProfilePhotosBuilder(GetProfileModel? model){
  return  Container(
    child: GridView.count(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
      childAspectRatio: 1/1.3,
      children: List.generate(
          2,
              (index) =>Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18.0),
                image: DecorationImage(image: NetworkImage("${model!.data![0].avatar ?? defaultAvatar}"),fit: BoxFit.fill)
            ),
          )
      ),
    ),
  );
}
Widget ProfileVideosBuilder(GetProfileModel? model,bool? IsPost){
  return  ConditionalBuilder(
    condition: model!.data![0].reels!.length !=0,
    builder:(context) =>Container(
      child: GridView.count(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: 1/1.3,
        children: List.generate(
            model.data![0].reels!.length,
                (index) =>Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                //  image: DecorationImage(image: AssetImage("assets/images/ismailia.png",),fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(20)
              ),
              child:
              ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: PostVideo(IsPost,src: model.data![0].reels![index].reelUrl,)),
            )
        ),
      ),
    ),
    fallback: (context) =>Column(children: [Text("No videos yet",style: TextStyle(color: bluecolor,fontWeight: FontWeight.w500,fontSize: 24),)],),
  );
}