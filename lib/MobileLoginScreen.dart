import 'package:flutter/material.dart';
import 'package:flutter_dib/MyAccount.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MobileLoginScreen extends StatefulWidget {
  static const id = 'MobileLoginScreen.id';
  MobileLoginScreen({
    Key key,
  }) : super(key: key);

  @override
  _MobileLoginScreenState createState() => _MobileLoginScreenState();
}

class _MobileLoginScreenState extends State<MobileLoginScreen> {
  var processOtp = false;
  var isOtpVerified = false;
  String dropdownValue = 'Yes';
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  var phone = '', OTP = '', name = '', sentOtp = '', range = '';
  void _showDialog(BuildContext context, {var msg: ''}) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(msg == '' ? "Upload Success" : msg),
          //content: new Text(msg == '' ? "Data Uploaded" : 'error occured'),
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

  void handleSubmit(BuildContext context) async {
    _formKey.currentState.save();
    if (phone == '' && OTP == '') {
      _showDialog(context, msg: 'Please Fill All fields');

      return;
    }
    if (phone.length != 10) {
      _showDialog(context, msg: 'Phone Number is Invalid');
      return;
    }

    await _auth.verifyPhoneNumber(
        phoneNumber: '+91' + phone,
        timeout: Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential).then((value) {
            if (value.user != null) {
              print('User Logged IN');
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
          _showDialog(context, msg: e.message);
        },
        codeSent: (String OTP, int resendOtp) {},
        codeAutoRetrievalTimeout: (String OTP) {});
    print(phone);
    print(OTP);
  }

  void verifyOTP(BuildContext context) async {
    _formKey.currentState.save();
    if (phone == '' && OTP == '' && name == '') {
      _showDialog(context, msg: 'Please Fill All fields');
      return;
    }
    if (phone.length != 10) {
      _showDialog(context, msg: 'Phone Number is Invalid');
      return;
    }
    var authResult;
    setState(() {
      isOtpVerified = true;
    });
    try {
      authResult = await _auth.signInWithCredential(
          PhoneAuthProvider.credential(
              verificationId: sentOtp.toString(), smsCode: OTP.toString()));
      print(sentOtp);
      print(authResult);
      if (authResult != null) {
        print('success');
        try {
          await _auth.createUserWithEmailAndPassword(
              email: email, password: password);
          _showDialog(context, msg: 'User was Successfully Registered');
          Navigator.pushNamed(context, MyAccount.id);
        } catch (e) {
          _showDialog(context, msg: e.toString());
          setState(() {
            isOtpVerified = false;
          });
        }
      } else {
        print('You input invalid OTP code');
        setState(() {
          isOtpVerified = false;
        });
      }
    } on FirebaseAuthException catch (e) {
      _showDialog(context, msg: e.toString());
      setState(() {
        isOtpVerified = false;
      });
    } on ArgumentError catch (e) {
      _showDialog(context, msg: e.toString());
      setState(() {
        isOtpVerified = false;
      });
    } catch (e) {
      _showDialog(context, msg: e.toString());
      setState(() {
        isOtpVerified = false;
      });
    }
  }

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
              offset: Offset(-24.w, -23.h),
              child: Container(
                width: 468.w,
                height: 905.h,
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(18.w, 329.h),
              child: Text(
                'MOBILE NUMBER',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 16.sp,
                  color: const Color(0xff000000),
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Transform.translate(
              offset: Offset(167.w, 308.h),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: TextFormField(
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 24.sp,
                      color: const Color(0xff000000),
                    ),
                    onSaved: (v) => phone = v,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                width: 210.w,
                height: 56.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(38.0),
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
              offset: Offset(167.w, 407.h),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: TextFormField(
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 24.sp,
                      color: const Color(0xff000000),
                    ),
                    onSaved: (v) => OTP = v,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                width: 210.w,
                height: 56.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(38.0),
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
              offset: Offset(18.w, 426.h),
              child: Text(
                'ENTER OTP',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 16.sp,
                  color: const Color(0xff000000),
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Transform.translate(
              offset: Offset(181.w, 488.h),
              child: InkWell(
                onTap: () {
                  handleSubmit(context);
                },
                child: Text(
                  'Click Here ',
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 16.sp,
                    color: const Color(0xff4285f4),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(259.w, 488.h),
              child: Text(
                'to get the OTP',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 16.sp,
                  color: const Color(0xff000000),
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Transform.translate(
              offset: Offset(40.w, 541.h),
              child: Container(
                width: 317.w,
                height: 69.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35.0),
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
              offset: Offset(153.w, 557.h),
              child: InkWell(
                onTap: () {
                  verifyOTP(context);
                },
                child: Text(
                  'LOGIN',
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
          ],
        ),
      ),
    );
  }
}
