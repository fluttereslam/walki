
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:readmore/readmore.dart';
import 'package:walki/layout/cubit/cubit.dart';
import 'package:walki/layout/cubit/states.dart';
import 'package:walki/layout/home_layout.dart';
import 'package:walki/models/get_all_bussenes.dart';
import 'package:walki/models/get_post_model.dart';
import 'package:walki/models/get_profile_model.dart';
import 'package:walki/modules/addstory.dart';
import 'package:walki/modules/all_top_cafee.dart';
import 'package:walki/modules/allevents.dart';
import 'package:walki/modules/busseness_profile.dart';
import 'package:walki/modules/comment/commentsscreen.dart';
import 'package:walki/modules/home/home.dart';
import 'package:walki/modules/home/play_post_video.dart';
import 'package:walki/modules/location.dart';
import 'package:walki/modules/lovesscreen.dart';
import 'package:walki/modules/other_user_profile.dart';
import 'package:walki/modules/play_story_video.dart';
import 'package:walki/modules/story/data.dart';
import 'package:walki/modules/story/story_home.dart';
import 'package:walki/modules/story/story_screen.dart';
import 'package:walki/modules/story/storyhome.dart';
import 'package:walki/shared/colors/colors.dart';
import 'package:walki/shared/network/local/cashe_helper.dart';
import 'package:walki/shared/variables.dart';
FocusNode myFocusNode =  FocusNode();
Widget defaultFormfield({

  required TextEditingController controller,
  required TextInputType type,
  ValueChanged? onSubmit,
  ValueChanged? onchange,
  GestureTapCallback?onTap,
  required FormFieldValidator? validate,
   String? label,
   String? hint,
  IconData? prefix,
  IconData? suffix,
  bool issearch =false,
  bool isPassword = false,
  Color textColor = Colors.white,
  GestureTapCallback? SuffixPressed,
  GestureTapCallback? prefixPressed,
}) =>TextFormField(

  style: TextStyle(color:issearch ? HexColor("#A7A7A7"): textColor ),
  controller: controller,
  keyboardType: type,
  onFieldSubmitted: onSubmit,
  onChanged: onchange,
  validator: validate,
  obscureText: isPassword,
  cursorColor: issearch ? HexColor("#A7A7A7"):HexColor("#FFFFFF"),
  decoration: InputDecoration(
  contentPadding: EdgeInsets.all(2),
   hintText: hint,
    hintStyle: TextStyle(
        color: issearch ? HexColor("#A7A7A7") :HexColor("#FFFFFF")),
    labelText: label,
    labelStyle: TextStyle(
        color: issearch ? HexColor("#A7A7A7") :HexColor("#FFFFFF")),
    prefixIcon:IconButton(
        onPressed: prefixPressed,
        icon: Icon(prefix,color: issearch ? HexColor("#A7A7A7"):HexColor("#FFFFFF"))
    ),
    suffixIcon: IconButton(
        onPressed: SuffixPressed,
        icon: Icon(suffix,color: HexColor("#FFFFFF"),)
    ),
   //fillColor:HexColor("#FFFFFF") ,
   //
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: BorderSide(
        color: HexColor("#FFFFFF"),
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: BorderSide(
        color: HexColor("#FFFFFF"),
        width: 1.0,
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      



    ),
  ),

  onTap: onTap,
);



Widget defaultFormfield2({
  required TextEditingController controller,
  required TextInputType type,
  ValueChanged? onSubmit,
  ValueChanged? onchange,
  GestureTapCallback?onTap,
  FormFieldValidator? validate,
  String? label,
  String? hint,
  //String? assetName,
  IconData? prefix,
  IconData? suffix,
  bool issearch =false,
  bool isPassword = false,
  Color textColor = Colors.white,
  GestureTapCallback? prefixPressed,
}) =>TextFormField(
  style: TextStyle(color:issearch ? HexColor("#A7A7A7"): textColor ),
  controller: controller,
  keyboardType: type,
  onFieldSubmitted: onSubmit,
  onChanged: onchange,
  validator: validate,
  obscureText: isPassword,
  cursorColor: issearch ? HexColor("#A7A7A7"):HexColor("#FFFFFF"),
  decoration: InputDecoration(
    contentPadding: EdgeInsets.all(2),

    hintText: hint,
    hintStyle: TextStyle(
      fontSize: 12,
        color: issearch ? HexColor("#A7A7A7") :HexColor("#FFFFFF")),
    labelText: label,
    labelStyle: TextStyle(
        color: issearch ? HexColor("#A7A7A7") :HexColor("#FFFFFF")),
    // prefixIcon:CircleAvatar(
    //   radius: 5,
    //    backgroundImage: AssetImage("${assetName}"),
    // ),

    //fillColor:HexColor("#FFFFFF") ,
    //
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: BorderSide(
        color: HexColor("#FFFFFF"),
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: BorderSide(
        color: HexColor("#FFFFFF"),
        width: 1.0,
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),




    ),
  ),

  onTap: onTap,
);




Widget updateProfiledefaultFormfield({
  required TextEditingController controller,
  required TextInputType type,
  ValueChanged? onSubmit,
  ValueChanged? onchange,
  GestureTapCallback?onTap,
  FormFieldValidator? validate,
  String? label,
  String? hint,
  IconData? prefix,
  IconData? suffix,
  bool isPassword = false,
  Color textColor = Colors.white,
  GestureTapCallback? prefixPressed,
}) =>TextFormField(
  style: TextStyle(color: HexColor("#434343") ),
  autovalidateMode:AutovalidateMode.onUserInteraction,
  controller: controller,
  keyboardType: type,
  onFieldSubmitted: onSubmit,
  onChanged: onchange,
  validator: validate,
  obscureText: isPassword,
  cursorColor: HexColor("#434343"),
  decoration: InputDecoration(
    contentPadding: EdgeInsets.all(2),
    hintText: hint,
    suffix: GestureDetector(
        onTap: (){},
        child: Icon(suffix)),
   prefix: Icon(prefix),
    hintStyle: TextStyle(
        fontSize: 14,
        color:HexColor("#434343")),
    labelText: label,
    labelStyle: TextStyle(
        color: HexColor("#434343")),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: BorderSide(
        color: bluecolor,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: BorderSide(
        color: bluecolor,
        width: 1.0,
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),

    ),
  ),
  onTap: onTap,
);


Widget SearchdefaultFormfield({
  required TextEditingController controller,
  required TextInputType type,
  ValueChanged? onSubmit,
  ValueChanged? onchange,
  GestureTapCallback?onTap,
  FormFieldValidator? validate,
  String? label,
  String? hint,
  IconData? prefix,
  IconData? suffix,

  Color textColor = Colors.white,
  GestureTapCallback? prefixPressed,
}) =>TextFormField(
  style: TextStyle(color: HexColor("#000000") ),
  autovalidateMode:AutovalidateMode.onUserInteraction,
  controller: controller,
  keyboardType: type,
  onFieldSubmitted: onSubmit,
  onChanged: onchange,
  validator: validate,

  cursorColor: HexColor("#000000"),
  decoration: InputDecoration(
    contentPadding: EdgeInsets.all(2),
    hintText: hint,
    suffix: GestureDetector(
        onTap: (){},
        child: Icon(suffix)),
    prefix: Icon(prefix),
    hintStyle: TextStyle(
        fontSize: 14,
        color:HexColor("#000000")),
    labelText: label,
    labelStyle: TextStyle(
        color: HexColor("#000000")),

    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),

    ),
  ),

  onTap: onTap,
);



void showImagePicker(BuildContext context,cubit) {
  showModalBottomSheet(
      context: context,
      builder: (builder){
        return Card(
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              margin: const EdgeInsets.only(top: 8.0),
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: InkWell(
                        child: Column(
                          children: const [
                            Icon(Icons.image, size: 30.0,),
                            SizedBox(height: 12.0),
                            Text(
                              "Gallery",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 12, color: Colors.black),
                            )
                          ],
                        ),
                        onTap: () {
                          cubit.imgFromGallery();
                          Navigator.pop(context);
                        },
                      )),
                  Expanded(
                      child: InkWell(
                        child: SizedBox(
                          child: Column(
                            children: const [
                              Icon(Icons.camera_alt, size: 30.0,),
                              SizedBox(height: 12.0),
                              Text(
                                "Camera",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 12, color: Colors.black),
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          cubit.imgFromCamera();

                        },
                      )),
                  Expanded(
                      child: InkWell(
                        child: SizedBox(
                          child: Column(
                            children: const [
                              Icon(Icons.video_camera_back_outlined, size: 30.0,),
                              SizedBox(height: 12.0),
                              Text(
                                "gallary",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 12, color: Colors.black),
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          cubit.videoFromGallery();

                        },
                      ))
                ],
              )),
        );
      }
  );
}

Widget pickStoryItem(context,cubit){
  return InkWell(
    onTap: () async {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.storage,
        Permission.camera,
      ].request();
      if(statuses[Permission.storage]!.isGranted && statuses[Permission.camera]!.isGranted ){
        // walkieCubit.get(context).clearImageFile();
        showImagePicker(cubit,context,);
      }
      else {
        print('no permission provided');
      }
    },
    child: Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.white.withOpacity(0.1),
          backgroundImage: AssetImage("assets/images/rectangle.png"),
        ),
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.white,
        ) ,
      ],
    ),
  );
}


Widget closeStoryItem(context){
  return CircleAvatar(
    radius: 14,
    backgroundColor: Colors.white,
    child: InkWell(
        onTap:(){
          navigateTo(context, HomeLayout());
        //  shoeToast(message: "TOKEN ::: ${caheHelper.getData(key: 'token')}", state: ToastStates.WARNING);
         // print("TOKEN ::: ${token}");
        },
        child: Icon(Icons.close,color: Colors.black,)),
  );
}

Widget defaultButton({
  double width = double.infinity,
  bool IsUpperCase = false,
  Color background = Colors.blueAccent,
  required VoidCallback function,
  required String text,
   bool IsUbdate =false,
   bool IsBook =false,

}) => Container(
  height: 40.0,
  width: width,

  decoration: BoxDecoration(
    color: background,
    borderRadius: BorderRadius.circular(30),
  ),
  child: TextButton(
    onPressed: function,
    child: Text(
      IsUpperCase ? text.toUpperCase() : text,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: "Poppins",
        color: Colors.white,
      ),
    ),
  ),
);

class painterText extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size){
    final paint = Paint()
      ..strokeWidth=1
      ..color=HexColor("#FD5B1F")
    ..style = PaintingStyle.stroke;
    Path path0 = Path();
    path0.moveTo(size.width*0.8640600,size.height*0.2457000);
    path0.cubicTo(size.width*0.9424000,size.height*0.3655500,size.width*0.9596600,size.height*0.6060000,size.width*0.8617600,size.height*0.7403500);
    path0.cubicTo(size.width*0.8419200,size.height*0.7885000,size.width*0.1242800,size.height*0.7992000,size.width*0.1000000,size.height*0.7457000);
    path0.cubicTo(size.width*0.0319400,size.height*0.6526000,size.width*0.0116600,size.height*0.3915500,size.width*0.1020000,size.height*0.2450000);
    path0.cubicTo(size.width*0.1551600,size.height*0.2144000,size.width*0.8470200,size.height*0.1983000,size.width*0.8640600,size.height*0.2457000);
    path0.close();



    canvas.drawPath(path0, paint);

    // to drow line
    // canvas.drawLine(
    //     Offset(size.width*1/6, size.height*1/2),
    //     Offset(size.width*5/6, size.height*1/2),
    //      paint);
  }
  @override
  bool shouldRepaint(CustomPainter olddDelegate)=>false;
}
class CustomClipPath extends CustomClipper<Path> {
  //var radius=5.0;
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(0,size.height*0.2000000);
    path0.quadraticBezierTo(size.width*0.0987500,size.height*-0.0737500,size.width*0.2450000,size.height*0.1150000);
    path0.cubicTo(size.width*0.4587500,size.height*0.3762500,size.width*0.6762500,size.height*0.7587500,size.width*0.9850000,size.height*0.9950000);
    path0.quadraticBezierTo(size.width*0.8737500,size.height*1.0175000,size.width*0.0050000,size.height);
    path0.lineTo(0,size.height*0.2000000);
    path0.close();


    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class CustomClipPath2 extends CustomClipper<Path> {
  //var radius=5.0;
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(size.width,size.height*0.2400000);
    path0.quadraticBezierTo(size.width*0.8937500,size.height*-0.1537500,size.width*0.6850000,size.height*0.2250000);
    path0.cubicTo(size.width*0.5375000,size.height*0.4562500,size.width*0.2175000,size.height*0.8312500,size.width*0.0200000,size.height*0.9900000);
    path0.quadraticBezierTo(size.width*0.2612500,size.height*0.9900000,size.width,size.height*0.9950000);
    path0.lineTo(size.width,size.height*0.2400000);
    path0.close();



    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
class CustomClipPath3 extends CustomClipper<Path> {
  //var radius=5.0;
  @override
  Path getClip(Size size) {




    Path path0 = Path();
    path0.moveTo(size.width*0.5229000,size.height*0.3051667);
    path0.cubicTo(size.width*0.4650333,size.height*0.1647000,size.width*0.4173333,size.height*0.1568667,size.width*0.3515000,size.height*0.3229000);
    path0.cubicTo(size.width*0.3252833,size.height*0.3518667,size.width*0.2256833,size.height*0.8776333,size.width*0.0064333,size.height*0.9916333);
    path0.cubicTo(size.width*0.2525958,size.height*0.9937250,size.width*0.7628833,size.height*1.0086333,size.width,size.height);
    path0.cubicTo(size.width*0.7081833,size.height*0.8821000,size.width*0.5471667,size.height*0.3536000,size.width*0.5229000,size.height*0.3051667);
    path0.close();






    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
//ImageProvider svgpict = SvgPicture.asset("assets/images/center.svg");


void navigateTo(context, widget){
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context)=>widget));
}

void navigateAndFinish(context, widget){
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
          builder: (context)=>widget),
          (route){
        return false;
      }

  );
}


Widget showStoriesAndPosts(context,cubit,GetPostModel postmodel,GetProfileModel? profile,state,bool? IsPost){

  return Column(
    children: [
      Container(
        height: 100,
        //color: Colors.white,
        //width: 300,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: (){
                  navigateTo(context, AddStory());
                },
                child: Container(
                  //margin: EdgeInsets.only(top: 4.0),
                  padding: EdgeInsets.only(right: 10.0,left: 8.0,),
                  height: 100.0,
                  width: 80.0,
                  child: Column(
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage("${profile!.data![0].avatar?? defaultAvatar}"),
                            radius: 33.3,
                          ),

                          Padding(
                            padding: const EdgeInsets.only(bottom: 4.0,right: 4.0),
                            child: CircleAvatar(
                              backgroundColor: HexColor("#214E8A"),
                              radius: 10,
                              child: Icon(Icons.add,size: 18,),),
                          ),
                        ],
                      ),
                       Text("${profile.data![0].firstName}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,

                      ),
                    ],
                  ),
                ),
              ),
              ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index)=>StoryItem(postmodel,index,context),
                  separatorBuilder: (context,index)=>SizedBox(width: 10,),
                  itemCount: postmodel.posts!.length),

            ],
          ),

        ),
      ),
      Card(

        margin: EdgeInsets.symmetric(horizontal: 0.0),
        elevation: 4,
        child: Column(
          children: [
            Row(
              children: [
                Spacer(),

              ],
            ),
            Container(
              height: 300,
              margin: EdgeInsets.only(top: 20,bottom: 30.0),
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index)=>GiftItem(),
                  separatorBuilder:  (context,index)=>SizedBox(width: 30,),
                  itemCount: 10),
            )
          ],

        ),


      ),
      SizedBox(height: 20,),
      ListView.separated(
          padding: EdgeInsets.all(0.0),
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context,index)=>PostItem(cubit,postmodel,profile,index,context,state,IsPost),
          separatorBuilder: (context,index)=> SizedBox(height: 20,),
          itemCount:postmodel.posts!.length ),
      showRcommended(cubit,context)
    ],
  );
}



Widget StoryItem(GetPostModel? model,int index,context)=>
    InkWell(
      onTap: (){
        navigateTo(context, storyScreen(index));
      },
      child: Container(
       width: 60.0,
         child: Column(

      children: [
         Stack(
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
                 radius: 33.0,
                 backgroundColor: Colors.transparent,
               ),
              ),
             CircleAvatar(
              radius: 28.5,
              backgroundColor: Colors.white,
            ),

            storyHomeImageOrVideoOrEmpty(model,index,context)





          ],
        ),
         Text("${model!.posts![index].user!.firstName}",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,

        ),
      ],
  ),
),
    );
Widget storyHomeImageOrVideoOrEmpty(GetPostModel? model,int index,context){
  if(model!.posts![index].imagePath == null){
    if(model.posts![index].videoPath == null){
      return CircleAvatar(
        backgroundColor: whitetextColor,
        radius: 26.3,
        child: Container(
          padding: EdgeInsets.all(6.4),
            child: Center(child: Text("${model.posts![index].title}",
                style: TextStyle(
                    fontFamily:"Poppins",
                    fontSize: 8,
                    fontWeight: FontWeight.w400,
                    color: orangetextColor)),)),
      );
    }else {
      return CircleAvatar(
        radius: 26.3,
        backgroundColor: whitetextColor,
         child: ClipRRect(
             borderRadius:BorderRadius.circular(100),
           child: StoryVideo(src: model.posts![index].videoPath,)),


      );
        // Stack(
        //   children: [
        //     Container(
        //       margin: EdgeInsets.symmetric(horizontal: 10.0),
        //       height: double.infinity,
        //       width: double.infinity,
        //       decoration: BoxDecoration(
        //         //  image: DecorationImage(image: AssetImage("assets/images/ismailia.png",),fit: BoxFit.fill),
        //           borderRadius: BorderRadius.circular(20)
        //       ),
        //       child:
        //       ClipRRect(
        //           borderRadius: BorderRadius.circular(20),
        //           child: StoryHome(src: model.posts![index].videoPath,)),
        //     ),
        //     Positioned(
        //         top: 16.0,
        //         right: 16.0,
        //
        //         child: InkWell(
        //           onTap: (){
        //             navigateAndFinish(context, HomeLayout());
        //           },
        //           child: CircleAvatar(
        //             radius: 12,
        //             backgroundColor: Colors.white,
        //             child:Icon(Icons.close),
        //           ),
        //         ))
        //   ],
        // );

    }
  }else{
    return CircleAvatar(
      backgroundColor: whitetextColor,
      radius: 26.3,
      backgroundImage: NetworkImage("${model.posts![index].imagePath}"),
    );

  }
}

Widget GiftItem()=>
      Container(

        padding: EdgeInsets.only(bottom: 5),
        height: 300,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              //  // tileMode: TileMode.mirror,
              //  // transform: Matrix4.translationValues(x, y, z),
              stops: [
                0.0,
                1.0,
              ],
              colors: [
                startAvatar.withOpacity(0.9),
                endAvatar.withOpacity(0.9),
              ]
          ),
          //shape: BoxShape.circle,

        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 20 ,left: 10,right: 10 ),
              height: 100,
              child:
              Text("How You Can Get a Gift...!",
                style: TextStyle(
                    fontFamily:"Poppins",
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: HexColor("#FFFFFF")),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,),


            ),
            Container(
              width: 110,
              height: 50,
              child: CustomPaint(
                painter: painterText(),
                child: Center(
                  child:
                  TextButton(
                    onPressed: (){},
                    child: Text("Let's Go",
                      style: TextStyle(
                          fontFamily:"Poppins",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: HexColor("#FFFFFF")),),
                  ),
                ),
              ),

            ),
            Expanded(
              child: Container(
                width: 200,
                height: 90,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50)
                ),
                child: Image.asset("assets/images/gift1.png",fit: BoxFit.contain,),

              ),
            ),

          ],
        ),
      );

Widget ProfileItem(cubit,GetProfileModel? profilemodel,int index,context,state,bool? IsPost,{double margin = 10})=>
    Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),),
      margin: EdgeInsets.symmetric(horizontal: margin),
      //elevation: 20,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(14.0),
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
                      backgroundImage:
                      NetworkImage("${profilemodel!.data![0].avatar??"https://cdn.pixabay.com/user/2023/02/26/11-15-00-151_250x250.png"}"),
                      radius: 22.0,
                    ),





                  ],
                ),),
              Padding(
                padding: const EdgeInsets.only(top: 36.0),
                child: Text("${profilemodel.data![0].firstName} ",
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
          profileimageOrVideoOrEmpty(profilemodel,index,IsPost),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    InkWell(
                        onTap: ()async{
                          await cubit.changeFavorites(profilemodel.data![0].posts![index].id);
                          print("CHANGED");
                        },
                        onDoubleTap: (){
                         // navigateTo(context, FavoriteScreen(profilemodel.posts![index].likes));
                        },
                        //padding: EdgeInsets.all(0.0),
                        child: Icon(
                          Icons.favorite_border_outlined,
                          color: bluecolor,
                          size: 32,

                        )),
                    Text("${profilemodel.data![0].posts![index].likesCount}",
                   // Text("1",
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
                          navigateTo(context, CommentScreen(profilemodel.data![0].posts![index].comments,profilemodel.data![0].posts![index].id,true));
                        },

                        child: Container(
                          padding: EdgeInsets.only(bottom: 5,top: 4),
                          child: Image.asset("assets/images/comment.png"),
                        )),
                   Text("${profilemodel.data![0].posts![index].commentsCount}",

                      style: TextStyle(
                          fontFamily:"Poppins",
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: bluecolor),),
                  ],
                ),
                SizedBox(width: 10,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: (){
                          print("helllo comment");
                        },
                        // padding: EdgeInsets.all(0.0),
                        child: Icon(Icons.bookmark_outline,color: bluecolor,size: 30,)),
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
                    Text("${profilemodel.data![0].fullName}  ",
                      style: TextStyle(
                        fontFamily:"Poppins",
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),),
                    // Stack(
                    //   alignment: Alignment.center,
                    //   children: [
                    //     Container(
                    //       width: 62,
                    //       height: 25,
                    //       decoration: BoxDecoration(
                    //           color: orangetextColor,
                    //           borderRadius: BorderRadius.circular(30)
                    //       ),
                    //
                    //
                    //     ),
                    //     Container(
                    //       width: 60,
                    //       height: 23,
                    //       decoration: BoxDecoration(
                    //           color: cubit.Favorites[model.posts![index].user!.id] ? orangetextColor : Colors.white,
                    //           borderRadius: BorderRadius.circular(30)
                    //       ),
                    //       child: Center(
                    //         child:
                    //         GestureDetector(
                    //           onTap: (){
                    //             print("${cubit.isFollowing}");
                    //             cubit.changeFollowing(model.posts![index].user!.id);
                    //
                    //
                    //           },
                    //           child: Text("${cubit.Favorites[model.posts![index].user!.id] ? "Following" : "Follow" }",
                    //             style:  TextStyle(
                    //                 fontFamily:"Poppins",
                    //                 fontSize: 10,
                    //                 fontWeight: FontWeight.w400,
                    //                 color: cubit.Favorites[profilemodel.id]?whitetextColor:HexColor("#214E8A")),),
                    //         ),
                    //       ),
                    //
                    //     ),
                    //
                    //
                    //
                    //   ],
                    // ),

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
                            '${profilemodel.data![0].posts![index].title}',
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
                  ConditionalBuilder(
                    condition:  state is! walkieaddCommentLodinglState,
                    builder:(context)=>
                        CircleAvatar(
                          radius: 12,
                          backgroundImage:
                          NetworkImage("${profilemodel.data![0].avatar??"https://cdn.pixabay.com/user/2023/02/26/11-15-00-151_250x250.png"}"),
                        ),
                    fallback: (context)=> CircularProgressIndicator() ,
                  ),

                  GestureDetector(
                    onTap: (){
                   //   navigateTo(context, CommentScreen(profilemodel.posts![index].comments,profilemodel.posts![index].id,true));
                    },
                    child: Container(
                        padding: EdgeInsets.only(left: 8.0,top: 10),
                        height: 40,
                        width: 250,

                        child: Text("add comment",style: TextStyle(
                            fontFamily:"Poppins",
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),)
                    ),
                  )

                ],
              ),
            ),



          ),
        ],

      ),
    );







Widget PostItem(cubit,GetPostModel model,GetProfileModel? profilemodel,int index,context,state,bool? IsPost,{double margin = 10})=>
    Card(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),),
  margin: EdgeInsets.symmetric(horizontal: margin),
  //elevation: 20,
  child: Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(14.0),
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

                GestureDetector(
                  onTap: (){
                   cubit.getotherUserProfileData(Id:model.posts![index].user!.id);
                   navigateTo(context, OtherUserProfileScreen(walkieCubit.get(context).getotherUserProfileModel));
                   print("${model.posts![index].user!.fullName}");
                  },
                  child: CircleAvatar(
                    backgroundImage:
                    NetworkImage("${model.posts![index].user!.avatar??defaultAvatar}"),
                    radius: 22.0,
                  ),
                ),





              ],
            ),),
          Padding(
            padding: const EdgeInsets.only(top: 36.0),
            child: Text("${model.posts![index].user!.firstName} ",
              style: TextStyle(
                  fontFamily:"Poppins",
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: bluecolor),),
          ),
          Spacer(),
        ],
      ),
      imageOrVideoOrEmpty(model,index,IsPost),
      Container(
        padding: EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                InkWell(
                    onTap: ()async{
                     await cubit.changeFavorites(model.posts![index].id);
                     print("CHANGED");
                    },
                    onDoubleTap: (){
                      navigateTo(context, FavoriteScreen(model.posts![index].likes));
                    },

                    child: Icon(
                      (cubit.Favorites[model.posts![index].id]) ? Icons.favorite  : Icons.favorite_border_outlined,
                      color: (cubit.Favorites[model.posts![index].id])? orangetextColor:bluecolor,
                      size: 32,

                    )
                ),
                Text("${model.posts![index].likesCount}",
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
                      navigateTo(context, CommentScreen(model.posts![index].comments,model.posts![index].id,true));
                    },

                    child: Container(
                      padding: EdgeInsets.only(bottom: 5,top: 4),
                      child: Image.asset("assets/images/comment.png"),
                    )),
                Text("${model.posts![index].commentsCount}",
                  style: TextStyle(
                      fontFamily:"Poppins",
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: bluecolor),),
              ],
            ),
            SizedBox(width: 10,),
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     InkWell(
            //         onTap: (){
            //           print("helllo comment");
            //         },
            //         // padding: EdgeInsets.all(0.0),
            //         child: Icon(Icons.bookmark_outline,color: bluecolor,size: 30,)),
            //     Text("200 ",
            //       style: TextStyle(
            //           fontFamily:"Poppins",
            //           fontSize: 10,
            //           fontWeight: FontWeight.w400,
            //           color: bluecolor),),
            //   ],
            // ),
            Spacer(),
            InkWell(onTap: (){
              navigateTo(context, LocationScreen());
            },
                child: Icon(Icons.location_on_outlined,color: bluecolor,size: 32,))

          ],),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Row(
              children: [
                Text("${model.posts![index].user!.fullName}  ",
                  style: TextStyle(
                    fontFamily:"Poppins",
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),),
                if (model.posts![index].user!.id.toString() != cubit.myId.toString()) Stack(
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
                          color: cubit.Followings[model.posts![index].user!.id] ? orangetextColor : Colors.white,
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: Center(
                        child:
                        GestureDetector(
                          onTap: (){
                            //print("${cubit.isFollowing}");
                           cubit.changeFollowing(model.posts![index].user!.id);
                           // print(model.posts![index].user!.id);


                          },
                          child: Text("${cubit.Followings[model.posts![index].user!.id] ? "Following" : "Follow"}",
                            style:  TextStyle(
                                fontFamily:"Poppins",
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: cubit.Followings[model.posts![index].user!.id]?whitetextColor:HexColor("#214E8A")
                            ),),
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
                        '${model.posts![index].title}',
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
              ConditionalBuilder(
                condition:  state is! walkieaddCommentLodinglState,
                builder:(context)=>
                   CircleAvatar(
                  radius: 12,
                  backgroundImage:
                  NetworkImage("${profilemodel!.data![0].avatar?? defaultAvatar}"),
                ),
                fallback: (context)=> CircularProgressIndicator() ,
              ),

              GestureDetector(
                onTap: (){
                  navigateTo(context, CommentScreen(model.posts![index].comments,model.posts![index].id,true));
                },
                child: Container(
                  padding: EdgeInsets.only(left: 8.0,top: 10),
                  height: 40,
                  width: 250,

                  child: Text("add comment",style: TextStyle(
                      fontFamily:"Poppins",
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),)
                ),
              )

            ],
          ),
        ),



      ),
    ],

  ),
);

Widget imageOrVideoOrEmpty(model,int index,bool? IsPost){

  if(model.posts![index].imagePath == null){
    if(model.posts![index].videoPath == null){
      return Container(height: 5,width: double.infinity,);
    }else {
      return
        Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        height: 400,
        width: double.infinity,
        decoration: BoxDecoration(
          //  image: DecorationImage(image: AssetImage("assets/images/ismailia.png",),fit: BoxFit.fill),
            borderRadius: BorderRadius.circular(20)
        ),
        child:
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: PostVideo(IsPost,src: model.posts![index].videoPath,)),
      );

    }
  }else{
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      height: 400,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[300],
          image: DecorationImage(image: NetworkImage(model.posts![index].imagePath!,),fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(20)
      ),
      // child:
      // ClipRRect(
      //     borderRadius: BorderRadius.circular(20),
      //     child: Image.network(model.posts![index].imagePath!,fit: BoxFit.fill,)),
    );
  }
}





Widget storyImageOrVideoOrEmpty(GetPostModel? model,int index,context){
  if(model!.posts![index].imagePath == null){
    if(model.posts![index].videoPath == null){
      return Stack(
        children: [
          Container(
            color: Colors.grey[300],
            height: double.infinity,width: double.infinity,
            child: Center(child: Text("${model.posts![index].title}",style: TextStyle(
                fontFamily:"Poppins",
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: orangetextColor),),),
          ),
          Positioned(
            top: 16.0,
              right: 16.0,

              child: InkWell(
                onTap: (){
                  navigateAndFinish(context, HomeLayout());
                },
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.white,
                  child:Icon(Icons.close),
                ),
              ))
        ],
      );
    }else {
      return
        Stack(
          children: [
            Container(
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
                    child: StoryHome(src: model.posts![index].videoPath,)),
      ),
            Positioned(
                top: 16.0,
                right: 16.0,

                child: InkWell(
                  onTap: (){
                    navigateAndFinish(context, HomeLayout());
                  },
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.white,
                    child:Icon(Icons.close),
                  ),
                ))
          ],
        );

    }
  }else{
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[300],
              image: DecorationImage(image: NetworkImage(model.posts![index].imagePath!,),fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(20)
          ),
          // child:
          // ClipRRect(
          //     borderRadius: BorderRadius.circular(20),
          //     child: Image.network(model.posts![index].imagePath!,fit: BoxFit.fill,)),
        ),
        Positioned(
            top: 16.0,
            right: 16.0,

            child: InkWell(
              onTap: (){
                navigateAndFinish(context, HomeLayout());
              },
              child: CircleAvatar(
                radius: 12,
                backgroundColor: Colors.white,
                child:Icon(Icons.close),
              ),
            ))
      ],
    );
  }
}






Widget profileimageOrVideoOrEmpty(GetProfileModel model,int index,bool? IsPost){

  if(model.data![0].posts![index].imagePath == null){
    if(model.data![0].posts![index].videoPath == null){
      return Container(height: 5,width: double.infinity,);
    }else {
      return
        Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        height: 400,
        width: double.infinity,
        decoration: BoxDecoration(
          //  image: DecorationImage(image: AssetImage("assets/images/ismailia.png",),fit: BoxFit.fill),
            borderRadius: BorderRadius.circular(20)
        ),
        child:
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: PostVideo(IsPost,src: model.data![0].posts![index].videoPath,)),
      );

    }
  }else{
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      height: 400,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[300],
          image: DecorationImage(image: NetworkImage(model.data![0].posts![index].imagePath!,),fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(20)
      ),
      // child:
      // ClipRRect(
      //     borderRadius: BorderRadius.circular(20),
      //     child: Image.network(model.posts![index].imagePath!,fit: BoxFit.fill,)),
    );
  }
}



Widget showRcommended(cubit,context){
  return Card(
    margin: EdgeInsets.symmetric(horizontal: 0.0,vertical: 10),
    elevation: 4,
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 14.0),
          child: Row(
            children: [
              Text("Recommended ",
                style: TextStyle(
                  fontFamily:"Poppins",
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: (){
                      navigateTo(context, AllTopCafes());
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
          padding: EdgeInsets.only(bottom: 16.0),
          height: 217,
          child: ListView.separated(
              padding: EdgeInsets.only(left: 14,right: 4),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index)=>RecommendedCafeItem(cubit.getAllBussenesModel,index,cubit,context),
              separatorBuilder: (context,index)=>SizedBox(width: 26,),
              itemCount: cubit.getAllBussenesModel!.data!.length),
        )

      ],

    ),


  );
}

Widget RecommendedCafeItem(GetAllBussenesModel? model,int index,cubit,context){
  return Stack(
    alignment: Alignment.center,
    children: [
      Container(
        width: 157,
        height: 237,
        decoration: BoxDecoration(
          color: HexColor("#214E8A"),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      Container(
        width: 157,
        height: 237,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),),
          margin: EdgeInsets.all(1),
          child: Column(
            children: [
              Container(
                width: 155,
                height: 110,
                decoration: BoxDecoration(
                  // color: HexColor("#214E8A"),
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(image: NetworkImage("${model!.data![index].images}"),fit: BoxFit.fill)
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text("${model.data![index].name}",
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
                      Expanded(
                        child: InkWell(
                          onTap: (){
                            navigateTo(context, BussenesProfileScreen());
                            print(model.data![index].id);
                       cubit.getBusinessesById(model.data![index].id);

                          },
                          child: Container(
                            height: 24,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  //  spreadRadius: 5,
                                  // blurRadius: 7,
                                  offset: Offset(0, 0.5), // changes position of shadow
                                ),
                              ],


                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Details",
                                    style: TextStyle(color: orangetextColor,fontSize: 7),
                                  ),
                                  Icon(Icons.arrow_forward,color: orangetextColor,size: 14,)
                                ],
                              ),
                            ),

                          ),
                        ),
                      )


                    ],
                  ),
                ),
              )

              // SizedBox(height: 100,)




            ],
          ),
        ),
      )
    ],
  );
}




Widget restaurantItem(cubit,commentController)=>Card(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),),
  margin: EdgeInsets.symmetric(horizontal: 10.0),
  //elevation: 20,
  child: Column(
    children: [
      Row(
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
          Text("Mahmoud ",
            style: TextStyle(
                fontFamily:"Poppins",
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: bluecolor),),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Alfanar Restaurant",
                style: TextStyle(
                    fontFamily:"Poppins",
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: HexColor("#214E8A")),),
              Container(
                width: 90,
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
                    fontWeight: FontWeight.w400,
                  ),),
                Container(
                  width: 70,
                  height: 40,
                  child: CustomPaint(
                    painter: painterText(),
                    child: Center(
                      child:
                      TextButton(
                        onPressed: (){},
                        child: Text("Follow",
                          style: TextStyle(
                              fontFamily:"Poppins",
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: HexColor("#214E8A")),),
                      ),
                    ),
                  ),

                ),
              ],
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text("vcvcvnvbnvbnvbnvbnvbnvbnFor YouvFor YouFor YouFor YouFor YouFor YouFor YouFor YouvFor YouFor YouFor YouFor Youl;poiyyrrrredfgvbcdrrevfgtrdcfefsdddhhhhjhjhhhhhhhhhhhetgsdfscsxxd",
                      overflow: TextOverflow.ellipsis,maxLines: cubit.maxlines,),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                          onTap: (){
                            cubit.incresepostlines();
                          },
                          child: Icon(cubit.arrow,size: 28,color: HexColor("#FF5213"),)),
                    ],
                  )
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
);

Widget separatePostItem()=>Card(

  margin: EdgeInsets.symmetric(horizontal: 0.0,vertical: 40),
  elevation: 20,
  child: Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 14.0),
        child: Row(
          children: [
            Text("Recommended ",
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
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16.0),
        child: Row(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 182,
                    height: 237,
                    decoration: BoxDecoration(
                      color: HexColor("#214E8A"),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Container(
                    width: 182,
                    height: 237,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),),
                      margin: EdgeInsets.all(1),

                      child: Column(
                        children: [
                          Container(
                            width: 180,
                            height: 110,
                            decoration: BoxDecoration(
                              // color: HexColor("#214E8A"),
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(image: AssetImage("assets/images/ismailia.png"),fit: BoxFit.fill)
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text("Frio Cafee",
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
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4.0),
                              child: Text(
                                "bnvbnvbntrdcfefsdddhhhhjhjhhhhhhhhhhhetgsdfscsxxd",
                                style: TextStyle(color: bluecolor),
                                overflow: TextOverflow.ellipsis,maxLines: 2,),
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
                                  Expanded(
                                    child: InkWell(
                                      onTap: (){},
                                      child: Container(
                                        height: 24,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey,
                                              //  spreadRadius: 5,
                                              // blurRadius: 7,
                                              offset: Offset(0, 0.5), // changes position of shadow
                                            ),
                                          ],


                                        ),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Details",
                                                style: TextStyle(color: orangetextColor,fontSize: 7),
                                              ),
                                              Icon(Icons.arrow_forward,color: orangetextColor,size: 14,)
                                            ],
                                          ),
                                        ),

                                      ),
                                    ),
                                  )


                                ],
                              ),
                            ),
                          )

                          // SizedBox(height: 100,)




                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(width: 24.0,),
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 182,
                    height: 237,
                    decoration: BoxDecoration(
                      color: HexColor("#214E8A"),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Container(
                    width: 182,
                    height: 237,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),),
                      margin: EdgeInsets.all(1),

                      child: Column(
                        children: [
                          Container(
                            width: 180,
                            height: 110,
                            decoration: BoxDecoration(
                              // color: HexColor("#214E8A"),
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(image: AssetImage("assets/images/ismailia.png"),fit: BoxFit.fill)
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text("Frio Cafee",
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
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4.0),
                              child: Text(
                                "bnvbnvbntrdcfefsdddhhhhjhjhhhhhhhhhhhetgsdfscsxxd",
                                style: TextStyle(color: bluecolor),
                                overflow: TextOverflow.ellipsis,maxLines: 2,),
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
                                  Expanded(
                                    child: InkWell(
                                      onTap: (){},
                                      child: Container(
                                        height: 24,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey,
                                              //  spreadRadius: 5,
                                              // blurRadius: 7,
                                              offset: Offset(0, 0.5), // changes position of shadow
                                            ),
                                          ],


                                        ),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Details",
                                                style: TextStyle(color: orangetextColor,fontSize: 7),
                                              ),
                                              Icon(Icons.arrow_forward,color: orangetextColor,size: 14,)
                                            ],
                                          ),
                                        ),

                                      ),
                                    ),
                                  )


                                ],
                              ),
                            ),
                          )

                          // SizedBox(height: 100,)




                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 30.0,)
    ],

  ),


);



Widget EventItem()=>  Container(

  padding: EdgeInsets.only(bottom: 5),
  height: 200, width: 250,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        //  // tileMode: TileMode.mirror,
        //  // transform: Matrix4.translationValues(x, y, z),
        stops: [
          0.0,
          1.0,
        ],
        colors: [
          startAvatar.withOpacity(0.9),
          endAvatar.withOpacity(0.9),
        ]
    ),
    //shape: BoxShape.circle,

  ),
  child: Column(
    children: [
      Expanded(
        flex: 2,
        child: Container(
          margin: EdgeInsets.all(4.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(image: AssetImage("assets/images/ismailia.png"),fit: BoxFit.fill)


          ),
        ),
      ),
      Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 4.0,horizontal: 10.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text("Cairo Tower ",
                        style: TextStyle(
                            fontFamily:"Poppins",
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white
                        ),
                        overflow: TextOverflow.ellipsis,maxLines: 1,),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Sat jan at 8pm ",
                            style: TextStyle(
                                fontFamily:"Poppins",
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: orangetextColor
                            ),),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text("Elzamalek,Cairo ",
                        style: TextStyle(
                            fontFamily:"Poppins",
                            fontSize: 8.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.white
                        ),
                        overflow: TextOverflow.ellipsis,maxLines: 1,),
                    ),
                    InkWell(
                      onTap: (){},
                      child: Container(
                        margin: EdgeInsets.only(top: 8.0),
                        width: 90,
                        height: 24,
                        decoration: BoxDecoration(
                            color: orangetextColor,
                            borderRadius: BorderRadius.circular(15)

                        ),
                        child: Center(
                          child: Text("Interrested",
                            style: TextStyle(
                                fontFamily:"Poppins",
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.white
                            ),
                            overflow: TextOverflow.ellipsis,maxLines: 1,),),
                      ),
                    )
                  ],)

              ],
            ),

          ))
    ],),);



class CustomTrackShape extends RoundedRectSliderTrackShape {
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double? trackHeight = sliderTheme.trackHeight;
    final double trackLeft = offset.dx;
    final double trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}


Widget changegedButton(bool isCafe){

 return isCafe?  Container(
        width: 60,
        height: 30,
        decoration: BoxDecoration(
            color: orangetextColor,
            borderRadius: BorderRadius.circular(30)
        ),
        child: Center(
          child:
          TextButton(
            onPressed: (){},
            child: Text("Cafe",
              style: TextStyle(
                  fontFamily:"Poppins",
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: Colors.white70),),
          ),
        ),
      ):Container(
     width: 60,
     height: 40,
     child: CustomPaint(
       painter: painterText(),
       child: Center(
         child:
         TextButton(
           onPressed: (){},
           child: Text("Cafe",
             style: TextStyle(
                 fontFamily:"Poppins",
                 fontSize: 10,
                 fontWeight: FontWeight.w400,
                 color: HexColor("#214E8A")),),
         ),
       ),
     ),

   );


}






void shoeToast(
    {
      required String? message,
      required ToastStates state,

    }
    )=>Fluttertoast.showToast(
    msg: message!,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: chooseToasteColor(state),
    textColor: Colors.white,
    fontSize: 16.0
);


enum ToastStates { SUCCESS, WARNING, ERROR }

Color chooseToasteColor(ToastStates state){

  Color color;

  switch(state){
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;

    case ToastStates.ERROR:
      color = Colors.redAccent;
      break;

  }
  return color;

}























