import 'package:flutter/material.dart';
import 'package:flutter_dib/RegistrationOptionalScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationScreen extends StatefulWidget {
  static const id = 'RegistrationScreen.id';
  RegistrationScreen({
    Key key,
  }) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  void _showDialog(BuildContext context, {var msg: ''}) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(msg == '' ? "Upload Success" : msg),
          content: new Text(msg == '' ? "Data Uploaded" : 'error occured'),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  var email = '', password = '';
  var showPassword = false;
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, height: 844, width: 390);
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Form(
        key: _formKey,
        child: Stack(
          children: <Widget>[
            Transform.translate(
              offset: Offset(-30.w, -51.h),
              child: Container(
                width: 470.w,
                height: 967.h,
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(10.w, 206.h),
              child: Container(
                width: 369.w,
                height: 79.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  color: const Color(0xffffffff),
                  border:
                      Border.all(width: 1.0, color: const Color(0xff707070)),
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
              offset: Offset(11.w, 327.h),
              child: Container(
                width: 369.w,
                height: 79.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  color: const Color(0xffffffff),
                  border:
                      Border.all(width: 1.0, color: const Color(0xff707070)),
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
              offset: Offset(74.w, 194.h),
              child: TextFormField(
                onSaved: (v) => email = v,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  labelText: 'EMAIL',
                ),
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 24.sp,
                  color: const Color(0x73000000),
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Transform.translate(
              offset: Offset(74.w, 315.h),
              child: TextFormField(
                obscureText: showPassword == true ? false : true,
                onSaved: (v) => password = v,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  labelText: 'PASSWORD',
                ),
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 24.sp,
                  color: const Color(0x73000000),
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Transform.translate(
              offset: Offset(18.w, 595.h),
              child: Container(
                width: 354.w,
                height: 73.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(37.0),
                  color: const Color(0xff73eef4),
                  border:
                      Border.all(width: 1.0, color: const Color(0xff707070)),
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
              offset: Offset(18.w, 719.h),
              child: Container(
                width: 354.w,
                height: 73.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(37.0),
                  color: const Color(0xff73eef4),
                  border:
                      Border.all(width: 1.0, color: const Color(0xff707070)),
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
              offset: Offset(51.w, 615.h),
              child: InkWell(
                onTap: () {
                  print('Hello Register As Owner');
                  _formKey.currentState.save();
                  if (email == '' || password == '') {
                    _showDialog(context, msg: 'Please Fill all fields');
                    return;
                  }
                  Navigator.pushNamed(context, RegistrationOptionalScreen.id,
                      arguments: {
                        'Rname': 'Owner',
                        'email': email,
                        'password': password,
                      });
                  email = '';
                  password = '';
                },
                child: Text(
                  'REGISTER AS OWNER',
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
              offset: Offset(37.w, 740.h),
              child: InkWell(
                onTap: () {
                  print('Hello Register As Individual');
                  _formKey.currentState.save();
                  if (email == '' || password == '') {
                    _showDialog(context, msg: 'Please Fill all fields');
                    return;
                  }
                  Navigator.pushNamed(context, RegistrationOptionalScreen.id,
                      arguments: {
                        'Rname': 'Individual',
                        'email': email,
                        'password': password,
                      });
                  email = '';
                  password = '';
                },
                child: Text(
                  'REGISTER AS INDIVIDUAL',
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 22.sp,
                    color: const Color(0xff707070),
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(38.w, 358.h),
              child:
                  // Adobe XD layer: 'Icon ionic-ios-lock' (shape)
                  Container(
                width: 15.w,
                height: 20.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage(
                        'assets/images/Icon ionic-ios-lock.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(36.w, 238.h),
              child:
                  // Adobe XD layer: 'email-24px' (shape)
                  Container(
                width: 20.w,
                height: 20.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage('assets/images/email-24px.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(328.w, 359.h),
              child:
                  // Adobe XD layer: 'Icon awesome-eye' (shape)
                  InkWell(
                onTap: () {
                  print('Hello Eye');
                  setState(() {
                    showPassword = !showPassword;
                  });
                },
                child: Container(
                  width: 28.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage(
                          'assets/images/Icon awesome-eye.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
