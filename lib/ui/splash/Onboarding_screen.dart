import 'package:flutter/material.dart';
import 'package:wedding_gaadi/widgets/buttons/raisedButton.dart';
import 'package:wedding_gaadi/routesTable.dart';

class OnboardingScreen extends StatefulWidget {
  static const routeName = "/onboarding";

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "image": "assets/images/car.png",
      "title": "Accept a job",
      "disc":
          "You will receive rides in this app, where you will accept the ride",
    },
    {
      "image": "assets/images/map.png",
      "title": "Realtime tracking",
      "disc":
          "You will be able to track the realtime location for the customer",
    },
    {
      "image": "assets/images/Earn.png",
      "title": "Earn Money",
      "disc":
          "Be your own boss, take control of your earnings and the hours you work",
    },
  ];
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemCount: splashData.length,
              itemBuilder: (context, index) => SplashContent(
                image: splashData[index]["image"],
                disc: splashData[index]["disc"],
                title: splashData[index]["title"],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    splashData.length,
                    (index) => bulidDot(index: index),
                  ),
                ),
                Spacer(
                  flex: 2,
                ),
                ButtonRaised(
                    text: "Get started",
                    onPressed: () {
                      print("get started");
                      Navigator.pushReplacementNamed(context, "/permission");
                    }),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AnimatedContainer bulidDot({int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 0),
      margin: EdgeInsets.only(right: 10, left: 10),
      height: currentPage == index ? 20 : 6,
      width: currentPage == index ? 40 : 6,
      decoration: currentPage == index
          ? BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/dotCar.png"),
                  fit: BoxFit.cover),
            )
          : BoxDecoration(
              color: Colors.orange[100],
              borderRadius: BorderRadius.circular(3),
            ),
    );
  }
}

class SplashContent extends StatelessWidget {
  final String image;
  final String title;
  final String disc;

  const SplashContent({
    Key key,
    this.image,
    this.title,
    this.disc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Spacer(),
        Image.asset(
          "assets/images/head.png",
          width: screenWidth * 0.4,
          fit: BoxFit.contain,
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenHeight * 0.05,
            vertical: screenWidth * 0.05,
          ),
          child: Image.asset(
            image,
            width: screenWidth,
          ),
        ),
        Spacer(),
        Text(
          title,
          style: TextStyle(
            fontFamily: "Rubik-Medium",
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            disc,
            style: TextStyle(
              fontFamily: "Rubik-Medium",
              fontWeight: FontWeight.bold,
              color: Colors.grey,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
