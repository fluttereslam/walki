

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../shared/colors/colors.dart';

class AllTopRestaurants extends StatelessWidget {
  const AllTopRestaurants({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double titlepadding = MediaQuery.of(context).size.width*0.16;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.0),
        child: AppBar(
          elevation: 0,
        ),
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
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
                            // Navigator.pop(context);
                          }, icon: Image.asset("assets/images/Vector.png")),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top: 4.0,left: titlepadding),
                      child: Text("Top Restaurants",
                        style:  TextStyle(
                            fontFamily:"Poppins",
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            ),),
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
                      16,
                          (index) =>TopRestaurantItem()),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}


Widget TopRestaurantItem(){
  return Container(
    width: double.infinity,
    height: 237,
    decoration: BoxDecoration(
      color: HexColor("#214E8A"),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),),
      margin: EdgeInsets.all(1),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            height: 110,
            decoration: BoxDecoration(
              // color: HexColor("#214E8A"),
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(image: AssetImage("assets/images/ismailia.png"),fit: BoxFit.fill)
            ),
          ),
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
  );
}


