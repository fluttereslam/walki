
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:walki/layout/cubit/cubit.dart';
import 'package:walki/layout/cubit/states.dart';
import 'package:walki/models/get_all_bussenes.dart';
import 'package:walki/models/get_bussenesbyid.dart';
import 'package:walki/shared/colors/colors.dart';
import 'package:walki/shared/variables.dart';

import '../models/get_profile_model.dart';
import '../shared/components/components.dart';
import 'addpost/addpost.dart';
import 'home/play_post_video.dart';


//var commentController = TextEditingController();

class BussenesProfileScreen extends StatefulWidget {



   BussenesProfileScreen({Key? key,}) : super(key: key);

  @override
  State<BussenesProfileScreen> createState() => _BussenesProfileScreenState();
}

class _BussenesProfileScreenState extends State<BussenesProfileScreen> with TickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {

    TabController  tabController = TabController(vsync:this,length:3);



    return BlocConsumer<walkieCubit,WalkieStates>(
        listener: (context,state){

      if(state is walkieAddReviewSuccessgState){
        if(state.addReview.success == true) {
          shoeToast(
              message: state.addReview.message!, state: ToastStates.SUCCESS);
          print(state.addReview.message);
          //  print("Bearer ${state.loginmodel.data!.token}");

        }
        }
      },
        builder: (context,state)
        {
          List<Widget> tabs =[
            location(walkieCubit.get(context).getBussenesById,state,context),
            BussenesProductsBuilder(walkieCubit.get(context).getBussenesById,context,state),
            ReviewBuilder(walkieCubit.get(context).getBussenesById,context,state),
          ];

          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(0.0),
              child: AppBar(

                elevation: 0,

              ),
            ),
            body:
            ConditionalBuilder(
              condition: walkieCubit.get(context).getBussenesById != null && state is! walkiegetBusinessesByIdLodinglState &&walkieCubit.get(context).getProfileModel != null,
              builder: (context)=> SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              }, icon: Image.asset("assets/images/Vector.png")),
                          Spacer(),
                          IconButton(
                              onPressed: () {
                                // Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.more_vert, size: 35, color: orangetextColor,)),
                        ],
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 16.0),
                    //   child: Row(
                    //     children: [
                    //       Spacer(),
                    //       Stack(
                    //         alignment: Alignment.center,
                    //         children: [
                    //           Container(
                    //             width: 52,
                    //             height: 25,
                    //             decoration: BoxDecoration(
                    //                 color: bluecolor,
                    //                 borderRadius: BorderRadius.circular(30)
                    //             ),
                    //
                    //
                    //           ),
                    //           Container(
                    //             width: 50,
                    //             height: 23,
                    //             decoration: BoxDecoration(
                    //                 color: Colors.white,
                    //                 borderRadius: BorderRadius.circular(30)
                    //             ),
                    //             child: Center(
                    //               child:
                    //               GestureDetector(
                    //                 onTap: () {
                    //                   navigateAndFinish(context, AddPost());
                    //                 },
                    //                 child: Text("Post",
                    //                   style: TextStyle(
                    //                       fontFamily: "Poppins",
                    //                       fontSize: 12,
                    //                       fontWeight: FontWeight.w400,
                    //                       color: bluecolor),),
                    //               ),
                    //             ),
                    //
                    //           ),
                    //
                    //
                    //         ],
                    //       )
                    //     ],),
                    // ),
                    profileData(walkieCubit.get(context).getBussenesById,),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),),
                      margin: EdgeInsets.all(10.0),
                      elevation: 2,
                      child: Column(
                        children: [
                          SizedBox(height: 24,),
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
                                walkieCubit.get(context).changeBussenesTabindex(index);
                              },
                              labelStyle: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),

                              tabs: [
                                Tab(
                                  text: "Directions",
                                ),
                                Tab(
                                  text: "Products",
                                ),
                                Tab(
                                  text: "Reviews",
                                ),
                                // Tab(
                                //   text: "Reviews",
                                // ),

                              ],

                            ),
                          ),
                          SizedBox(height: 16.0,),
                          Container(
                            child: tabs[walkieCubit
                                .get(context)
                                .bussenestabindex],
                          )
                        ],
                      ),

                    ),
                  ],
                ),
              ),
              fallback: (context)=> Center(child: CircularProgressIndicator(),),
            ),

          );}
    );
  }
}




Widget profileData(GetBussenesById? model){
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),),
    margin: EdgeInsets.all(10.0),
    elevation: 2,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: CircleAvatar(
              radius: 74,
              backgroundColor: bluecolor,
              backgroundImage: NetworkImage("${model!.business![0].images ?? defaultAvatar}"),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text("${model.business![0].name}",
                  style: TextStyle(
                    fontFamily:"Poppins",
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    color: HexColor("#214E8A"),
                  ),maxLines: 2,overflow: TextOverflow.ellipsis,),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.check_circle,color: orangetextColor,),
              ),

            ],),
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
                        Text("2",
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
                      Text("0",
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



Widget location(GetBussenesById? model,state,context){
  return ConditionalBuilder(
    condition: state is! walkiegetBusinessesByIdLodinglState,
    builder: (context)=>Column(
      children: [
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
          onTap: ()  async {
    String url = "${model!.business![0].location}";
    var urllaunchable = await canLaunch(url); //canLaunch is from url_launcher package
    if(urllaunchable){
    await launch(url); //launch is from url_launcher package to launch URL
    }else{
    print("URL can't be launched.");
    }
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
          child: Text("${model!.business![0].address ?? "No Given Addrees"}",
            style:  TextStyle(
              fontFamily:"Poppins",
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),),
        )
      ],

    ),
    fallback:(context)=>Center(child: CircularProgressIndicator(),),
  );
}
Widget BussenesProductsBuilder(GetBussenesById? model,context,state){
  return  ConditionalBuilder(
    condition: state is! walkiegetBusinessesByIdLodinglState,
    builder:(context)=> Container(
      child: GridView.count(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: 1/1.3,
        children: List.generate(
            walkieCubit.get(context).getBussenesById!.business![0].products!.length,
                (index) =>ProductItem(walkieCubit.get(context).getBussenesById,index,walkieCubit.get(context),context)
        ),
      ),
    ),
  fallback:(context)=>Center(child: CircularProgressIndicator(),));
}
final formKey = GlobalKey<FormState>();

var reviewController =TextEditingController();

Widget ReviewBuilder(GetBussenesById? model,context,state){
  return
    ConditionalBuilder(
      condition: state is! walkiegetBusinessesByIdLodinglState,
      builder:(context)=>  Column(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 8),
            child: ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context,index)=>ReviewItem(model,index),
                separatorBuilder: (context,index)=>Divider(thickness: 1,height: 1,color: bluecolor,),
                itemCount: model!.business![0].reviews!.length),
          ),
          Form(
            key: formKey,
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                width: double.infinity,

                decoration: BoxDecoration(
                    color: HexColor("#EAEAEA"),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0,top: 4.0),
                          child: CircleAvatar(
                            radius: 18,
                            backgroundImage: NetworkImage("${
                                walkieCubit.get(context).getProfileModel!.data![0].avatar ??"https://cdn.pixabay.com/user/2023/02/26/11-15-00-151_250x250.png"}"),
                          ),
                        ),
                        SizedBox(width: 9.56,),
                        Text("${walkieCubit.get(context).getProfileModel!.data![0].fullName}",
                          style: TextStyle(
                            fontFamily:"Poppins",
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: bluecolor,
                          ),),
                      ],
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: TextFormField(
                          maxLines: 2,
                          validator: (value){
                            if(value!.isEmpty){
                              return "body is too short";
                            }
                            return null;
                          },
                          style: TextStyle(
                            fontFamily:"Poppins",
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                          cursorColor: Colors.grey,
                          controller: reviewController,
                          decoration: InputDecoration(
                            suffixIcon:ConditionalBuilder(
                              condition:  state is! walkieAddReviewLodinglState,
                              builder:(context) =>IconButton(
                                  onPressed: (){
                                    if(formKey.currentState!.validate()){


                                      walkieCubit.get(context).addReviewFun(
                                          review: reviewController.text,
                                          business_id: model.business![0].id);


                                      print("VALIDATED");
                                      print(reviewController.text);
                                     // print(id);
                                    }
                                  },
                                  icon: Text("Send",style: TextStyle(
                                      fontFamily:"Poppins",
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: bluecolor


                                  ),)
                              ),
                              fallback: (context) =>Container(height:20,width: 20,
                                  child: CircularProgressIndicator()),
                            ),
                            hintText: "Add Review...",
                            hintStyle: TextStyle(
                              fontFamily:"Poppins",
                              fontSize: 10,
                              fontWeight: FontWeight.w400,


                            ),
                            border: InputBorder.none,

                          ),

                        ),
                      ),
                    ),
                  ],
                )
            ),
          ),
        ],
      ),
        fallback:(context)=>Center(child: CircularProgressIndicator(),)
    );
}
Widget ReviewItem(GetBussenesById? model,int index){
  return Container(
    padding: EdgeInsets.all(16.0),
    child:
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 19,
                  backgroundColor: HexColor("#AFBACA"),

                ),
                CircleAvatar(
                  radius: 17,
                  backgroundImage: NetworkImage("${model!.business![0].reviews![index].user!.avatar}"),
                )
              ],
            ),
            SizedBox(width: 10.0,),
            Text("${model.business![0].reviews![index].user!.fullName}",
              style: TextStyle(
                fontFamily:"Poppins",
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: HexColor("#214E8A"),
              ),),


          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 44.0),
          child: Text("${model.business![0].reviews![index].review}",
            style: TextStyle(
              fontFamily:"Poppins",
              fontSize: 12,
              fontWeight: FontWeight.w400,
             // color: HexColor("#214E8A"),
            ),),
        ),

      ],
    ),
  ) ;
}

Widget ProductItem(GetBussenesById? model,int index,cubit,context){
  return Container(
    width: double.infinity,
    height: 237,
    decoration: BoxDecoration(
      color: HexColor("#214E8A"),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),),
          margin: EdgeInsets.all(1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 110,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text("${model!.business![0].name}",
                          style: TextStyle(
                              fontFamily:"Poppins",
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: orangetextColor
                          ),
                          maxLines: 1,overflow: TextOverflow.ellipsis,),
                      ),
                      InkWell(
                          onTap: (){},
                          child: Icon(Icons.favorite_border,color: orangetextColor,))
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding:  EdgeInsets.symmetric(horizontal: 4.0),
                  child: Text(
                    "${model.business![0].products![index].title}",
                    style: TextStyle(color: bluecolor,),
                  ),

                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0,left: 4,right: 4),
                  child: Row(
                    children: [
                      Icon(Icons.star,size: 14,color: orangetextColor,),
                      Icon(Icons.star,size: 14,color: orangetextColor,),
                      Icon(Icons.star,size: 14,color: orangetextColor,),
                      Icon(Icons.star,size: 14,color: orangetextColor,),
                      Icon(Icons.star,size: 14,),

                      Text(
                        " 4.5 ",
                        style: TextStyle(color: bluecolor),),


                    ],
                  ),
                ),
              ),


              // SizedBox(height: 100,)




            ],
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            width: double.infinity,
            height: 110,
            decoration: BoxDecoration(
              // color: HexColor("#214E8A"),
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(image: NetworkImage("${model.business![0].products![index].images}"),fit: BoxFit.fill)
            ),
          ),
        ),
      ],
    ),
  );
}