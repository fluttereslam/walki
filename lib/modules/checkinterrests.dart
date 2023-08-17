import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:walki/layout/cubit/cubit.dart';
import 'package:walki/layout/cubit/states.dart';
import 'package:walki/shared/colors/colors.dart';
import 'package:walki/shared/components/components.dart';

import '../layout/home_layout.dart';

class CheckInterrests extends StatelessWidget {
  const CheckInterrests({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();



    final formKey = GlobalKey<FormState>();

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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: IconButton(
                    onPressed: (){
                     // Navigator.pop(context);
                    }, icon: Image.asset("assets/images/Vector.png")),
              ),
              SizedBox(height: 40,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                width: 280,
                height: 70,
                child:  Text("Which Type of things you interrest most?",style: TextStyle(
                  fontFamily:"Poppins",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: bluecolor
                ))
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 18.0),
                width: 250,
                height: 50,
                child:  Text("select types of things or places you would like to go.",style: TextStyle(
                  fontFamily:"Poppins",
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: bluecolor
                ))
              ),
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 120,
                    child: Card(

                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),),
                      margin: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0,left: 16),
                            child: Text("what city would you like to visit?",style: TextStyle(
                            fontFamily:"Poppins",
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            ),),
                          ),
                          SizedBox(height: 25.0,),
                        ],
                      ),

                    ),
                  ),
                  Positioned(
                      bottom: 0.0,
                      left: 32.0,
                      right: 32.0,
                      child: Form(
                        key: formKey,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),),
                          child: DropdownButtonFormField(
                            isExpanded: true,
                            hint: Text(
                                "${walkieCubit.get(context).selectedplaceItem ?? "Ismaiilia"}"),
                            value: walkieCubit
                                .get(context)
                                .selectedplaceItem,
                           // icon: const Icon(Icons.keyboard_arrow_down),
                            style: TextStyle(
                                fontSize: 16, color: Colors.black),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(30.0),
                                borderSide: BorderSide(
                                  color: whitetextColor,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(30.0),
                                borderSide: BorderSide(
                                  color: whitetextColor,
                                  width: 1.0,
                                ),
                              ),
                            ),
                            items: walkieCubit
                                .get(context)
                                .placeItem
                                .map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? item) {
                              walkieCubit
                                  .get(context)
                                  .changeselectedplaceItem(item);
                              print(walkieCubit
                                  .get(context)
                                  .selectedplaceItem);
                            },
                          ),
                        ),
                      )
                  )
                ],
              ),
              Card(

                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),),
                margin: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0,left: 16),
                      child: Text("What Places Do You Want To Go?",style: TextStyle(
                        fontFamily:"Poppins",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),),
                    ),
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Radio(
                            value: 1,
                            groupValue: walkieCubit.get(context).restorcafe,
                            onChanged: (value){
                              walkieCubit.get(context).changeRadioValue(value);
                            }),
                        Text("restaurants",style: TextStyle(
                          fontFamily:"Poppins",
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        )),
                        SizedBox(width: 8,),
                        Radio(
                            value: 2,
                            groupValue: walkieCubit.get(context).restorcafe,
                            onChanged: (value){
                              walkieCubit.get(context).changeRadioValue(value);

                            }),
                        Text("cafe",style: TextStyle(
                          fontFamily:"Poppins",
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        )),
                        SizedBox(width: 8,),
                        Radio(
                            value: 3,
                            groupValue: walkieCubit.get(context).restorcafe,
                            onChanged: (value){
                              walkieCubit.get(context).changeRadioValue(value);

                            }),
                        Text("other",style: TextStyle(
                          fontFamily:"Poppins",
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        )),
                        Container(
                          width: 30,
                          padding: EdgeInsets.only(top: 10),
                          child: Divider(
                            height: 1.5,
                            thickness: 1.5,
                          ),
                        )
                      ],
                    )
                  ],
                ),

              ),
              Card(

                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),),
                margin: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0,left: 16),
                      child: Text("What Places Do You Want To Go?",style: TextStyle(
                        fontFamily:"Poppins",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),),
                    ),
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Radio(
                            value: 1,
                            groupValue: walkieCubit.get(context).expensivorcheep,
                            onChanged: (value){
                              walkieCubit.get(context).changeRadioEXorCHValue(value);
                            }),
                        Text("expensive",style: TextStyle(
                          fontFamily:"Poppins",
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        )),
                        SizedBox(width: 8,),
                        Radio(
                            value: 2,
                            groupValue: walkieCubit.get(context).expensivorcheep,
                            onChanged: (value){
                              walkieCubit.get(context).changeRadioEXorCHValue(value);

                            }),
                        Text("cheep",style: TextStyle(
                          fontFamily:"Poppins",
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        )),
                        SizedBox(width: 8,),
                        Radio(
                            value: 3,
                            groupValue: walkieCubit.get(context).expensivorcheep,
                            onChanged: (value){
                              walkieCubit.get(context).changeRadioEXorCHValue(value);

                            }),
                        Text("both",style: TextStyle(
                          fontFamily:"Poppins",
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        )),

                      ],
                    )
                  ],
                ),

              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 16.0),
                child: defaultButton(
                    function: (){

                        navigateTo(context,HomeLayout());


                    },
                    text: "sign in"),
              )

            ],
          ),
        ),

      ),
    );
  }
}

