import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food/View/Pages/startPage.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 4),
      () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => StartPage()));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff1E1E1E),
        body: Container(
          height: myHeight,
          width: myWidth,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: myHeight * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(''),
                Text(
                  'Healthy Food',
                  style: TextStyle(
                      fontSize: 60,
                      color: Color(0xffF39A06),
                      fontWeight: FontWeight.bold),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Creat by',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          width: myWidth * 0.02,
                        ),
                        Image.asset(
                          'assets/io.png',
                          height: myHeight * 0.03,
                        )
                      ],
                    ),
                    SizedBox(
                      height: myHeight * 0.009,
                    ),
                    Image.asset(
                      'assets/loading1.gif',
                      height: myHeight * 0.015,
                      color: Colors.white,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
