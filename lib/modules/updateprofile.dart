



import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:walki/layout/cubit/cubit.dart';
import 'package:walki/layout/cubit/states.dart';
import 'package:walki/shared/colors/colors.dart';
import 'package:walki/shared/variables.dart';

import '../shared/components/components.dart';

var firstnamecontroller = TextEditingController();
var lastnamecontroller = TextEditingController();
var emailcontroller = TextEditingController();
var phonecontroller = TextEditingController();
var passwordcontroller = TextEditingController();
var biocontroller = TextEditingController();
final formKey = GlobalKey<FormState>();
class UpdateProfile extends StatelessWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);

    return BlocConsumer<walkieCubit,WalkieStates>(
      listener: (context,state){

      if(state is walkieupdateProfileSuccesState){
        if(state.updateProfileModel.success == true){
          shoeToast(message: state.updateProfileModel.message!, state: ToastStates.SUCCESS);


        }
      }},
      builder: (context,state){

        if(walkieCubit.get(context).getProfileModel != null) {

        firstnamecontroller.text =
            walkieCubit.get(context).getProfileModel!.data![0].firstName!;
        lastnamecontroller.text =
            walkieCubit.get(context).getProfileModel!.data![0].lastName!;
        emailcontroller.text =
            walkieCubit.get(context).getProfileModel!.data![0].email!;

        return ConditionalBuilder(
          condition: walkieCubit.get(context).getProfileModel != null,
          builder: (context) => GestureDetector(
            onTap: () {
              if (!currentFocus.hasPrimaryFocus) {
                //cubit.ChangeAddPostUI(!currentFocus.hasPrimaryFocus);
                currentFocus.unfocus();
              }
            },
            child: Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(0.0),
                child: AppBar(
                  elevation: 0,
                ),
              ),
              body: ConditionalBuilder(
                condition: walkieCubit.get(context).getProfileModel != null,
                builder: (context) => SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 233,
                              //color: Colors.cyan,
                            ),
                            Container(
                              width: double.infinity,
                              height: 188,
                              decoration: BoxDecoration(
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
                                    bluecolor,
                                    orangetextColor.withOpacity(0.8),
                                  ])),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 16.0),
                                        child: IconButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            icon: Image.asset(
                                                "assets/images/Vector.png")),
                                      ),
                                      Spacer(),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              right: 16.0),
                                          child: IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.share_outlined,
                                                  size: 25,
                                                  color: Colors.white70)))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 8.0,
                              left: MediaQuery.of(context).size.width / 2.55,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 48,
                                    backgroundColor: HexColor("#FFFFFF"),
                                  ),
                                  if (walkieCubit.get(context).avatarImage !=
                                      null)
                                    CircleAvatar(
                                      radius: 45,
                                      backgroundImage: FileImage(walkieCubit
                                          .get(context)
                                          .avatarImage!),
                                      // child:(walkieCubit.get(context).isAvatar)?
                                      // Image.file(walkieCubit.get(context).avatarImage!)
                                      // : Image.network("${walkieCubit.get(context).getProfileModel!.data![0].avatar ?? defaultAvatar}"),
                                    ),
                                  if (walkieCubit.get(context).avatarImage ==
                                      null)
                                    CircleAvatar(
                                      radius: 45,
                                      backgroundImage: NetworkImage(
                                          "${walkieCubit.get(context).getProfileModel!.data![0].avatar ?? defaultAvatar}"),
                                      // child:(walkieCubit.get(context).isAvatar)?
                                      // Image.file(walkieCubit.get(context).avatarImage!)
                                      // : Image.network("${walkieCubit.get(context).getProfileModel!.data![0].avatar ?? defaultAvatar}"),
                                    ),
                                  Positioned(
                                      bottom: 2,
                                      right: 3,
                                      child: IconButton(
                                        onPressed: () {
                                          showModalBottomSheet(
                                              context: context,
                                              builder: (context) => Container(
                                                    height: 200,
                                                    width: double.infinity,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        IconButton(
                                                            onPressed:
                                                                () async {
                                                              Map<Permission,
                                                                      PermissionStatus>
                                                                  statuses =
                                                                  await [
                                                                Permission
                                                                    .storage,
                                                                Permission
                                                                    .camera,
                                                              ].request();
                                                              if (statuses[Permission
                                                                          .storage]!
                                                                      .isGranted &&
                                                                  statuses[Permission
                                                                          .camera]!
                                                                      .isGranted) {
                                                                walkieCubit
                                                                    .get(
                                                                        context)
                                                                    .avatarImgFromGallery();
                                                              } else {
                                                                print(
                                                                    'no permission provided');
                                                              }
                                                            },
                                                            icon: Icon(
                                                              Icons
                                                                  .add_photo_alternate_rounded,
                                                              color: HexColor(
                                                                  "#279500"),
                                                            )),
                                                        IconButton(
                                                            onPressed:
                                                                () async {
                                                              Map<Permission,
                                                                      PermissionStatus>
                                                                  statuses =
                                                                  await [
                                                                Permission
                                                                    .storage,
                                                                Permission
                                                                    .camera,
                                                              ].request();
                                                              if (statuses[Permission
                                                                          .storage]!
                                                                      .isGranted &&
                                                                  statuses[Permission
                                                                          .camera]!
                                                                      .isGranted) {
                                                                walkieCubit
                                                                    .get(
                                                                        context)
                                                                    .avatarImgFromCamera();
                                                              } else {
                                                                print(
                                                                    'no permission provided');
                                                              }
                                                            },
                                                            icon: Icon(
                                                              Icons.camera_alt,
                                                              color: HexColor(
                                                                  "#214E8A"),
                                                            )),
                                                      ],
                                                    ),
                                                  ));
                                        },
                                        icon: Icon(
                                          Icons.add_a_photo,
                                          color: Colors.black,
                                        ),
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                        ConditionalBuilder(
                          condition: state is! walkieupdateProfileLodinglState,
                          builder: (context) => GestureDetector(
                            onTap: () {
                              print("Change Picture");
                              walkieCubit.get(context).updateProfilePhoto(
                                  first_name: firstnamecontroller.text,
                                  last_name: lastnamecontroller.text,
                                  avatar: walkieCubit.get(context).avatarImage,
                                  email: emailcontroller.text);
                            },
                            child: Text(
                              "Change Picture",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                //color: bluecolor,
                              ),
                            ),
                          ),
                          fallback: (context) => LinearProgressIndicator(),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "First Name",
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: bluecolor,
                                  ),
                                ),
                              ),
                              Container(
                                height: 55,
                                child: updateProfiledefaultFormfield(
                                    controller: firstnamecontroller,
                                    type: TextInputType.text,
                                    hint:
                                        "${walkieCubit.get(context).getProfileModel!.data![0].firstName ?? " "}",
                                    validate: (value) {
                                      if (value.isEmpty) {
                                        return "your first name is too short";
                                      }
                                      if (value.toString().length >= 11) {
                                        return "mustn't be more than ten letters";
                                      }
                                      return null;
                                    }),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Last Name",
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: bluecolor,
                                  ),
                                ),
                              ),
                              Container(
                                height: 55,
                                child: updateProfiledefaultFormfield(
                                    controller: lastnamecontroller,
                                    type: TextInputType.text,
                                    hint:
                                        "${walkieCubit.get(context).getProfileModel!.data![0].lastName ?? " "}",
                                    validate: (value) {
                                      if (value.isEmpty) {
                                        return "your last name is too short";
                                      }
                                      return null;
                                    }),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Email ID",
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: bluecolor,
                                  ),
                                ),
                              ),
                              Container(
                                height: 55,
                                child: updateProfiledefaultFormfield(
                                    controller: emailcontroller,
                                    type: TextInputType.text,
                                    hint:
                                        "${walkieCubit.get(context).getProfileModel!.data![0].email ?? " "}",
                                    validate: (value) {
                                      if (value.isEmpty) {
                                        return "your email is too short";
                                      }
                                      return null;
                                    }),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Phone Number",
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: bluecolor,
                                  ),
                                ),
                              ),
                              Container(
                                height: 55,
                                child: updateProfiledefaultFormfield(
                                  controller: phonecontroller,
                                  type: TextInputType.text,
                                  hint:
                                      "${walkieCubit.get(context).getProfileModel!.data![0].phone ?? "no phone"}",
                                  // validate: (value){
                                  //
                                  // }
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Password",
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: bluecolor,
                                  ),
                                ),
                              ),
                              Container(
                                height: 55,
                                child: updateProfiledefaultFormfield(
                                    controller: passwordcontroller,
                                    type: TextInputType.text,
                                    hint: "....",
                                    validate: (value) {
                                      if (value.isEmpty) {
                                        return "your password is too short";
                                      }
                                      return null;
                                    }),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Bio",
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: bluecolor,
                                  ),
                                ),
                              ),
                              Container(
                                height: 55,
                                child: updateProfiledefaultFormfield(
                                  controller: biocontroller,
                                  type: TextInputType.text,
                                  hint:
                                      "${walkieCubit.get(context).getProfileModel!.data![0].bio ?? "no bio"}",
                                  // validate: (value){
                                  //   if(value.isEmpty){
                                  //     return "your bio is too short";
                                  //   }
                                  //   return null;
                                  // }
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Gender",
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: bluecolor,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 56,
                                  child: DropdownButtonFormField(
                                    isExpanded: true,
                                    validator: (v) {
                                      if (v!.toString().isEmpty) {
                                        return "chose gender";
                                      }
                                    },
                                    hint: Text(
                                        "${walkieCubit.get(context).selectedgenderItem ?? "gender"}"),
                                    value: walkieCubit
                                        .get(context)
                                        .selectedgenderItem,
                                    icon: const Icon(Icons.keyboard_arrow_down),
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black),
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        borderSide: BorderSide(
                                          color: bluecolor,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        borderSide: BorderSide(
                                          color: bluecolor,
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    items: walkieCubit
                                        .get(context)
                                        .genderItem
                                        .map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(items),
                                      );
                                    }).toList(),
                                    onChanged: (String? item) {
                                      walkieCubit
                                          .get(context)
                                          .changeselectedgenderItem(item);
                                      print(walkieCubit
                                          .get(context)
                                          .selectedgenderItem);
                                    },
                                  ),
                                ),
                              ],
                            )),
                        SizedBox(
                          height: 60,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: ConditionalBuilder(
                            condition:
                                state is! walkieupdateProfileLodinglState,
                            builder: (context) => defaultButton(
                                text: 'Update',
                                function: () {
                                  // if(formKey.currentState!.validate()){
                                  walkieCubit.get(context).updateProfile(
                                      first_name: firstnamecontroller.text,
                                      last_name: lastnamecontroller.text,
                                      bio: biocontroller.text,
                                      email: emailcontroller.text,
                                      //address: addr,
                                      phone: phonecontroller.text,
                                      gender: walkieCubit
                                          .get(context)
                                          .selectedgenderItem);
                                  //  }
                                }),
                            fallback: (context) => Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
                fallback: (context) => Column(
                  children: [
                    Center(
                      child: Text(
                        "Please wait",
                        style: TextStyle(color: orangetextColor, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          fallback: (context) => Center(
            child: CircularProgressIndicator(),
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
            body: Center(child: CircularProgressIndicator(),),
          );
        }
    }
    );
  }
}


