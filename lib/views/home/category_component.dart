
 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_pp/controllers/home_controller.dart';
import 'package:grocery_pp/models/category.dart';
import 'package:grocery_pp/utils/constants.dart';

class CategoryComponent extends StatelessWidget{

  HomeController controller = Get.put(HomeController());



  @override
  Widget build(BuildContext context) {


    return Container(
      margin: EdgeInsets.only(left: 20),
      height: 50,
      child:
      ListView.builder(
        scrollDirection: Axis.horizontal,
          itemCount: controller.categoryList.length,
          itemBuilder:(BuildContext context , int index) => CategoryCard(controller.categoryList[index],index)
      ),

    );
  }
  Widget CategoryCard(Category category,int index){
    return
      GestureDetector(

        onTap: (){
          controller.changeCategoryActive(index);
        },
        child:
       Obx((){
         return  Container(
           margin: EdgeInsets.only(left: 10),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Text(category.title,style: TextStyle(
                   color: controller.category_selected.value==index?blue:blue.withOpacity(0.6),fontSize: 16),),
               SizedBox(height: 5,),
               controller.category_selected.value==index ?

               Container(
                 height: 3,
                 width: 20,
                 decoration: BoxDecoration(
                     color: orange,
                     borderRadius: BorderRadius.circular(10)
                 ),
               )
                   :Container()
             ],
           ),
         );
       }),
      );
  }
}