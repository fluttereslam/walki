import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:walki/layout/cubit/cubit.dart';
import 'package:walki/layout/cubit/states.dart';
import 'package:walki/models/get_all_bussenes.dart';
import 'package:walki/shared/components/components.dart';

import '../shared/colors/colors.dart';
import 'busseness_profile.dart';

class AllTopCafes extends StatelessWidget {
  const AllTopCafes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double titlepadding = MediaQuery.of(context).size.width*0.16;
    return BlocConsumer<walkieCubit,WalkieStates>(
        listener:(context,state){},
      builder:(context,state)=> Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(0.0),
          child: AppBar(
            elevation: 0,
          ),
        ),
        body:  ConditionalBuilder(
          condition: walkieCubit.get(context).getAllBussenesModel !=null,
          builder: (context)=>
           SingleChildScrollView(
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
                        padding:  EdgeInsets.only(top: 4.0,left: titlepadding),
                        child: Text("Top Cafes",
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
                Container(
                  child: GridView.count(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 14.0,
                    crossAxisSpacing: 14.0,
                    childAspectRatio: 1/1.3,
                    children: List.generate(
                        walkieCubit.get(context).getAllBussenesModel!.data!.length,
                            (index) =>TopCafetItem(walkieCubit.get(context).getAllBussenesModel,index,walkieCubit.get(context),context)),
                  ),
                ),

              ],
            ),
          ),
          fallback: (context)=>Center(child: CircularProgressIndicator(),),
        ),
      ),
    );
  }
}


Widget TopCafetItem(GetAllBussenesModel? model,int index,cubit,context){
  return Container(
    width: double.infinity,
    height: 237,
    decoration: BoxDecoration(
      color: HexColor("#214E8A"),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),),
          margin: EdgeInsets.all(1),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 110,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text("${model!.data![index].name}",
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
              ),
              // Expanded(
              //   child: Container(
              //     padding:  EdgeInsets.symmetric(horizontal: 4.0),
              //     child: Text(
              //       "bnvbnvbntrdcfefsdddhhhhjhjhhhhhhhhhhhetgsdfscsxxdcccccccccccccccccccccccccccccccccccccccccccc",
              //       style: TextStyle(color: bluecolor,),
              //     ),
              //
              //   ),
              // ),
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
                      ),



                    ],
                  ),
                ),
              ),


              // SizedBox(height: 100,)




            ],
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            width: double.infinity,
            height: 110,
            decoration: BoxDecoration(
              // color: HexColor("#214E8A"),
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(image: NetworkImage("${model.data![index].images}"),fit: BoxFit.fill)
            ),
          ),
        ),
      ],
    ),
  );
}