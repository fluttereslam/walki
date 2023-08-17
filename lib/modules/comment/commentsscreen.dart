


import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:walki/layout/cubit/cubit.dart';
import 'package:walki/layout/cubit/states.dart';
import 'package:walki/models/get_post_model.dart';
import 'package:walki/modules/comment/replay_screen.dart';
import 'package:walki/shared/components/components.dart';

import '../../shared/colors/colors.dart';

final formKey = GlobalKey<FormState>();

class CommentScreen extends StatelessWidget {
  final List<Comments>? model;
  final int? id;
  final bool? isPost;

  const CommentScreen(this.model,this.id,this.isPost,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<walkieCubit,WalkieStates>(
      listener: (context,state){},
      builder: (context,state)=> Scaffold(
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
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
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
                        child: Text("Comments",
                          style:  TextStyle(
                              fontFamily:"Poppins",
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: bluecolor),),
                      ),


                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Divider(thickness: 1,color: bluecolor,),
                ),
                ConditionalBuilder(
                  condition: model!.length != 0,
                  builder: (context)=>ListView.separated(
                      padding: EdgeInsets.only(bottom: 104),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context,index)=>CommentsItem(model,index,context),
                      separatorBuilder: (context,index)=>SizedBox(height: 0.0,),
                      itemCount: model!.length),
                  fallback: (context)=>Center(child: Text("No comments yet",style: TextStyle(
                    fontFamily:"Poppins",
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: bluecolor,
                  ),),),
                )
              ],
            ),
          ),
          bottomSheet: Form(
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
                      controller: commentController,
                      decoration: InputDecoration(
                        suffixIcon:ConditionalBuilder(
                          condition:  state is! walkieaddCommentLodinglState,
                          builder:(context) =>IconButton(
                              onPressed: (){
                                if(formKey.currentState!.validate()){


                                    walkieCubit.get(context).addComment(
                                      body: commentController.text,
                                    post_id: id,
                                    url:isPost! ? "post/comment" : "reel/comment",
                                      isPost: isPost
                                  );


                                  print("VALIDATED");
                                  print(commentController.text);
                                  print(id);
                                }
                              },
                              icon: Text("Post",style: TextStyle(
                                  fontFamily:"Poppins",
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: bluecolor


                              ),)
                          ),
                          fallback: (context) =>Container(height:20,width: 20,
                              child: CircularProgressIndicator()),
                        ),
                        hintText: "Add Comment...",
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
      ),
    );
  }
}

var commentController =TextEditingController();

Widget CommentsItem( List<Comments>? model,index,context){
  var cubit = walkieCubit.get(context);
  return   Container(
    margin: EdgeInsets.symmetric(vertical: 4.0,),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          margin: EdgeInsets.symmetric(horizontal: 16.0,),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),),
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundImage: NetworkImage("${model![index].user!.avatar ??"https://cdn.pixabay.com/user/2023/02/26/11-15-00-151_250x250.png"}"),
                    ),
                    SizedBox(width: 9.56,),
                    Text("${model[index].user!.fullName}",
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
                Padding(
                  padding: const EdgeInsets.only(left: 50.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child:
                      Text("${model[index].body}")),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 2.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [


                             Icon(Icons.favorite_border,color: bluecolor,),

                            Text("2",style: TextStyle(
                              fontFamily:"Poppins",
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: bluecolor,
                            )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),


              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 72.0),
          child: InkWell(
            onTap: (){
              print("*********************${index}********************************");
              if (cubit.replies.contains(index)) navigateTo(context, RepalyScreen(name:cubit.names[index]));
              cubit.ShowReplaies(index);
            },
            child: Text("Replay",
                style: TextStyle(
                  fontFamily:"Poppins",
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: bluecolor,
                )
            ),
          ),
        ),
       if (cubit.replies.contains(index))Replaybuilder(context),
      ],
    ),
  );
}

Widget Replaybuilder(context){
  return
  ListView.separated(
    shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context,index)=>ReplayItem(),
      separatorBuilder: (context,index)=>SizedBox(height: 4,),
      itemCount: 2);
}
Widget ReplayItem(){
  return Container(
    padding: EdgeInsets.only(left: 64),
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0,top: 2.0),
                child: CircleAvatar(
                  radius: 18,
                  backgroundImage: AssetImage("assets/images/ismailia.png"),
                ),
              ),
              SizedBox(width: 9.56,),
              Text("Mahmoud Ali",
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
              padding: const EdgeInsets.only(left: 56),
              child:Text("Yes its nice",style:TextStyle(
                fontFamily:"Poppins",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: bluecolor,
              ))

            ),
          ),
        ],
      ),
    ),
  );
}