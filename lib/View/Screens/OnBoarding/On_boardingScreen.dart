import 'package:flutter/material.dart';
import 'package:shopapp/View/Screens/AuthenticationScreen/LoginScreen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel{
  String image;
  String title;
  String bodey;

  BoardingModel({
    required this.image,
    required this.title,
    required this.bodey,
  });
}
class OnBoardinfScreen extends StatefulWidget {
  @override
  State<OnBoardinfScreen> createState() => _OnBoardinfScreenState();
}

class _OnBoardinfScreenState extends State<OnBoardinfScreen> {
  var BoardController =PageController();

  List<BoardingModel>Boarding=[
    BoardingModel(
      image: "Assets/Images/onboard_1.jpg",
      title: "On Board 1 Title",
      bodey: "On Board 1 Body"
    ),
    BoardingModel(
        image: "Assets/Images/onboard_1.jpg",
        title: "On Board 2 Title",
        bodey: "On Board  Body"
    ),
    BoardingModel(
        image: "Assets/Images/onboard_1.jpg",
        title: "On Board 3 Title",
        bodey: "On Board 3 Body"
    ),
  ];

bool isLast =false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        actions: [
          TextButton(
              onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) {
                  return LoginScreen();
                }));
              },
              child:Text(
                  "Skip",
                 style: TextStyle(color: Colors.deepOrange),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder
                (
                physics: BouncingScrollPhysics(),
                controller: BoardController,
                onPageChanged: (int index){
                  if(index==Boarding.length-1){
                    setState((){
                      isLast=true;
                    });
                  }else{
                    setState((){
                      isLast=false;
                    });
                  }
                },
                itemBuilder: (BuildContext context, int index) {
                return buildBoardingItem(Boarding[index]);
              },
              itemCount: Boarding.length,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller:BoardController,
                  count: Boarding.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor: Colors.deepOrange,
                    dotColor: Colors.grey,
                    dotHeight: 10,
                    dotWidth: 10,
                    expansionFactor: 4,
                    spacing: 5.0,
                  ),

                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: (){
                    if(isLast){
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (BuildContext context)
                         => LoginScreen()
                      ),
                      );
                    }else{
                      BoardController.nextPage(
                          duration:Duration(
                              milliseconds: 750
                          ),
                          curve:Curves.fastLinearToSlowEaseIn
                      );
                    }
                  },
                  child:Icon(
                      Icons.arrow_forward_ios,color: Colors.white),
                  backgroundColor: Colors.deepOrange,)
              ],
            ),
          ],
        ),
      ),

    );
  }

  Widget buildBoardingItem(BoardingModel model){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image(image:
          AssetImage('${model.image}')),
        ),

        Text(
          "${model.title}",
          style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 30.0,
        ),
        Text(
          "${model.bodey}",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
          ),
        )
      ],
    );
  }
}
