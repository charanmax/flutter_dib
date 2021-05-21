import 'package:flutter/material.dart';
import 'package:flutter_dib/MyAccount.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'DrpDown.dart';

class RegistrationOptionalScreen extends StatefulWidget {
  static const id = 'RegistrationOptionalScreen.id';
  RegistrationOptionalScreen({
    Key key,
  }) : super(key: key);

  @override
  _RegistrationOptionalScreenState createState() =>
      _RegistrationOptionalScreenState();
}

class _RegistrationOptionalScreenState
    extends State<RegistrationOptionalScreen> {
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
    if (phone == '' && OTP == '' && name == '') {
      _showDialog(context, msg: 'Please Fill All fields');

      return;
    }
    if (phone.length != 10) {
      _showDialog(context, msg: 'Phone Number is Invalid');
      return;
    }
    setState(() {
      processOtp = true;
    });

    await _auth.verifyPhoneNumber(
        phoneNumber: '+91' + phone,
        timeout: Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential).then((value) {
            if (value.user != null) {
              print('User Logged IN');
              setState(() {
                processOtp = false;
              });
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          setState(() {
            processOtp = false;
          });

          print(e.message);
          _showDialog(context, msg: e.message);
        },
        codeSent: (String OTP, int resendOtp) {
          setState(() {
            sentOtp = OTP;
          });
        },
        codeAutoRetrievalTimeout: (String OTP) {
          setState(() {
            sentOtp = OTP;
          });
        });
    print(phone);
    print(OTP);
    setState(() {
      processOtp = false;
    });
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
          setState(() {
            isOtpVerified = false;
          });
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
    final arguments = ModalRoute.of(context).settings.arguments as Map;

    if (arguments != null) print(arguments);
    email = arguments['email'];
    password = arguments['password'];
    ScreenUtil.init(context, height: 844, width: 390);
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Transform.translate(
                offset: Offset(-47.w, -46.h),
                child: Container(
                  width: 518.w,
                  height: 972.h,
                  decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(16.w, 71.h),
                child: Container(
                  width: 366.w,
                  height: 72.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(36.0),
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
                offset: Offset(12.w, 181.h),
                child: Container(
                  width: 366.w,
                  height: 72.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(36.0),
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
                offset: Offset(12.w, 290.h),
                child: Container(
                  width: 366.w,
                  height: 72.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(36.0),
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
              if (arguments['Rname'] != 'Individual')
                Transform.translate(
                  offset: Offset(12.w, 460.h),
                  child: Container(
                    width: 366.w,
                    height: 72.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(36.0),
                      color: const Color(0xffffffff),
                      border: Border.all(
                          width: 1.0, color: const Color(0xff707070)),
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
              if (arguments['Rname'] != 'Individual')
                Transform.translate(
                  offset: Offset(12.w, 563.h),
                  child: Container(
                    width: 366.w,
                    height: 72.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(36.0),
                      color: const Color(0xffffffff),
                      border: Border.all(
                          width: 1.0, color: const Color(0xff707070)),
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
              if (arguments['Rname'] != 'Individual')
                Transform.translate(
                  offset: Offset(12.w, 666.h),
                  child: Container(
                    width: 366.w,
                    height: 72.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(36.0),
                      color: const Color(0xffffffff),
                      border: Border.all(
                          width: 1.0, color: const Color(0xff707070)),
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
                offset: Offset(53.w, 60.h),
                child: TextFormField(
                  onSaved: (v) => name = v,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    labelText: 'SHOP NAME',
                  ),
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 22.sp,
                    color: const Color(0x73000000),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Transform.translate(
                offset: Offset(53.w, 170.h),
                child: TextFormField(
                  onSaved: (v) => phone = v,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    labelText: 'MOBILE NUMBER',
                  ),
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 22.sp,
                    color: const Color(0x73000000),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Transform.translate(
                offset: Offset(53.w, 280.h),
                child: TextFormField(
                  onSaved: (v) => OTP = v,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    labelText: 'ENTER OTP',
                  ),
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 22.sp,
                    color: const Color(0x73000000),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Transform.translate(
                offset: Offset(277.w, 318.h),
                child: InkWell(
                  onTap: () {
                    print('Hello Get Otp');
                    handleSubmit(context);
                  },
                  child: processOtp == true
                      ? CircularProgressIndicator()
                      : Text(
                          'GET OTP',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 18.sp,
                            color: const Color(0xff4183ef),
                          ),
                          textAlign: TextAlign.left,
                        ),
                ),
              ),
              if (arguments['Rname'] != 'Individual')
                Transform.translate(
                  offset: Offset(53.w, 464.h),
                  child: Row(
                    children: [
                      Text(
                        'Delivery',
                        style: TextStyle(fontSize: 24),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      DropdownButton<String>(
                        value: dropdownValue,
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 50,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          width: 25,
                          height: 3,
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValue = newValue;
                          });
                        },
                        items: <String>['Yes', 'No']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(fontSize: 24),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              if (arguments['Rname'] != 'Individual')
                Transform.translate(
                  offset: Offset(53.w, 567.h),
                  child: Row(
                    children: [
                      Text(
                        'Category',
                        style: TextStyle(fontSize: 24),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      DropdownButton<String>(
                        value: dropdownValue,
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 50,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          width: 25,
                          height: 3,
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValue = newValue;
                          });
                        },
                        items: <String>['Yes', 'No']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(fontSize: 24),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              if (arguments['Rname'] != 'Individual')
                Transform.translate(
                  offset: Offset(53.w, 656.h),
                  child: TextFormField(
                    onSaved: (v) => range = v,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      labelText: 'Delivery Range',
                    ),
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 22.sp,
                      color: const Color(0x73000000),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              if (arguments['Rname'] != 'Owner')
                Transform.translate(
                  offset: Offset(12.w, 765.h),
                  child: Container(
                    width: 174.w,
                    height: 57.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(29.0),
                      color: const Color(0xff73eef4),
                      border: Border.all(
                          width: 1.0, color: const Color(0xff707070)),
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
                offset: Offset(208.w, 765.h),
                child: Container(
                  width: 174.w,
                  height: 57.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(29.0),
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
              if (arguments['Rname'] != 'Owner')
                Transform.translate(
                  offset: Offset(37.w, 785.h),
                  child: InkWell(
                    onTap: () {
                      print('Hello Skip');
                      Navigator.pushNamed(context, MyAccount.id);
                    },
                    child: Text(
                      'SKIP THIS PAGE',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 16.sp,
                        color: const Color(0xff707070),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              Transform.translate(
                offset: Offset(267.w, 785.h),
                child: InkWell(
                  onTap: () {
                    print('Hello Skip');
                    Navigator.pushNamed(context, MyAccount.id);
                  },
                  child: Text(
                    'SUBMIT',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 16.sp,
                      color: const Color(0xff707070),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              // if (arguments['Rname'] != 'Individual')
              //   Transform.translate(
              //     offset: Offset(331.w, 487.h),
              //     child:
              //         // Adobe XD layer: 'caret-down' (shape)
              //         Container(
              //       width: 20.w,
              //       height: 20.h,
              //       decoration: BoxDecoration(
              //         image: DecorationImage(
              //           image: const AssetImage('assets/images/caret-down.png'),
              //           fit: BoxFit.fill,
              //         ),
              //       ),
              //     ),
              //   ),
              // if (arguments['Rname'] != 'Individual')
              //   Transform.translate(
              //     offset: Offset(331.w, 592.h),
              //     child:
              //         // Adobe XD layer: 'caret-down' (shape)
              //         Container(
              //       width: 20.w,
              //       height: 20.h,
              //       decoration: BoxDecoration(
              //         image: DecorationImage(
              //           image: const AssetImage('assets/images/caret-down.png'),
              //           fit: BoxFit.fill,
              //         ),
              //       ),
              //     ),
              //   ),
              Transform.translate(
                offset: Offset(227.w, 380.h),
                child: Container(
                  width: 141.w,
                  height: 52.h,
                  decoration: BoxDecoration(
                    color: const Color(0xff73eef4),
                    border:
                        Border.all(width: 1.0, color: const Color(0xff707070)),
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(248.w, 394.h),
                child: InkWell(
                  onTap: () {
                    print('Hello Verify Otp');
                    verifyOTP(context);
                    // _auth.verifyPhoneNumber(phoneNumber: phoneNumber, verificationCompleted: verificationCompleted, verificationFailed: verificationFailed, codeSent: codeSent, codeAutoRetrievalTimeout: codeAutoRetrievalTimeout)
                  },
                  child: isOtpVerified == true
                      ? Text(
                          'VERIFYING...',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 14.sp,
                            color: const Color(0x73000000),
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.left,
                        )
                      : Text(
                          'VERIFY OTP',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 14.sp,
                            color: const Color(0x73000000),
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.left,
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
