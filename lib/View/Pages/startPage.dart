import 'package:flutter/material.dart';
import 'package:food/View/Pages/homePage.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    double MyHeight = MediaQuery.of(context).size.height;
    double MyWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: MyHeight,
        width: MyWidth,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
            'assets/pic.png',
          ),
          fit: BoxFit.cover,
        )),
        child: Column(
          children: [
            SizedBox(height: MyHeight * 0.53),
            Text(
              'Healthy',
              style: TextStyle(color: Colors.white, fontSize: 90),
            ),
            Text(
              'FOOD',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 90,
                  letterSpacing: 18,
                  height: 0.9),
            ),
            SizedBox(height: MyHeight * 0.03),
            Text(
              'More than 10 thousand recipes for you',
              style: TextStyle(color: Colors.white, fontSize: 23),
            ),
            SizedBox(height: MyHeight * 0.05),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: MyWidth * 0.3, vertical: MyHeight * 0.01),
                decoration: BoxDecoration(
                    color: Color(0xffF39A06),
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  "Get Start",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
