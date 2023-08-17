import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../shared/colors/colors.dart';
var searchController = TextEditingController();

class GridResSearch extends StatelessWidget {
  const GridResSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
             Row(children: [
               IconButton(
                   onPressed: (){
                     // Navigator.pop(context);
                   }, icon: Image.asset("assets/images/Vector.png")),
               Expanded(
                 child: Container(
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
                     onTap: (){
                       print("Hellow gayyes in search");
                     },
                     maxLines: 1,

                     controller:searchController,
                     cursorColor: Colors.grey,
                     decoration: InputDecoration(
                       suffixIcon: Icon(Icons.dangerous_rounded,size: 30,color: orangetextColor,),
                       contentPadding: EdgeInsets.only(left: 10,top: 6),
                       hintText: "What you like to search?",
                       border: InputBorder.none,


                     ),

                   ),
                 ),
               ),
             ],),
             Text("100 product found",
               style: TextStyle(
                 fontFamily:"Poppins",
                 fontSize: 18,
                 fontWeight: FontWeight.w600,

               ),
             ),
              SizedBox(height: 16.0,),
              Container(
                child: GridView.count(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing:  37.0,
                  crossAxisSpacing: 18.0,
                  childAspectRatio: 1/1.5,
                  children: List.generate(
                      9,
                          (index) =>searchResult()),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}



Widget searchResult(){
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
              ),
              Expanded(
                child: Container(
                  padding:  EdgeInsets.symmetric(horizontal: 4.0),
                  child: Text(
                    "bnvbnvbntrdcfefsdddhhhhjhjhhhhhhhhhhhetgsdfscsxxdcccccccccccccccccccccccccccccccccccccccccccc",
                    style: TextStyle(color: bluecolor,),
                  ),

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
                image: DecorationImage(image: AssetImage("assets/images/image11.png"),fit: BoxFit.fill)
            ),
          ),
        ),
      ],
    ),
  );
}