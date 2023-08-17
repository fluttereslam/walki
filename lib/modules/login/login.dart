import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:walki/modules/login/cubit/states.dart';
import 'package:walki/modules/registar/sighnup.dart';
import 'package:walki/shared/colors/colors.dart';
import 'package:walki/shared/components/components.dart';
import 'package:walki/shared/network/local/cashe_helper.dart';
import 'package:walki/shared/variables.dart';
import '../hi_sir.dart';
import 'cubit/cubit.dart';
class Log_in extends StatelessWidget {
// const HomeLayout({Key? key}) : super(key: key);
Color start = HexColor("#214E8A").withOpacity(0.99);//.withAlpha(250);//.withOpacity(0.9);
Color end = HexColor("#FD5B1F").withOpacity(0.66);//.withOpacity(0.7);
var emailcontroller = TextEditingController();
var passwordcontroller = TextEditingController();
final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context)=>walkieLoginCubit(),
      child: BlocConsumer<walkieLoginCubit,walkieLoginStates>(
        listener: (context,state){

          if(state is walkieLoginSuccessgState){
            if(state.loginmodel.success == true){
              caheHelper.saveData(key: "token", value: "Bearer ${state.loginmodel.data!.token}").then((value) {
                token = "Bearer ${state.loginmodel.data!.token}";
                caheHelper.saveData(key: "myId", value: "${state.loginmodel.data!.id}").then((value) {
                  print("${state.loginmodel.data!.token!}");
                  navigateTo(context, HiSir());
                });

              });
              shoeToast(message: state.loginmodel.message!, state: ToastStates.SUCCESS);
              print(state.loginmodel.message);
              print("Bearer ${state.loginmodel.data!.token}");

            } else{

              shoeToast(message: state.loginmodel.message!, state: ToastStates.ERROR);
              print(state.loginmodel.message);

            }}
        },

        builder:(context,state)=> Scaffold(
          appBar: AppBar(
           leading: MaterialButton(onPressed: () {  },
            //child: Image.asset("assets/images/Vector.png"),
           ),
            elevation: 0,


          ),

          body: Container(
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
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

                    start,end,


                  ]
              )
            ),

            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                   // SizedBox(height:  MediaQuery.of(context).size.height/60,),
                    Row(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                      Text("Wa",style: TextStyle(fontFamily:"Poppins",fontSize: 50,fontWeight: FontWeight.w400,color: HexColor("#FFFFFF")),),
                      Text("l",style: TextStyle(fontFamily:"Poppins",fontSize: 50,fontWeight: FontWeight.w400,color: HexColor("#FD5B1F")),),
                      Text("k",style: TextStyle(fontFamily:"Poppins",fontSize: 50,fontWeight: FontWeight.w400,color: HexColor("#FFFFFF")),),
                      Text("i",style: TextStyle(fontFamily:"Poppins",fontSize: 50,fontWeight: FontWeight.w400,color: HexColor("#FD5B1F")),),
                      Text("e",style: TextStyle(fontFamily:"Poppins",fontSize: 50,fontWeight: FontWeight.w400,color: HexColor("#FFFFFF")),),

                    ],),
                    SizedBox(height:  MediaQuery.of(context).size.height/9,),
                    Row(children: [
                      Text("Need An Account?"
                      , style: TextStyle(color: Colors.white,fontSize: 12,fontFamily: "Poppins",fontWeight: FontWeight.w400),
                      ),
                      TextButton(
                        onPressed: (){
                          navigateTo(context,SignUp());
                        },
                        child: Text("Register"
                        , style: TextStyle(color: orangetextColor,fontSize: 12,fontFamily: "Poppins",fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],),
                    SizedBox(height: 10,),

                    defaultFormfield(
                       controller: emailcontroller,
                       type: TextInputType.emailAddress,
                       validate: (value){
                         if(value.isEmpty){
                           return "your name is too short";
                         }
                         return null;
                       },
                       label: "email", ),
                    SizedBox(height: 24,),
                    defaultFormfield(
                        SuffixPressed:(){walkieLoginCubit.get(context).changevisibility();},
                      isPassword: walkieLoginCubit.get(context).isPassword,
                      controller: passwordcontroller,
                      type: TextInputType.name,
                      validate: (value){
                        if(value.isEmpty){
                          return "your password is too short";
                        }
                        return null;
                      },
                      label: "password",

                    suffix: walkieLoginCubit.get(context).suffixIc),
                    SizedBox(height: 32,),

                    ConditionalBuilder(
                      condition: state is! walkieLoginLodinglState,
                      builder: (context)=>defaultButton(function: (){
                        if(formKey.currentState!.validate()){
                          walkieLoginCubit.get(context).userLogin(
                              email: emailcontroller.text,
                              password: passwordcontroller.text);
                        }

                         },
                          background: HexColor("#214E8A"),
                          text: "Sign in",
                      ),
                      fallback: (context)=>Center(child: CircularProgressIndicator(),),
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
                            "Log in With",textAlign:TextAlign.left ,
                            style: TextStyle(color: Colors.white,fontSize: 14,fontFamily: "Poppins"),
                          ),

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



        ),
      ),
    );
  }
}



