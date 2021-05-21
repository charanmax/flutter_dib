import 'package:flutter/material.dart';
import 'package:flutter_dib/EmailLoginScreen.dart';
import 'package:flutter_dib/MobileLoginScreen.dart';
import 'package:flutter_dib/RegistrationOptionalScreen.dart';
import 'package:flutter_dib/RegistrationScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StartScreen extends StatelessWidget {
  static const id = 'StartScreen.id';
  StartScreen({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, height: 844, width: 390);
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(-32.w, -28.h),
            child: Container(
              width: 478.w,
              height: 929.h,
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(15.w, 255.h),
            child: Container(
              width: 360.w,
              height: 286.h,
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x29000000),
                    offset: Offset(9.w, 9.h),
                    blurRadius: 9,
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(33.w, 302.h),
            child: Container(
              width: 317.w,
              height: 69.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35.0),
                color: const Color(0xff73eef4),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x29000000),
                    offset: Offset(9.w, 9.h),
                    blurRadius: 9,
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(33.w, 402.h),
            child: Container(
              width: 317.w,
              height: 69.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35.0),
                color: const Color(0xff73eef4),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x29000000),
                    offset: Offset(9.w, 9.h),
                    blurRadius: 9,
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(77.w, 323.h),
            child: InkWell(
              onTap: () {
                print('Hello Mobile');
                Navigator.pushNamed(context, MobileLoginScreen.id);
              },
              child: Text(
                'LOGIN WITH MOBILE',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 20.sp,
                  color: const Color(0xff707070),
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(89.w, 422.h),
            child: InkWell(
              onTap: () {
                print('Hello Email');
                Navigator.pushNamed(context, EmailLoginScreen.id);
              },
              child: Text(
                'LOGIN WITH EMAIL',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 20.sp,
                  color: const Color(0xff707070),
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(58.w, 501.h),
            child: Text(
              'NOT REGISTERED YET ?',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 18.sp,
                color: const Color(0xff707070),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(276.w, 501.h),
            child: InkWell(
              onTap: () {
                print('Hello SignUp');
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
              child: Text(
                'SIGN UP',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 18.sp,
                  color: const Color(0xff4285f4),
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
