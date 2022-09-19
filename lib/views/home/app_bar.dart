
import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget{

  @override
  Widget build(BuildContext context) {

    return AppBar(
      leadingWidth: 130,
      elevation: 0,
      backgroundColor: primaryColor,
      leading:Padding(
        padding: EdgeInsets.only(left: 10),
        child: Row(
          children: [

            const Icon(
              Icons.bubble_chart_rounded,
              color: blue,
            ),
            RichText(text:
            TextSpan(
                children: [
                  TextSpan(
                      text: "GRO",
                      style: poppins.copyWith(
                          color: darkorange,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      )
                  ),
                  TextSpan(
                      text: "CERY",
                      style: poppins.copyWith(
                          color: blue,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      )
                  ),
                ]
            )
            )
          ],
        ),
      ),
      actions: [
        GestureDetector(
          onTap: (){},
          child: Stack(
            children: [
              Container(
                height: 40,
                width: 40,
                margin: EdgeInsets.only(top: 10,right: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,

                ),
                child: Center(child: Icon(Icons.shopping_basket,color: orange,),),
              ),
              Positioned(
                  top: 10,
                  right: 10,
                  child:
                  Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green
                    ),
                    child: Center(child: Text("19",style: TextStyle(color: Colors.white,fontSize: 10),),),
                  )
              ),
            ],
          ),
        )
      ],
    );
  }

  @override

  Size get preferredSize =>Size.fromHeight(60);
}