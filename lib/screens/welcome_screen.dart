import 'package:auth_test/misc/colors.dart';
import 'package:auth_test/widgets/responsive_button.dart';
import 'package:flutter/material.dart';

import '../widgets/app_large_text.dart';
import '../widgets/app_text.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  List images = [
    "assets/welcome-one.png",
    "assets/welcome-two.png",
    "assets/welcome-three.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: (_, index){
          var container = Container;
          return Container (
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              // color: index % 2 == 0 ? Colors.green : Colors.blue[600],
              image: DecorationImage(
                image: AssetImage(
                  images[index]
                ),
                fit: BoxFit.cover
              )
            ),
            child: Container(
              margin: const EdgeInsets.only(top:100, left:20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppLargeText(text: "Trips"),
                      AppText(text: "Vacations", color: Colors.black87, size: 30,),
                      SizedBox(height: 20),
                      Container(
                        width: 250,
                        child: AppText(
                          text: "Come and traavel and enjoy the high horizons, we have good and pleasant hotels heals and valies come with you families",
                          color: Colors.black87,
                          size: 13,
                        )
                      ),
                      SizedBox(height: 40),
                      GestureDetector(
                        onTap: (){
                          
                        },
                        child: ResponsiveButton(width: 120,)
                      )
                    ]
                  ),
                  Column(
                    children: List.generate(3, (sliderIndex) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 2),
                        width: 8,
                        height: index == sliderIndex ? 20 : 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: index == sliderIndex ? AppColors.mainColor : AppColors.mainColor.withOpacity(0.3)
                        ),
                      );
                    })
                  )
                ],
              ),
            ),
          );
      }),      
    );
  }
}