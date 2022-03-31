import 'package:auth_test/misc/colors.dart';
import 'package:auth_test/widgets/app_text.dart';
import 'package:auth_test/widgets/responsive_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/app_buttons.dart';
import '../widgets/app_large_text.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  int gottenStar = 4;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/mountain.png"),
                    fit:BoxFit.cover
                  )
                )
              )
            ),
            Positioned(
              left: 20,
              top: 50,
              child: Row(
                children:[
                  IconButton(onPressed: (){}, icon: const Icon(Icons.menu,),
                  color: Colors.white,
                  )
                ]
              )
            ),
            Positioned(
              top: 320,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top:30),
                width: MediaQuery.of(context).size.width,
                height: 700,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(text:"Plateau Rock", color: Colors.black.withOpacity(0.8),),
                        AppLargeText(text:"₦ 230", color: AppColors.textColor1,),
                      ]
                    ),
                    const SizedBox(height:10),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: AppColors.mainColor,),
                        SizedBox(width: 5),
                        AppText(text: "Nigeria, Fct.", size: 16, color: AppColors.textColor1,)
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children:[
                        Wrap(
                          children: List.generate(5, (index) {
                            return Icon(Icons.star, color:index<gottenStar?AppColors.starColor:AppColors.textColor2,);
                          })
                        ),
                        SizedBox(width: 10,),
                        AppText(text: "(4.0)", size: 16, color: AppColors.textColor1,)
                      ]
                      ),
                    SizedBox(height: 25),
                    AppLargeText(text: "People", size: 20, color:Colors.black.withOpacity(0.8)),
                    SizedBox(height: 5),
                    AppText(text: "Number of people in your trip", size: 14,),
                    SizedBox(height: 10),
                    Wrap(
                      children: List.generate(5, (index) {
                        return InkWell(
                          onTap: (){
                            setState(() {
                              selectedIndex=index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: AppButtons(
                              color: selectedIndex==index? Colors.white:Colors.black, 
                              backGroundColor: selectedIndex==index?Colors.black:AppColors.buttonBackground, 
                              borderColor:selectedIndex==index?Colors.black:AppColors.buttonBackground,
                              size: 50, 
                              text: (index+1).toString(),
                            ),
                          ),
                        );
                      })
                    ),
                    SizedBox(height: 20),
                    AppLargeText(text:"Description", size: 20, color: Colors.black.withOpacity(0.8),),
                    SizedBox(height: 10),
                    AppText(text: "In the following example, each of the 3 images is 100 pixels wide. The render box (in this case, the entire screen) is more than 300 pixels wide, so setting the main axis alignment to spaceEvenly divides the free horizontal space evenly",size: 14,),
                  ]
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              left: 20,
              right: 20,
              child: Row(
                children: [
                  AppButtons(
                    color: AppColors.textColor1, 
                    backGroundColor: Colors.white, 
                    size: 60, 
                    borderColor: AppColors.textColor2,
                    isIcon: true,
                    icon: Icons.favorite_border,
                  ),
                  SizedBox(width: 20),
                  ResponsiveButton(
                    isResponsive: true,
                    // width: 200,
                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}