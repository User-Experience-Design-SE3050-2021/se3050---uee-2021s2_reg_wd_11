// ignore: unused_import
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/dashboard.dart';
import 'package:mobile/service_register.dart';
import 'package:mobile/signin.dart';

class OnetimePayment extends StatefulWidget {
  const OnetimePayment({Key? key}) : super(key: key);

  @override
  _OnetimePaymentState createState() => _OnetimePaymentState();
}

class _OnetimePaymentState extends State<OnetimePayment> {
  final _formKey = GlobalKey<FormState>();

  var userAccType,
      userAccNumber,
      userIdType,
      userIdNumber,
      userEmail,
      userPhone,
      userPassword,
      userConfirmPassword;

  List<String> AccType = ['YES', 'Jana Jaya', 'Vanitha Vasana'];
  String? selectAccType;

  List<String> IdType = ['National ID Number', 'Passport'];
  String? selectIdType;

  Color textfieldcolor = Colors.black;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Sign Up",
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.amber,
          height: size.height * 1.8,
          child: Column(
            children: [
              Container(
                color: Colors.amber,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
              Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SizedBox(
                                  height: size.height / 3,
                                  width: size.width,
                                  child: Image.asset("images/payments_m.png")),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                  prefixIcon:
                                      Image.asset('icons/accounttype.png'),
                                  hintTextDirection: null,
                                  fillColor: Colors.black12,
                                  filled: true,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide(
                                      color: Colors.amber,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide(
                                      color: Colors.deepOrange,
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide(
                                      color: Colors.deepOrange,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                                isExpanded: true,
                                dropdownColor: Colors.amber.shade50,
                                hint: Text('From Account',
                                    textDirection: null,
                                    style: GoogleFonts.montserrat(
                                        fontSize: 16, color: textfieldcolor)),
                                value: selectAccType,
                                onChanged: (newValue) {
                                  setState(() {
                                    selectAccType = newValue as String?;
                                    userAccType = selectAccType;
                                  });
                                },
                                validator: (value) {
                                  if (value == null) {
                                    return 'Please select an account type';
                                  } else {
                                    return null;
                                  }
                                },
                                items: AccType.map((accountType) {
                                  return DropdownMenuItem(
                                    child: new Text(accountType,
                                        style: GoogleFonts.montserrat(
                                            fontSize: 16,
                                            color: textfieldcolor)),
                                    value: accountType,
                                  );
                                }).toList(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: TextFormField(
                                controller:
                                    TextEditingController(text: userAccNumber),
                                onChanged: (value) {
                                  userAccNumber = value;
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter account number';
                                  } else if (value.length != 16) {
                                    return 'Please enter valid Account number';
                                  }
                                  return null;
                                },
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  prefixIcon:
                                      Image.asset("icons/accountnumber.png"),
                                  labelText: "Account number",
                                  labelStyle: GoogleFonts.montserrat(
                                      fontSize: 16, color: textfieldcolor),
                                  fillColor: Colors.black12,
                                  filled: true,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide(
                                      color: Colors.amber,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide(
                                      color: Colors.deepOrange,
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide(
                                      color: Colors.deepOrange,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                  prefixIcon: Image.asset('icons/idtype.png'),
                                  hintTextDirection: null,
                                  fillColor: Colors.black12,
                                  filled: true,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide(
                                      color: Colors.amber,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide(
                                      color: Colors.deepOrange,
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide(
                                      color: Colors.deepOrange,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                                dropdownColor: Colors.amber.shade50,
                                isExpanded: true,
                                hint: Text('Service Provider',
                                    textDirection: null,
                                    style: GoogleFonts.montserrat(
                                        fontSize: 16, color: textfieldcolor)),
                                value: selectIdType,
                                onChanged: (newValue) {
                                  setState(() {
                                    selectIdType = newValue as String?;
                                    userIdType = selectIdType;
                                  });
                                },
                                validator: (value) {
                                  if (value == null) {
                                    return 'Please select an identity type';
                                  } else {
                                    return null;
                                  }
                                },
                                items: IdType.map((idType) {
                                  return DropdownMenuItem(
                                    child: new Text(idType,
                                        style: GoogleFonts.montserrat(
                                            fontSize: 16,
                                            color: textfieldcolor)),
                                    value: idType,
                                  );
                                }).toList(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: TextFormField(
                                controller:
                                    TextEditingController(text: userPhone),
                                onChanged: (value) {
                                  userPhone = value;
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter contact number';
                                  }
                                  return null;
                                },
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  prefixIcon: Image.asset("icons/phone.png"),
                                  labelText: "Reference number",
                                  labelStyle: GoogleFonts.montserrat(
                                      fontSize: 16, color: textfieldcolor),
                                  fillColor: Colors.black12,
                                  filled: true,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide(
                                      color: Colors.amber,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide(
                                      color: Colors.deepOrange,
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide(
                                      color: Colors.deepOrange,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: TextFormField(
                                controller:
                                    TextEditingController(text: userPhone),
                                onChanged: (value) {
                                  userPhone = value;
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter contact number';
                                  }
                                  return null;
                                },
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  prefixIcon: Image.asset("icons/phone.png"),
                                  labelText: "Amount",
                                  labelStyle: GoogleFonts.montserrat(
                                      fontSize: 16, color: textfieldcolor),
                                  fillColor: Colors.black12,
                                  filled: true,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide(
                                      color: Colors.amber,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide(
                                      color: Colors.deepOrange,
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide(
                                      color: Colors.deepOrange,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 20, 10, 20),
                              child: Container(
                                height: 60,
                                width: 400,
                                child: FlatButton(
                                    color: Colors.amber,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0)),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        Service()
                                            .register(
                                                userAccType,
                                                userAccNumber,
                                                userIdType,
                                                userIdNumber,
                                                userEmail,
                                                userPhone,
                                                userPassword,
                                                userConfirmPassword)
                                            .then((val) {
                                          if (val.data['success']) {
                                            Fluttertoast.showToast(
                                                msg: "Authenticated",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.CENTER,
                                                timeInSecForIosWeb: 4,
                                                backgroundColor: Colors.red,
                                                textColor: Colors.white,
                                                fontSize: 16.0);
                                            Navigator.push(
                                                context,
                                                new MaterialPageRoute(
                                                    builder: (context) =>
                                                        Dashboard()));
                                          } else {
                                            Fluttertoast.showToast(
                                                msg:
                                                    "Invalid email or password!",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.CENTER,
                                                timeInSecForIosWeb: 4,
                                                backgroundColor: Colors.red,
                                                textColor: Colors.white,
                                                fontSize: 16.0);
                                          }
                                        });
                                      } else {
                                        print("Email or Password ");
                                      }
                                    },
                                    child: Text(
                                      "Sign Up",
                                      style: GoogleFonts.workSans(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24,
                                          color: Colors.white),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
