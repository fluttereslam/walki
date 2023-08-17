import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:walki/shared/colors/colors.dart';

var searchController = TextEditingController();


List<String> searchHistory =[
  "rest",
  "coffe",
  "cafee",
  "mostafa",
  "rest",
  "coffe",
  "cafee",
  "mostafa",
];



class SearchResult extends StatelessWidget {
  const SearchResult({Key? key}) : super(key: key);

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
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
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
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(left: 33.0,top: 3.0),
                  itemBuilder: (context,index)=>SearchHistoryItem(searchHistory[index],index),
                  separatorBuilder: (context,index)=>SizedBox(height: 22.0,),
                  itemCount: 8)
            ],
          ),
        ),
      ),
    );
  }
}



Widget SearchHistoryItem(text,index){
  return InkWell(
    onTap: (){
      print("$index");
    },
    child: Text("$text",
      style: TextStyle(
        fontFamily:"Poppins",
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}