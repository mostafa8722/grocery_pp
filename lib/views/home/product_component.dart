
 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_pp/controllers/home_controller.dart';
import 'package:grocery_pp/models/product.dart';
import 'package:grocery_pp/utils/constants.dart';
import 'package:grocery_pp/views/detail_screen.dart';

class ProductComponent extends StatelessWidget{

  HomeController controller = Get.put(HomeController());



  @override
  Widget build(BuildContext context) {


    return Expanded(

      child:
      GridView.builder(
        gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20
        ) ,
        scrollDirection: Axis.vertical,
          itemCount: controller.productList.length,
          itemBuilder:(BuildContext context , int index) => ProductCard(controller.productList[index],index)
      ),

    );
  }
  Widget ProductCard(Product product,int index){
    return
      GestureDetector(

        onTap: (){
         Get.to(DetailScreen(product: product));
        },
        child:

      Container(

           height: 250,
           margin: EdgeInsets.only(left: 10),
           padding:EdgeInsets.symmetric(horizontal: 10,vertical: 2),
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(15),
             color: Colors.white
           ),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Center(child:Image.asset(product.images[0],height: 100,)),
               Text("${product.name }",style: TextStyle(
                   color:blue,fontSize: 16),),
               SizedBox(height: 5,),


               Text("${product.calorie} Cal",style: TextStyle(
                   color:blue.withOpacity(0.8),fontSize: 14),),

               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   RichText(text:
                   TextSpan(
                     children: [
                       TextSpan(
                         text: "\$\ ${product.price}",
                         style: TextStyle(color: orange,fontSize: 15),
                       ),
                       TextSpan(
                         text: "/kg",
                         style: TextStyle(color: blue,fontSize: 15),
                       )
                     ]
                   )
                   ),

                  GestureDetector(
                    onTap: (){
                      controller.changeCategoryActive(index);
                    },
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        color: orange,
                        shape: BoxShape.circle
                      ),
                      child: Center(child :Icon(Icons.add,color: Colors.white,)),
                    ),
                  )
                 ],
               )
             ],
           ),
         )

      );
  }
}