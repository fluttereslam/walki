import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';
import 'package:walki/modules/addpost/cubit.dart';
import 'package:walki/modules/addpost/states.dart';
import 'package:walki/modules/profile.dart';
import 'package:walki/shared/colors/colors.dart';
import 'package:walki/shared/components/components.dart';




var postController =TextEditingController();

class AddPost extends StatelessWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    FocusScopeNode currentFocus = FocusScope.of(context);
    //var cubit = AddPostWalkieCubit.get(context);
    return BlocConsumer<AddPostWalkieCubit,AddPostWalkieStates>(
      listener: (context,state){

        if (state is  walkieaddPostSuccessgState) {
          if (state.addPostModel.success == true) {
            navigateAndFinish(context, ProfileScreen());
            shoeToast(message: state.addPostModel.message!,
                state: ToastStates.SUCCESS);
            print(state.addPostModel.message);
            AddPostWalkieCubit.get(context).imageFile = null;
            postController.text = " ";

          }
          else{
            shoeToast(
                message: state.addPostModel.message, state: ToastStates.ERROR);
            //   print(state.Registarmodel.message);

            print("*****************   errror   *************");
          }
        }
      },
      builder: (context,state)=> Scaffold(
        appBar:  PreferredSize(
          preferredSize: Size.fromHeight(0.0),
          child: AppBar(
            elevation: 0,
          ),
        ),
        body:  SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
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
                             navigateAndFinish(context, ProfileScreen());
                              }, icon:
                         Image.asset("assets/images/Vector.png")
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text("Add Post",
                            style:  TextStyle(
                                fontFamily:"Poppins",
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: bluecolor),),
                        ),
                        Spacer(),
                        ConditionalBuilder(
                          condition: state is! walkieaddPostLodinglState,
                          builder: (context)=>Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 52,
                                height: 25,
                                decoration: BoxDecoration(
                                    color: bluecolor,
                                    borderRadius: BorderRadius.circular(30)
                                ),


                              ),
                              Container(
                                width: 50,
                                height: 23,
                                decoration: BoxDecoration(
                                    color:  Colors.white,
                                    borderRadius: BorderRadius.circular(30)
                                ),
                                child: Center(
                                  child:
                                  GestureDetector(
                                    onTap: () {
                                      print(" IMAGE:::::::::::::${AddPostWalkieCubit.get(context).isImage}");
                                      AddPostWalkieCubit.get(context).userAddPost(
                                          Post_title: postController.text,
                                      image_url: (AddPostWalkieCubit.get(context).isImage == null) ? null :((AddPostWalkieCubit.get(context).isImage!) ? AddPostWalkieCubit.get(context).imageFile : null),
                                      video_url: (AddPostWalkieCubit.get(context).isImage == null) ? null :((!AddPostWalkieCubit.get(context).isImage!) ?AddPostWalkieCubit.get(context).imageFile : null) ,
                                      );



                                    },
                                    child: Text("Post",
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
                          fallback: (context)=> CircularProgressIndicator(),
                        )


                      ],
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Divider(
                      thickness: 1,
                     color: HexColor("#5E5E5E"),
                    ),
                ),

                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                //       Stack(
                //           alignment: Alignment.center,
                //           children: [
                //             CircleAvatar(
                //               radius: 19,
                //               backgroundColor: HexColor("#AFBACA"),
                //
                //             ),
                //             CircleAvatar(
                //               radius: 17,
                //               backgroundImage: NetworkImage("assets/images/im1.jpeg"),
                //             )
                //           ],
                //         ),
                //       SizedBox(width: 9.46,),
                //       Text("Mahmoud Ali",
                //         style: TextStyle(
                //           fontFamily:"Poppins",
                //           fontSize: 14,
                //           fontWeight: FontWeight.w600,
                //           color: bluecolor,
                //         ),),
                //
                //     ],
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    height: 250,
                    child: Column(
                      children: [
                        TextFormField(
                          maxLines: 8,
                          controller: postController,
                              decoration: InputDecoration(
                                hintText: "What’s On Your Mind ?",
                                border: InputBorder.none,

                              ),

                            ),
                      //  Text("${postController.text}"),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 200,
                  height: 250,
                  child: showPostItem(AddPostWalkieCubit.get(context), context),
                ),
                !currentFocus.hasPrimaryFocus ? RownUI(AddPostWalkieCubit.get(context)) :  CoulumnUI(AddPostWalkieCubit.get(context))
              ],
            ),
        ),

      ),
    );
  }
}



Widget CoulumnUI(cubit){
  return Container(
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(
          thickness: 1,
          color: bluecolor,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child:
          GestureDetector(
              onTap: ()async {
                Map<Permission, PermissionStatus> statuses = await [
                  Permission.storage,
                  Permission.camera,
                ].request();
                if(statuses[Permission.storage]!.isGranted && statuses[Permission.camera]!.isGranted ){
                  cubit.imgFromGallery();
                }
                else {
                  print('no permission provided');
                }
              },
              child: Row(
            children: [

              Icon(Icons.add_photo_alternate_rounded,color: HexColor("#279500"),),
              SizedBox(width: 17,),
              Text("Photo",
                style:  TextStyle(
                    fontFamily:"Poppins",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: bluecolor),),
            ],
          )),
        ),
        Divider(
          thickness: 1,
          color: bluecolor,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child:
          GestureDetector(
              onTap: ()async {
                Map<Permission, PermissionStatus> statuses = await [
                  Permission.storage,
                  Permission.camera,
                ].request();
                if(statuses[Permission.storage]!.isGranted && statuses[Permission.camera]!.isGranted ){
                  cubit.videoFromGallery();
                }
                else {
                  print('no permission provided');
                }
              },
              child: Row(
            children: [
              Image(image: AssetImage("assets/images/reel.png"),),
              SizedBox(width: 17,),
              Text("Add Reel",
                style:  TextStyle(
                    fontFamily:"Poppins",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: bluecolor),),
            ],
          )),
        ),
        Divider(
          thickness: 1,
          color: bluecolor,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child:
          GestureDetector(onTap: (){}, child: Row(
            children: [
              Icon(Icons.person_add_alt_1,color: HexColor("#0062E4"),),
              SizedBox(width: 17,),
              Text("Tag People",
                style:  TextStyle(
                    fontFamily:"Poppins",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: bluecolor),),
            ],
          )),
        ),
        Divider(
          thickness: 1,
          color: bluecolor,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child:
          GestureDetector(
              onTap: ()async {
                Map<Permission, PermissionStatus> statuses = await [
                  Permission.storage,
                  Permission.camera,
                ].request();
                if(statuses[Permission.storage]!.isGranted && statuses[Permission.camera]!.isGranted ){
                  cubit.imgFromCamera();
                }
                else {
                  print('no permission provided');
                }
              },
              child: Row(
            children: [
              Icon(Icons.camera_alt,color: HexColor("#214E8A"),),
              SizedBox(width: 17,),
              Text("Camera",
                style:  TextStyle(
                    fontFamily:"Poppins",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: bluecolor),),
            ],
          )),
        ),
        Divider(
          thickness: 1,
          color: bluecolor,
        ),
      ],
    ),
  );
}
Widget RownUI(cubit){
  return Container(
    child: Row(
      children: [
        GestureDetector(
            onTap: ()async {
  Map<Permission, PermissionStatus> statuses = await [
  Permission.storage,
  Permission.camera,
  ].request();
  if(statuses[Permission.storage]!.isGranted && statuses[Permission.camera]!.isGranted ){
  cubit.imgFromGallery();
  }
  else {
  print('no permission provided');
  }
  }, child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.add_photo_alternate_rounded,color: HexColor("#279500"),),
        )),
        GestureDetector(
            onTap: ()async {
          Map<Permission, PermissionStatus> statuses = await [
            Permission.storage,
            Permission.camera,
          ].request();
          if(statuses[Permission.storage]!.isGranted && statuses[Permission.camera]!.isGranted ){
            cubit.videoFromGallery();
          }
          else {
            print('no permission provided');
          }
        }, child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image(image: AssetImage("assets/images/reel.png"),),
        )),
        GestureDetector(onTap: (){
          print("PERSON");
        }, child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.person_add_alt_1,color: HexColor("#0062E4"),),
        )),
        GestureDetector(
            onTap: ()async {
              Map<Permission, PermissionStatus> statuses = await [
                Permission.storage,
                Permission.camera,
              ].request();
              if(statuses[Permission.storage]!.isGranted && statuses[Permission.camera]!.isGranted ){
                cubit.imgFromCamera();
              }
              else {
                print('no permission provided');
              }
            }, child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.camera_alt,color: HexColor("#214E8A"),),
        )),

      ],
    ),
  );
}
Widget showPostItem(cubit,context){
  if(cubit.imageFile == null){
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          //color: Colors.grey[200],


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
              borderRadius: BorderRadius.circular(16),
              child: Image.file(cubit.imageFile!, height: 300.0, width: 300.0, fit: BoxFit.fill,))
          ,

        ),
      ],
    )
        : Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16)),
          child:
          (cubit.controller.value.isInitialized)?
          ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: VideoPlayer(cubit.controller))
              :Center(child: CircularProgressIndicator(color: orangetextColor,),),
        ),
        IconButton(onPressed: (){
          cubit.playOrPause();
        }, icon: Icon(cubit.playapPause,size: 16,color: Colors.white,)),
       
      ],
    );
  }


}