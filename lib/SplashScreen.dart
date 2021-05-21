import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dib/StartScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => StartScreen())));

    ScreenUtil.init(context, height: 812, width: 375);
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Container(
            width: 375.w,
            height: 812.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.0, -1.0),
                end: Alignment(0.0, 1.0),
                colors: [
                  const Color(0xff7367dc),
                  const Color(0xff6cb0c9),
                  const Color(0xff808080)
                ],
                stops: [0.0, 0.273, 1.0],
              ),
              border: Border.all(width: 1.0, color: const Color(0xff707070)),
            ),
          ),
          Transform.translate(
            offset: Offset(129.w, 253.h),
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize: 60.0,
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText('DIB'),
                ],
                isRepeatingAnimation: true,
                onTap: () {
                  print("Tap Event");
                },
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(50.w, 593.h),
            child: Text(
              '          WE ARE HERE \n\n    FOR YOUR COMFORT ',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 24.sp,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
