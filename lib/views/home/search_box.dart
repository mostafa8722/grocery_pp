



import 'package:flutter/material.dart';
import 'package:grocery_pp/utils/constants.dart';

class SearchComponent extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(horizontal: 10),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(

        decoration: InputDecoration(

          prefixIcon: Icon(Icons.search_rounded,color: blue,),
          suffixIcon: Icon(Icons.tune_rounded,color: blue,),
          hintText: "Search want to buy ...",
          hintStyle: TextStyle(color: blue),
          border: InputBorder.none
        ),

      ),
    );
  }
}