
 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_pp/controllers/home_controller.dart';
import 'package:grocery_pp/utils/constants.dart';
import 'package:grocery_pp/views/home/app_bar.dart';
import 'package:grocery_pp/views/home/category_component.dart';
import 'package:grocery_pp/views/home/product_component.dart';
import 'package:grocery_pp/views/home/search_box.dart';

class HomeScreen extends StatelessWidget{

  List<IconData> bottomIcons = [];
  HomeController controller = Get.put(HomeController());
 @override
  Widget build(BuildContext context) {

   controller.fetchCategoris();
   controller.fetchProducts();
   return

     Scaffold(
       backgroundColor: primaryColor,
       appBar: HomeAppBar(),
       body:  Column(
         children: [
           SizedBox(height: 20,),

               SearchComponent(),
               SizedBox(height: 20,),
               CategoryComponent(),
               SizedBox(height: 20,),
               ProductComponent(),

               SizedBox(height: 20,),

         ],
       ),









   );
  }
}