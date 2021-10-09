import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mobile/dashboard.dart';
import 'package:mobile/signin.dart';
import 'package:mobile/verify_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Service {
  Dio dio = new Dio();
  register(userAccType, userAccNumber, userIdType, userIdNumber, userEmail,
      userPhone, userPassword, userConfirmPassword) async {
    try {
      return await dio.post('http://10.0.2.2:5000/user/userregister',
          data: {
            'userAccType': userAccType,
            'userAccNumber': userAccNumber,
            'userIdType': userIdType,
            'userIdNumber': userIdNumber,
            'userEmail': userEmail,
            'userPhone': userPhone,
            'userPassword': userPassword,
            'userConfirmPassword': userConfirmPassword
          },
          options: Options(contentType: Headers.jsonContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: 'Error',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  login(userEmail, userPhone, userPassword) async {
    try {
      return await dio.post('http://10.0.2.2:5000/user/userlogin',
          data: {
            'userEmail': userEmail,
            'userPhone': userPhone,
            'userPassword': userPassword,
          },
          options: Options(contentType: Headers.jsonContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: 'Error',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  asyncFunc() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getString('token') != null) {
      return null;
    } else {
      Get.off(() => Signin());
    }
  }

  signout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString('token'));
    prefs.remove('token');
    Get.off(() => Signin());
  }

  otpsms(userPhone) async {
    try {
      return await dio.post('http://10.0.2.2:5000/user/otpsms',
          data: {
            'userPhone': userPhone,
          },
          options: Options(contentType: Headers.jsonContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: 'Error',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  verifyotpsms(otp) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString('phone'));
    try {
      return await dio.post(
        'http://10.0.2.2:5000/user/verifyotpsms',
        data: {
          'userPhone': prefs.getString('phone'),
          'otp': otp,
        },
        options: Options(contentType: Headers.jsonContentType),
        );
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: 'Error',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    
  }

  emailverify(userEmail) async{
     try {
      return await dio.post(
        'http://10.0.2.2:5000/user/forgotpassword',
        data: {
          'userEmail': 'userEmail',
        },
        options: Options(contentType: Headers.jsonContentType),
        );
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: 'Error',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  emailotpverify(userEmail, otp) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
     try {
      return await dio.post(
        'http://10.0.2.2:5000/user/forgotpasswordotp',
        data: {
          'userEmail': prefs.getString('email'),
          'otp': otp,
        },
        options: Options(contentType: Headers.jsonContentType),
        );
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: 'Error',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  sendotp() async {

  }

  resetpassword(userPassword, userConfirmPassword) async{
     try {
      return await dio.post(
        'http://10.0.2.2:5000/user/resetpassword',
        data: {
          'userPassword': userPassword,
          'userConfirmPassword': userConfirmPassword,
        },
        options: Options(contentType: Headers.jsonContentType),
        );
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: 'Error',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }


}
