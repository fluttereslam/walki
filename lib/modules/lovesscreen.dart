import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:walki/layout/cubit/cubit.dart';
import 'package:walki/layout/cubit/states.dart';
import 'package:walki/models/get_post_model.dart';



import '../shared/colors/colors.dart';

class FavoriteScreen extends StatelessWidget {

  final List<Likes>? model;
  const FavoriteScreen(this.model,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      BlocConsumer<walkieCubit,WalkieStates>(
        listener: (context,state){},
        builder:(context,state) => Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(0.0),
          child: AppBar(
            elevation: 0,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0,top: 8.0),
                      child: IconButton(
                          onPressed: (){
                            Navigator.pop(context);
                          }, icon: Image.asset("assets/images/Vector.png")),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text("People Who Reacted",
                        style:  TextStyle(
                            fontFamily:"Poppins",
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: bluecolor),),
                    ),


                  ],
                ),
              ),
              SizedBox(height: 24,),
            ConditionalBuilder(
              condition: model!.length !=0,
              builder: (context)=>ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (contex,index)=>ReactedPeopleItem(model,index),
                  separatorBuilder: (contex,index)=>SizedBox(height: 0.0,),
                  itemCount: model!.length),
              fallback: (context)=>Center(child: Text("No One Reacted yet",style: TextStyle(
                fontFamily:"Poppins",
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: bluecolor,
              ),),),
            )
            ],
          ),
        )
    ),
      );
  }
}


Widget ReactedPeopleItem(List<Likes>? model,index){
  return   Card(
    margin: EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),),
    elevation: 3,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: NetworkImage("${model![index].avatar??"https://cdn.pixabay.com/user/2023/02/26/11-15-00-151_250x250.png"}"),
              ),
              CircleAvatar(
                radius: 8,
                backgroundColor: HexColor("#F44336"),
                child: Center(child: Icon(Icons.favorite,color: Colors.white,size: 15,)),
              ),
            ],
          ),
          SizedBox(width: 9.56,),
          Text("${model[index].fullName}",
            style: TextStyle(
              fontFamily:"Poppins",
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: bluecolor,
            ),),
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
                    color:  Colors.white,
                    borderRadius: BorderRadius.circular(30)
                ),
                child: Center(
                  child:
                  GestureDetector(
                    onTap: () {},
                    child: Text("Follow",
                      style:  TextStyle(
                          fontFamily:"Poppins",
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: bluecolor),),
                  ),
                ),

              ),



            ],
          ),
        ],
      ),
    ),
  );
}