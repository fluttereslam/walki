import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:walki/modules/login/login.dart';
import 'package:walki/modules/registar/cubit/states.dart';
import 'package:walki/shared/components/components.dart';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:walki/shared/network/local/cashe_helper.dart';
import 'package:walki/shared/variables.dart';



import '../hi_sir.dart';
import 'cubit/cubit.dart';
class SignUp extends StatelessWidget {
// const HomeLayout({Key? key}) : super(key: key);
  Color start = HexColor("#214E8A").withOpacity(0.99);//.withAlpha(250);//.withOpacity(0.9);
  Color end = HexColor("#FD5B1F").withOpacity(0.66);//.withOpacity(0.7);
  var firstnamecontroller = TextEditingController();
  var lastnamecontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var paswordcontroller = TextEditingController();
  bool isPassword = true;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context) => walkieRegistarCubit(),
      child: BlocConsumer<walkieRegistarCubit,RegistarStates>(
         listener: (context,state){
           if (state is  walkieRegistarSuccessgState) {
             if (state.Registarmodel.success == true) {
               caheHelper.saveData(key: "token", value: "Bearer ${state.Registarmodel.data!.token}").then((value) {
                 token = "Bearer ${state.Registarmodel.data!.token}";
                 caheHelper.saveData(key: "myId", value: "${state.Registarmodel.data!.id}").then((value) {
                   print("${state.Registarmodel.data!.token!}");
                   navigateTo(context, HiSir());
                 });

               });
               shoeToast(message: state.Registarmodel.message!, state: ToastStates.SUCCESS);
               print(state.Registarmodel.message);
               print("Bearer ${state.Registarmodel.data!.token}");

             }
             else {
                 shoeToast(
                     message: state.Registarmodel.message, state: ToastStates.ERROR);
              //   print(state.Registarmodel.message);

              print("*****************   ERROR   *************");
             }
           }
         },
         builder: (context,state){
           return Scaffold(
             // backgroundColor: Decoration(BoxDecoration()),
               appBar: PreferredSize(
                 preferredSize: Size.fromHeight(20.0),
                 child: AppBar(
                   titleSpacing: 18,
                   leading: MaterialButton(onPressed: () {
                     navigateTo(context,Log_in());
                   },
                     child: Image.asset("assets/images/Vector.png"),
                   ),
                   elevation: 0,

                 ),

               ),

               body: SingleChildScrollView(
                 //physics: NeverScrollableScrollPhysics(),
                 child: Container(
                   padding: EdgeInsets.all(20),
                   //  width: MediaQuery.of(context).size.width,
                   //height: MediaQuery.of(context).size.height,
                   decoration: BoxDecoration(
                     //gradient: RadialGradient(colors: colors)
                       gradient: LinearGradient(
                           begin: Alignment.topCenter,
                           end: Alignment.bottomCenter,
                           //  // tileMode: TileMode.mirror,
                           //  // transform: Matrix4.translationValues(x, y, z),
                           stops: [

                             0.1,1.0,

                           ],
                           colors: [
                             //Colors.blue,

                             //Colors.orange,
                             start,end,


                           ]
                       )
                   ),
                   child: Form(
                     key: formKey,
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         //SizedBox(height:  MediaQuery.of(context).size.height/30,),
                         Row(
                           mainAxisAlignment:MainAxisAlignment.center,
                           children: [
                             Text("Wa",style: TextStyle(fontFamily:"Poppins",fontSize: 50,fontWeight: FontWeight.w400,color: HexColor("#FFFFFF")),),
                             Text("l",style: TextStyle(fontFamily:"Poppins",fontSize: 50,fontWeight: FontWeight.w400,color: HexColor("#FD5B1F")),),
                             Text("k",style: TextStyle(fontFamily:"Poppins",fontSize: 50,fontWeight: FontWeight.w400,color: HexColor("#FFFFFF")),),
                             Text("i",style: TextStyle(fontFamily:"Poppins",fontSize: 50,fontWeight: FontWeight.w400,color: HexColor("#FD5B1F")),),
                             Text("e",style: TextStyle(fontFamily:"Poppins",fontSize: 50,fontWeight: FontWeight.w400,color: HexColor("#FFFFFF")),),

                           ],),
                         SizedBox(height:  MediaQuery.of(context).size.height/30,),
                         Text(
                           "Create New Account",textAlign:TextAlign.left ,style: TextStyle(color: Colors.white,fontSize: 25.0,fontFamily: "Poppins"),),
                         SizedBox(height: 10.0,),
                         Row(
                           children: [
                             Text("Already a member?",style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.w400,fontFamily: "Poppins"),),

                             InkWell(
                                 onTap:(){
                                   Navigator.pop(context);
                                 },
                                 child: Text("Login",style: TextStyle(color: HexColor("#FD5B1F"),fontSize: 10,fontWeight: FontWeight.w400,fontFamily: "Poppins"),)),

                           ],),
                         // SizedBox(height:  MediaQuery.of(context).size.height/20,),

                         SizedBox(height:MediaQuery.of(context).size.height/11,),

                         defaultFormfield(
                           controller: firstnamecontroller,
                           type: TextInputType.name,
                           validate: (value){
                             if(value.isEmpty){
                               return "your first name is too short";
                             }
                             return null;
                           },
                           label: "First Name", ),
                         SizedBox(height: 24,),
                         defaultFormfield(
                           controller: lastnamecontroller,
                           type: TextInputType.name,
                           validate: (value){
                             if(value.isEmpty){
                               return "your last name is too short";
                             }
                             return null;
                           },
                           label: "Last Name",
                         ),
                         SizedBox(height: 24,),
                         defaultFormfield(
                           controller: emailcontroller,
                           type: TextInputType.emailAddress,
                           validate: (value){if(value.isEmpty){
                             return "your email is too short";
                           }
                           return null;},
                           label: "Email", ),
                         SizedBox(height: 24,),
                         defaultFormfield(
                             isPassword:   walkieRegistarCubit.get(context).isPassword,
                             SuffixPressed: (){
                               walkieRegistarCubit.get(context).changevisibility();
                             },
                             controller: paswordcontroller,
                             type: TextInputType.text,
                             validate: (value){
                               if(value.isEmpty){
                                 return "your passwor is too short";
                               }
                               return null;
                             },
                             label: "Password",
                             suffix: walkieRegistarCubit.get(context).suffixIc),
                         SizedBox(height: 32,),

                         ConditionalBuilder(
                           condition: state is! walkieRegistarLodinglState,
                           builder: (context)=>defaultButton(
                               function: (){
                                 if(formKey.currentState!.validate()){
                                   walkieRegistarCubit.get(context).userRegistar(
                                       email: emailcontroller.text,
                                       password: paswordcontroller.text,
                                       fname: firstnamecontroller.text,
                                       lname: lastnamecontroller.text);

                                   //print("you can sighn up now");
                                 }

                               },
                               background: HexColor("#214E8A"),
                               text: "Sign Up"
                           ),
                           fallback: (context)=>Center(child: CircularProgressIndicator()),
                         ),
                         SizedBox(height: 15.0,),

                         Row(
                           children: [

                             Container(
                               padding: EdgeInsets.only(left: 60.0),
                               width: MediaQuery.of(context).size.width/2.6,
                               child: Divider(
                                 thickness: 2.0,
                                 height: 1.0,
                                 color: Colors.white,
                               ),
                             ),
                             SizedBox(width: 8.0,),
                             Text("OR",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400,fontFamily: "Poppins"),),
                             SizedBox(width: 8.0,),
                             Container(
                               padding: EdgeInsets.only(right: 60.0),
                               width: MediaQuery.of(context).size.width/2.6,
                               child: Divider(
                                 thickness: 2.0,
                                 height: 1.0,
                                 color: Colors.white,
                               ),
                             ),
                           ],
                         ),
                         SizedBox(height: 26.0,),
                         Row(
                           children: [
                             Container(
                               padding: EdgeInsets.only(left: 60.0),
                               //width: MediaQuery.of(context).size.width/2.6,
                               child:
                               Text(
                                 "Sign Up With",textAlign:TextAlign.left ,style: TextStyle(color: Colors.white,fontSize: 14,fontFamily: "Poppins"),),

                             ),
                             SizedBox(width: 26.0),
                             InkWell(
                               onTap: (){},
                               child: CircleAvatar(
                                   backgroundColor: Colors.white,
                                   radius: 10,
                                   backgroundImage: AssetImage("assets/images/facee.png")),
                             ),
                             SizedBox(width: 12.0),
                             InkWell(
                               onTap: (){},
                               child: CircleAvatar(
                                   backgroundColor: Colors.orange,
                                   radius: 12,
                                   backgroundImage: AssetImage("assets/images/google.png",)),
                             ),// Image.asset("assets/images/facebook.png")),


                           ],),
                       ],
                       // child: Text("walkie",style:TextStyle(fontSize: 30,fontFamily: "Poppins"),),
                     ),
                   ),
                 ),
               )



           );
         },
      ),
    );
  }
}