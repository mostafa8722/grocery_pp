
 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_pp/controllers/home_controller.dart';
import 'package:grocery_pp/utils/constants.dart';
import 'package:grocery_pp/views/home_screen.dart';

class MainScreen extends StatelessWidget{

  List<IconData> bottomIcons = [
    Icons.home_rounded,
    Icons.favorite_rounded,
    Icons.notifications,
    Icons.person
  ];
  HomeController controller = Get.put(HomeController());

  List<Widget> pages = [
    HomeScreen(),
  Scaffold(),
  Scaffold(),
  Scaffold(),
  ];
 @override
  Widget build(BuildContext context) {

   return


     Scaffold(


       body:Obx((){
         return pages[controller.bottom_selected.value];
       }) ,



     bottomNavigationBar:Container(
       height: 70,
       decoration: BoxDecoration(
           borderRadius: BorderRadius.only(
             topLeft: Radius.circular(30),
             topRight: Radius.circular(30),
           ),
           color: Colors.white,
           boxShadow: [
             BoxShadow(
               color: Colors.grey.withOpacity(0.5),
               spreadRadius: 5,
               blurRadius: 7,
               offset: Offset(0, 3), // changes position of shadow
             ),
           ],

       ),
       child:


       Obx((){

         return   Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: bottomIcons.asMap().map((key, value) =>
               MapEntry(key,
                   GestureDetector(
                       onTap: (){
                         controller.changeBottomNav(key);
                       },
                     child: Icon(
                       value,
                       color: controller.bottom_selected.value==key?orange:grey,
                     ),

                   ),

               )).values.toList(),
         );
           })

     ),
   );
  }
}