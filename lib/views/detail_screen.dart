
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_pp/controllers/home_controller.dart';

import 'package:grocery_pp/models/product.dart';
import 'package:grocery_pp/utils/constants.dart';
import 'package:readmore/readmore.dart';

class DetailScreen extends StatelessWidget{

  HomeController controller = Get.find();
  Product product;
  DetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(

      body:

      Column(
        children: [
          Obx((){

            return Container(
              height: Get.height*0.6,

              width: Get.width,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    top: 10,
                    child:
                   Container(
                     width: Get.width,
                     padding: EdgeInsets.symmetric(horizontal: 10),
                     child:  Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         GestureDetector(onTap: (){},
                           child: Container(
                             height: 40,
                             width: 40,
                             decoration: BoxDecoration(
                                 shape: BoxShape.circle,
                                 color: Colors.white
                             ),
                             child: Center(child: Icon(Icons.arrow_back_ios_new_sharp,color:blue),),
                           ),
                         ),
                         GestureDetector(onTap: (){},
                           child: Container(
                             height: 40,
                             width: 40,
                             decoration: BoxDecoration(
                                 shape: BoxShape.circle,
                                 color: Colors.white
                             ),
                             child: Center(child: Icon(Icons.favorite_border,color:orange),),
                           ),
                         ),
                       ],
                     ),
                   )
                    ,
                  ),
                  CarouselSlider.builder
                    (itemCount: product.images.length,
                      itemBuilder: (context,index, realIndex){
                        return Container(

                         height:200,
                          decoration: BoxDecoration(
                              image:DecorationImage(
                                  image: AssetImage(product.images[index]),
                                  fit: BoxFit.cover
                              )

                          ),
                        );
                      },
                      options: CarouselOptions(
                          onPageChanged: (index,reason){
                            controller.changeImageSlider(index);
                          },
                          viewportFraction: 1,
                          aspectRatio: 1
                      )),


                Positioned(
                  bottom: 0,

                    child:
                   Center(
                     child:  Container(
                       height: 30,
                       width: Get.width,

                       child:
                      Center(
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: product.images.asMap().map((key, value) => MapEntry(key,
                              indcators(key)
                          )).values.toList(),
                        ),
                      )
                     ),
                   )
                ),


                ],
              ),
            );
          }),
          Container(
            height: Get.height*0.4,
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: 2,
                  blurRadius:2,
                ),
              ]
            ),
            child:Column(
              children: [
                Container(
                  height: 5,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(5)
                  ),

                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.star_rate_rounded,color: orange,),
                        SizedBox(width: 4,),
                        Text("${product.rate}"),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.local_fire_department_rounded,color: orange,),
                        SizedBox(width: 4,),
                        Text("${product.calorie} Cal"),
                      ],
                    )
                    ,
                    Row(
                      children: [
                        Icon(Icons.delivery_dining,color: orange,),
                        SizedBox(width: 4,),
                        Text("Fri 26.12"),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                Text("${product.name}",style: TextStyle(color: blue,fontSize: 20,fontWeight: FontWeight.bold),),


                    Row(
                      children: [
                      GestureDetector(onTap: (){
                        controller.changeProductCart(false);
                      },
                      child:  Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle
                        ),
                        child: Center(child :Icon(Icons.remove,color: Colors.white,)),
                      ),
                      ),
                        SizedBox(width: 2,),
                        Obx((){return Text("${controller.add_product_to_cart} kg");}),
                        SizedBox(width: 2,),
                        GestureDetector(onTap: (){
                          controller.changeProductCart(true);
                        },
                          child:      Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                                color: orange,
                                shape: BoxShape.circle
                            ),
                            child: Center(child :Icon(Icons.add,color: Colors.white,)),
                          ),
                        ),

                      ],
                    )
                  ],
                ),
                SizedBox(height: 5,),



                Expanded(child:
                SingleChildScrollView(
                  child:    ReadMoreText(
                    product.description ,
                    trimLines:3,
                    colorClickableText: Colors.pink,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Show less',
                    moreStyle: poppins.copyWith(color: darkorange),
                    lessStyle: poppins.copyWith(color: darkorange),

                  ),
                )
                ),

                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Column(
                    children: [
                      Text("Total Price",style: TextStyle(color: blue.withOpacity(0.7),fontSize: 15),),
                      SizedBox(height: 4,),
                      Text("\$\ ${product.price}",style: TextStyle(color: blue,fontSize: 20,fontWeight: FontWeight.bold),),
                    ],
                  ),


                   GestureDetector(
                     onTap: (){},
                     child: Container(
                       height: 40,
                       width: 150,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(30),
                         color: orange
                       ),
                       child: Center(child: Text("Add to Cart",style: TextStyle(color: Colors.white,fontSize: 20),),),
                     ),
                   )
                  ],
                ),

              ],
            )
          )
        ],
      ),
    );
  }
  Widget indcators (int index){
    return AnimatedContainer(
      margin: EdgeInsets.only(left: 4),
    duration: Duration(microseconds: 250),
    height: 5,
      width: index==controller.currentImage.value?20:5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: index==controller.currentImage.value?blue:blue.withOpacity(0.65)
      ),
    );
  }
}