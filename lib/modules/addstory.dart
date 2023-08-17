
import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';
import 'package:walki/layout/cubit/cubit.dart';
import 'package:walki/layout/home_layout.dart';
import 'package:walki/shared/components/myapp.dart';
import 'package:walki/shared/variables.dart';

import '../layout/cubit/states.dart';
import '../shared/colors/colors.dart';
import '../shared/components/components.dart';
final formKeyy = GlobalKey<FormState>();
var addReelTitleController = TextEditingController();
//var reelTitlecontroller = TextEditingController();
class AddStory extends StatefulWidget {
  const AddStory({Key? key}) : super(key: key);

  @override
  State<AddStory> createState() => _AddStoryState();
}

class _AddStoryState extends State<AddStory> {
  //
   //File? imageFile ;

  @override
  Widget build(BuildContext context) {

//File? imagefile = walkieCubit.get(context).imageFile;
    return
       BlocConsumer<walkieCubit,WalkieStates>(
        listener: (context,state){
          if (state is  walkieaddRealSuccessgState) {
            if (state.addRealmodel.success == true) {
              navigateTo(context, HomeLayout());
              shoeToast(message: state.addRealmodel.message!,
                  state: ToastStates.SUCCESS);
              print(state.addRealmodel.message);
              walkieCubit.get(context).imageFile = null;
              addReelTitleController.text = " ";



            }
            else{
              shoeToast(
                  message: state.addRealmodel.message, state: ToastStates.ERROR);
              //   print(state.Registarmodel.message);

              print("*****************   errror   *************");
            }
          }
        },
        builder: (context,state)=> Scaffold(
          //backgroundColor: Colors.grey.withOpacity(0.99),
           appBar: PreferredSize(
            preferredSize: Size.fromHeight(0.0),
         child: AppBar(
           elevation: 0,
         ),
       ),
          body: Center(
            child:
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 16.0),
               child: Column(
                  children: [
                    Expanded(child: showStory(walkieCubit.get(context),context)),
                    Container(
                      height: 60,
                      width: double.infinity,
                      padding: EdgeInsets.all(12.0),
                      margin: EdgeInsets.symmetric(vertical:16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(67),
                        boxShadow: [

                          BoxShadow(
                            offset: Offset(0, 12),
                            blurRadius: 87,
                            spreadRadius: 6
                          )
                        ]
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                             // margin: EdgeInsets.all(12.0),
                              width: 40,
                            height: 50,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(8)
                             ),
                              child: showStorySmaller(walkieCubit.get(context), context),
                              ),

                           InkWell(
                             onTap: (){
                              // walkieCubit.get(context).getReels();
                             },
                             child: Text("Post",style: TextStyle(
                                fontFamily:"Poppins",
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: bluecolor,
                              ),),
                           ),
                       InkWell(
                         onTap: (){

                         },
                         child: Text("Story",style: TextStyle(
                                fontFamily:"Poppins",
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: bluecolor,
                              ),),
                       ),

                        InkWell(
                          onTap: (){
                            showModalBottomSheet(
                                context: context,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25.0),

                                  ),
                                ),
                                builder: (builder){
                                  return Form(
                                    key: formKeyy,
                                    child: Container(
                                      height: 200,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(topLeft:Radius.circular(20) ,topRight: Radius.circular(20))
                                        ),
                                     child:
                                        Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Text("Reel Title",style: TextStyle(
                                                      fontFamily:"Poppins",
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w600,
                                                      color: bluecolor,
                                                    ),),
                                                    TextFormField(
                                                      maxLines: 3,
                                                      controller: addReelTitleController,
                                                      decoration:InputDecoration(
                                                        hintText: "Title",
                                                        border: InputBorder.none,
                                                          contentPadding:EdgeInsets.only(left: 16)
                                                      ),
                                                      validator: (value){
                                                        if(value!.isEmpty){
                                                          return "title must not be empty" ;
                                                        }
                                                        return null;
                                                      },
                                                    ),
                                                    Row(
                                                      children: [
                                                        Spacer(),
                                                        // state is! walkieaddRealLodinglState
                                                        ConditionalBuilder(
                                                          condition: state is! walkieaddRealLodinglState,
                                                          builder: (context)=>TextButton(
                                                            onPressed: (){
                                                             if(formKeyy.currentState!.validate()) {
                                                               // print("**************submittt*********************");}
                                                               walkieCubit.get(
                                                                   context)
                                                                   .userAddreal(
                                                                   reel_title: addReelTitleController.text,
                                                                   reel_url: walkieCubit.get(context).imageFile);
                                                             }
                                                          },
                                                              child:
                                                                    Padding(
                                                                      padding: const EdgeInsets.all(8.0),
                                                                      child: Text("AddReel",style: TextStyle(
                                                                        fontFamily:"Poppins",
                                                                        fontSize: 16,
                                                                        fontWeight: FontWeight.w600,
                                                                        color: bluecolor,
                                                                      ),),
                                                                    ),

                                                          ),
                                                          fallback: (context)=>Center(child: CircularProgressIndicator()),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )



                                    ),
                                  );
                                });
                            print("YOUR TOKEN::${walkieCubit.get(context).token}");
                            print(walkieCubit.get(context).imageFile!.path);

                          },
                          child:
                             Text("Reel",style: TextStyle(
                              fontFamily:"Poppins",
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: bluecolor,
                            ),),

                        ),
                          Icon(Icons.ac_unit_outlined),

                        ],
                      ),
                    )


                  ],

            ),
             ),
          ),
        ),
      );
  }


















}


Widget showStorySmaller(cubit,context){
  if(cubit.imageFile == null){
    return Container(
      width: double.infinity,
      height: double.infinity,

      decoration: BoxDecoration(
          color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8.0)
      ),
    );
  }else{

    return (cubit.isImage)
        ?Container(
      width: double.infinity,
      height: double.infinity,

      child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.file(File(cubit.imageFile!.path), height: 50.0, width: 40.0, fit: BoxFit.fill,))
      ,
    )
        :Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8)),
      child:
      (cubit.controller.value.isInitialized)?
      ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: VideoPlayer(cubit.controller))
          :Center(child: CircularProgressIndicator(),),
    );
  }

}


Widget showStory(cubit,context){
  if(cubit.imageFile == null){
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,

          decoration: BoxDecoration(
              color: Colors.grey,
            borderRadius: BorderRadius.circular(24.0)
          ),



        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 38.0),
          child:
          pickStoryItem(cubit,context) ,


        ),
        Positioned(
          top: 21.0,
          right: 21.0,
          child: closeStoryItem(context),
        ),
      ],
    );
  }else{
  return  (cubit.isImage)
        ? Stack(
    alignment: Alignment.bottomCenter,
          children: [
            Container(
      width: double.infinity,
      height: double.infinity,

      child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
              child: Image.file(cubit.imageFile!, height: 300.0, width: 300.0, fit: BoxFit.fill,))
      ,

    ),
            Positioned(
              top: 21.0,
              right: 21.0,
              child: closeStoryItem(context),
            ),
            Padding(
                padding:EdgeInsets.only(bottom: 38) ,
                //left: MediaQuery.of(context).size.width*0.41,
                child: pickStoryItem(cubit,context) )
          ],
        )
      : Stack(
    alignment: Alignment.center,
    children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20)),
          child:
          (cubit.controller.value.isInitialized)?
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
              child: VideoPlayer(cubit.controller))
              :Center(child: CircularProgressIndicator(color: orangetextColor,),),
        ),
        IconButton(onPressed: (){
          cubit.playOrPause();
        }, icon: Icon(cubit.playapPause,size: 34,color: Colors.white,)),

        Positioned(
          top: 21.0,
          right: 21.0,
          child: closeStoryItem(context),
        ),
        Positioned(
            bottom: 38,
            left: MediaQuery.of(context).size.width*0.41,
            child: pickStoryItem(cubit,context) )
    ],
  );
  }


}