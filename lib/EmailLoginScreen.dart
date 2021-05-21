import 'package:flutter/material.dart';
import 'package:flutter_dib/MyAccount.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EmailLoginScreen extends StatefulWidget {
  static const id = 'EmailLoginScreen.id';
  EmailLoginScreen({
    Key key,
  }) : super(key: key);

  @override
  _EmailLoginScreenState createState() => _EmailLoginScreenState();
}

class _EmailLoginScreenState extends State<EmailLoginScreen> {
  handleLogin(BuildContext context) async {
    _formKey.currentState.save();
    if (email == '' && password == '') {
      _showDialog(context, msg: 'Please Enter All Fields');
      return;
    }
    setState(() {
      isLoading = true;
    });
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushNamed(context, MyAccount.id);
    } catch (e) {
      _showDialog(context, msg: e.toString());
      setState(() {
        isLoading = false;
      });
    }
  }

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

  final _auth = FirebaseAuth.instance;
  var showPassword = false;
  final _formKey = GlobalKey<FormState>();
  var isLoading = false;
  var email = '', password = '';

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
              offset: Offset(-36.w, -30.h),
              child: Container(
                width: 472.w,
                height: 939.h,
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(24.w, 166.h),
              child: Container(
                width: 340.w,
                height: 75.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(41.0),
                  color: const Color(0xff73eef4),
                  border:
                      Border.all(width: 1.0, color: const Color(0xff707070)),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x29000000),
                      offset: Offset(9.w, 9.h),
                      blurRadius: 6,
                    ),
                  ],
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(25.w, 286.h),
              child: Container(
                width: 340.w,
                height: 75.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(41.0),
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
              offset: Offset(25.w, 561.h),
              child: Container(
                width: 340.w,
                height: 75.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(41.0),
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
              offset: Offset(91.w, 155.h),
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
              offset: Offset(91.w, 275.h),
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
              offset: Offset(153.w, 582.h),
              child: InkWell(
                onTap: () {
                  print('Login');
                  handleLogin(context);
                },
                child: isLoading == true
                    ? CircularProgressIndicator()
                    : Text(
                        'LOGIN',
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 24.sp,
                          color: const Color(0x99000000),
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.left,
                      ),
              ),
            ),
            Transform.translate(
              offset: Offset(317.w, 316.h),
              child:
                  // Adobe XD layer: 'Icon awesome-eye' (shape)
                  InkWell(
                onTap: () {
                  print('Eye');
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
            Transform.translate(
              offset: Offset(53.w, 314.h),
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
              offset: Offset(54.w, 191.h),
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
          ],
        ),
      ),
    );
  }
}
