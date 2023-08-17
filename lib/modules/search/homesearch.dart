
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:walki/layout/cubit/cubit.dart';
import 'package:walki/layout/cubit/states.dart';
import 'package:walki/models/searsh_model.dart';
import 'package:walki/modules/busseness_profile.dart';
import 'package:walki/shared/colors/colors.dart';
import 'package:walki/shared/components/components.dart';

var searchController = TextEditingController();

class HomeSearch extends StatelessWidget {
  const HomeSearch({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<walkieCubit,WalkieStates>(
      listener: (context,state){

      },
        builder: (context,state)=>Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(0.0),
          child: AppBar(
            elevation: 0,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  margin: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: HexColor("#000000").withOpacity(0.07),
                        spreadRadius: 6,
                        blurRadius: 20,
                        offset: Offset(0,5)
                      )
                    ]
                  ),
                  child: TextFormField(
                    maxLines: 1,
                    controller:searchController,
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                      prefixIcon: IconButton(
                        onPressed: (){
                         walkieCubit.get(context).searchInApp(search: searchController.text);
                        },
                          icon: Icon(Icons.search,size: 30,color: HexColor("#000000"),)),
                      contentPadding: EdgeInsets.only(left: 10,top: 6),
                      hintText: "What you like to search?",
                      border: InputBorder.none,


                    ),

                  ),
                ),
                // SizedBox(height: 18.0,),
                // Padding(
                //   padding: const EdgeInsets.only(left: 24.0),
                //   child: Text("Your search history",
                //     style: TextStyle(
                //         fontFamily:"Poppins",
                //         fontSize: 16,
                //         fontWeight: FontWeight.w600,
                //
                //     ),
                //     overflow: TextOverflow.ellipsis,maxLines: 1,),
                // ),
                // SizedBox(height: 18.0,),
                // Container(
                //   height: 50,
                //   child:
                //   ListView.separated(
                //     padding: EdgeInsets.only(left: 24.0),
                //      shrinkWrap: true,
                //       scrollDirection: Axis.horizontal,
                //       itemBuilder: (context,index)=>SearchHistoryItem(),
                //       separatorBuilder: (context,index)=>SizedBox(width: 4.0,),
                //       itemCount: 4),
                // ),
                SizedBox(height: 40.0,),
               ShowResult(context,walkieCubit.get(context).searchModel,state)
              ],
            ),
          ),
        ),



      ),
    );
  }
}
Widget SearchHistoryItem(){
  return Card(
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(32),),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text("search",
          style: TextStyle(
            fontFamily:"Poppins",
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: bluecolor

          ),
          overflow: TextOverflow.ellipsis,maxLines: 1,),
      ),
    ),
  );
}
Widget ShowResult(context,SearchModel? model,state){
  return ConditionalBuilder(
    condition: walkieCubit.get(context).searchModel != null && state is! walkieSearchLodinglState,
    builder:(context) =>Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: HexColor("#000000").withOpacity(0.07),
                spreadRadius: 0,
                blurRadius: 29,
                offset: Offset(0,4)
            )
          ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0,left: 24.0),
            child: Text("Browse by category",
              style: TextStyle(
                fontFamily:"Poppins",
                fontSize: 16,
                fontWeight: FontWeight.w600,

              ),
              overflow: TextOverflow.ellipsis,maxLines: 1,),
          ),
          GridView.count(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 16.0,
            childAspectRatio: 1/1.449,
            children: List.generate(
                model!.data!.length,
                    (index) =>CatigoryItem(model,index,context)
            ),
          ),
        ],
      ),

    ),
    fallback: (context) =>LinearProgressIndicator(),
  );
}

Widget CatigoryItem(SearchModel? model,index,context){
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      InkWell(
        onTap: (){
          navigateTo(context, BussenesProfileScreen());

          walkieCubit.get(context).getBusinessesById(model!.data![index].id);
        },
        child: Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(image: NetworkImage("${model!.data![index].images}"),fit: BoxFit.fill)

          ),
        ),
      ),
      SizedBox(height: 6.0,),
      Expanded(
        child: Text("${model.data![index].name}",
          style: TextStyle(
              fontFamily:"Poppins",
              fontSize: 14,
              fontWeight: FontWeight.w400,
          ),
          ),
      ),
    ],
  );
}