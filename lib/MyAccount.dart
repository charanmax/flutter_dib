import 'package:flutter/material.dart';
import 'package:flutter_dib/StartScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyAccount extends StatelessWidget {
  static const id = 'MyAccount.id';
  MyAccount({
    Key key,
  }) : super(key: key);
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, height: 844, width: 390);
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(-28.w, -38.h),
            child: Container(
              width: 470.w,
              height: 921.h,
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(19.w, 75.h),
            child: Container(
              width: 354.w,
              height: 73.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(37.0),
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
            offset: Offset(18.w, 193.h),
            child: Container(
              width: 354.w,
              height: 73.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(37.0),
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
            offset: Offset(18.w, 311.h),
            child: Container(
              width: 354.w,
              height: 73.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(37.0),
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
            offset: Offset(18.w, 429.h),
            child: Container(
              width: 354.w,
              height: 73.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(37.0),
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
            offset: Offset(18.w, 740.h),
            child: Container(
              width: 354.w,
              height: 73.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(37.0),
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
            offset: Offset(155.w, 758.h),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, StartScreen.id);
              },
              child: Text(
                'BACK',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 26.sp,
                  color: const Color(0xff707070),
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(52.w, 95.h),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, StartScreen.id);
              },
              child: Text(
                'MANAGE ADDRESSES',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 24.sp,
                  color: const Color(0xff707070),
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(59.w, 213.h),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, StartScreen.id);
              },
              child: Text(
                'CHANGE PSASWORD',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 24.sp,
                  color: const Color(0xff707070),
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(103.w, 331.h),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, StartScreen.id);
              },
              child: Text(
                'EDIT PROFILE',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 24.sp,
                  color: const Color(0xff707070),
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(139.w, 449.h),
            child: InkWell(
              onTap: () async {
                await _auth.signOut();
                Navigator.pushNamed(context, StartScreen.id);
              },
              child: Text(
                'LOGOUT',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 24.sp,
                  color: const Color(0xff707070),
                  fontWeight: FontWeight.w900,
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
