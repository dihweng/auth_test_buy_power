import 'package:auth_test/misc/colors.dart';
import 'package:auth_test/widgets/app_large_text.dart';
import 'package:auth_test/widgets/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  var images = {
    "camera.png":"Movies",
    "hiking.png": "Hiking",
    "relax.png":"vacation",
    "yoga.png":"Yoga",
    "snorkel.png":"Snorkel",
    "skating.png":"Skating",
    "kayaking.png":"Kayaking"
  };

  @override
  Widget build(BuildContext context) {
  
  TabController _tabControler = TabController(length: 3, vsync: this);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Memu Text
          Container(
            padding: EdgeInsets.only(top: 70, left: 20),
            child: Row(
              children:[
                const Icon(Icons.menu, size:30, color:Colors.black54),
                Expanded(child: Container()),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  width: 50,
                  height: 50,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(10),
                    color: Colors.grey.withOpacity(0.5),
                    ),
                )
              ]
            ),
          ),
          const SizedBox(height: 40),
          // Discovery Text
          Container(
            margin: const EdgeInsets.only(left:20),
            child: AppLargeText(text:"Discover"),
          ),
          const SizedBox(height: 30),
          // Tabbar
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
                child: TabBar(
                labelPadding: EdgeInsets.only(left:20, right:20),
                controller: _tabControler,
                labelColor: Colors.lightGreen[700],
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: CircleTabIndicator(color: Colors.lightGreen[700], radius: 4),
                tabs: const [
                  Tab(text: "Places"),
                  Tab(text: "Inspiration"),
                  Tab(text: "Emotion"),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left:20),
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabControler,
              children: [
                ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {  
                    return Container(
                      margin: const EdgeInsets.only(right: 15, top: 10),
                      width: 200,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/room.png"
                          ),
                          fit: BoxFit.cover,
                        )
                      ),
                    );
                  },
                ),
                Text("There"),
                Text("Bye"),
              ],
            ),
          ),
          const SizedBox(height: 30),          
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              AppLargeText(text:"Explore more", size: 20,),
              AppText(text: "See all", size: 14, color: Colors.lightGreen[700],)
            ],)
          ),
          const SizedBox(height: 30),          
          Container(
            height: 120,
            width: double.maxFinite,
            margin: const EdgeInsets.only(left:20),
            child: ListView.builder(
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index){
                return Container(
                  margin: const EdgeInsets.only(right: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:[
                       Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/"+images.keys.elementAt(index)
                            ),
                            fit: BoxFit.cover,
                          )
                        ),
                      ),
                      SizedBox(height: 4),
                      Container(
                        child: AppText(
                          text:images.values.elementAt(index),
                          color: AppColors.textColor2,
                          ),
                      )
                    ]
                  ),
                );
              }
            ),
          )
        ],
      ),
    );
  }
}

// Create circle indicator widget class its not done by default
class CircleTabIndicator extends Decoration {

  final Color color;
  double radius;
  CircleTabIndicator({this.color, this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback onChanged]){
    // Todo: implement createBoxPainter
    return _circlePainter(color: color, radius:radius);
  }

}

class _circlePainter extends BoxPainter {
  final Color color;
  double radius;
  _circlePainter({this.color, this.radius});
  
  @override
  void paint(Canvas canvas, Offset offset, 
    ImageConfiguration configuration) {
      Paint _paint = Paint();
      _paint.color=color;
      _paint.isAntiAlias=true;
      final Offset CircleOffset = Offset(configuration.size.width/2 -radius/2, configuration.size.height-radius);
      canvas.drawCircle(offset+CircleOffset, radius, _paint);
  }

}