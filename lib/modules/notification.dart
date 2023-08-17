import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:walki/layout/cubit/cubit.dart';

import '../layout/cubit/states.dart';
import '../shared/colors/colors.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<walkieCubit,WalkieStates>(
      listener: (contex,state){},
      builder: (contex,state)=>Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(0.0),
          child: AppBar(

            elevation: 0,

          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all( 16.0),
                child: Row(
                  children: [
                    IconButton(
                          onPressed: (){
                            Navigator.pop(context);
                          }, icon: Image.asset("assets/images/Vector.png")),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text("Notifications",
                        style: TextStyle(
                          fontFamily:"Poppins",
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                           color: HexColor("#214E8A"),
                        ),),
                    )
                  ],
                ),
              ),
              ListView.separated(
                shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index)=>notificationItem(walkieCubit.get(context)),
                  separatorBuilder: (context,index)=>SizedBox(height: 4.0,),
                  itemCount: 10),
            ],
          ),
        ),
      ),
    );
  }


}

Widget notificationItem(cubit){
  return Card(
    margin: EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),),
    elevation: 2,
    child: Padding(
      padding: const EdgeInsets.only(left: 8.0,top: 8.0,right: 16.0,bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24.0,
                backgroundImage: AssetImage("assets/images/im1.jpeg"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Text("Osama",
                      style: TextStyle(
                      fontFamily:"Poppins",
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                        color: HexColor("#214E8A"),
                    ),),
                    Text(" Mahmoud",
                      style: TextStyle(
                      fontFamily:"Poppins",
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                        color: HexColor("#214E8A"),
                    ),),
                  ],
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
                        color: orangetextColor,
                        borderRadius: BorderRadius.circular(30)
                    ),


                  ),
                  Container(
                    width: 60,
                    height: 23,
                    decoration: BoxDecoration(
                        color: cubit.isFollowing ? orangetextColor : Colors.white,
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: Center(
                      child:
                      GestureDetector(
                        onTap: (){
                          print("${cubit.isFollowing}");
                          cubit.changeFollowingButton();
                        },
                        child: Text("${cubit.followText}",
                          style:  TextStyle(
                              fontFamily:"Poppins",
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: cubit.isFollowing?whitetextColor:HexColor("#214E8A")),),
                      ),
                    ),

                  ),



                ],
              ),

            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 54),
            child: Text("loved your post",
              style: TextStyle(
                fontFamily:"Poppins",
                fontSize: 12,
                fontWeight: FontWeight.w400,
               // color: HexColor("#214E8A"),
              ),),
  ),
        ],
      ),
    ),

  );
}