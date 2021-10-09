// ignore: unused_import
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/dashboard.dart';
import 'package:mobile/payments/favorite_bill_model.dart';
import 'package:mobile/signin.dart';

class AddFavoriteBillPayment extends StatefulWidget {
  const AddFavoriteBillPayment({Key? key}) : super(key: key);

  @override
  _AddFavoriteBillPaymentState createState() => _AddFavoriteBillPaymentState();
}

class _AddFavoriteBillPaymentState extends State<AddFavoriteBillPayment> {
  final _formKey = GlobalKey<FormState>();
  var userAccType;
  List<String> BillType = ['Dialog Television', 'Dialog Mobile', 'Dialog Broadband'];
  String? selectBillType;

  // List<String> IdType = ['National ID Number', 'Passport'];
  // String? selectIdType;
  Future save() async {
    await http.post(
      Uri.parse('http://localhost:5000/bill/add'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'serviceProvider': favorite_bill_model.serviceProvider,
        'payeeDescription': favorite_bill_model.payeeDescription,
        'referenceNumber': favorite_bill_model.referenceNumber,
      }),
    );
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Dashboard()),
    );
  }

  Favorite_Bill_Model favorite_bill_model = Favorite_Bill_Model("", "", "");
  Color textfieldcolor = Colors.black;
  // #FFC107

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Add Favorite Beneficiary",
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.amber,
          height: size.height * 1.0,
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
                                  child:
                                      Image.asset("images/add_fav_bill.png")),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.all(16.0),
                            //   child: DropdownButtonFormField(
                            //     decoration: InputDecoration(
                            //       prefixIcon:
                            //           Image.asset('icons/accounttype.png'),
                            //       hintTextDirection: null,
                            //       fillColor: Colors.black12,
                            //       filled: true,
                            //       focusedBorder: OutlineInputBorder(
                            //         borderRadius: BorderRadius.circular(30.0),
                            //         borderSide: BorderSide(
                            //           color: Colors.amber,
                            //         ),
                            //       ),
                            //       errorBorder: OutlineInputBorder(
                            //         borderRadius: BorderRadius.circular(30.0),
                            //         borderSide: BorderSide(
                            //           color: Colors.deepOrange,
                            //         ),
                            //       ),
                            //       focusedErrorBorder: OutlineInputBorder(
                            //         borderRadius: BorderRadius.circular(30.0),
                            //         borderSide: BorderSide(
                            //           color: Colors.deepOrange,
                            //         ),
                            //       ),
                            //       enabledBorder: OutlineInputBorder(
                            //         borderRadius: BorderRadius.circular(30.0),
                            //         borderSide: BorderSide(
                            //           color: Colors.transparent,
                            //           width: 2.0,
                            //         ),
                            //       ),
                            //     ),
                            //     isExpanded: true,
                            //     dropdownColor: Colors.amber.shade50,
                            //     hint: Text('Service Provider',
                            //         textDirection: null,
                            //         style: GoogleFonts.montserrat(
                            //             fontSize: 16, color: textfieldcolor)),
                            //     value: selectBillType,
                            //     onChanged: (newValue) {
                            //       setState(() {
                            //         selectBillType = newValue as String?;
                            //         userAccType = selectBillType;
                            //       });
                            //     },
                            //     validator: (value) {
                            //       if (value == null) {
                            //         return 'Please select an account type';
                            //       } else {
                            //         return null;
                            //       }
                            //     },
                            //     items: BillType.map((serviceProvider) {
                            //       return DropdownMenuItem(
                            //         child: new Text(serviceProvider,
                            //             style: GoogleFonts.montserrat(
                            //                 fontSize: 16,
                            //                 color: textfieldcolor)),
                            //         value: favorite_bill_model.serviceProvider,
                            //       );
                            //     }).toList(),
                            //   ),
                            // ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: TextFormField(
                                controller: TextEditingController(
                                    text: favorite_bill_model
                                        .serviceProvider),
                                onChanged: (value) {
                                  favorite_bill_model.serviceProvider =
                                      value;
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter name';
                                  }
                                  return null;
                                },
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  prefixIcon: Image.asset("icons/idtype.png"),
                                  labelText: "Payee Description",
                                  labelStyle: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: textfieldcolor),
                                  fillColor: Colors.amber.shade50,
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
                                controller: TextEditingController(
                                    text: favorite_bill_model
                                        .payeeDescription),
                                onChanged: (value) {
                                  favorite_bill_model.payeeDescription =
                                      value;
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter name';
                                  }
                                  return null;
                                },
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  prefixIcon: Image.asset("icons/idtype.png"),
                                  labelText: "Payee Description",
                                  labelStyle: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: textfieldcolor),
                                  fillColor: Colors.amber.shade50,
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
                                controller: TextEditingController(
                                    text: favorite_bill_model
                                        .referenceNumber),
                                onChanged: (value) {
                                  favorite_bill_model.referenceNumber =
                                      value;
                                },
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter reference number';
                                  } else if (value.length != 10) {
                                    return 'Please enter valid reference number';
                                  }
                                  return null;
                                },
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  prefixIcon:
                                      Image.asset("icons/accountnumber.png"),
                                  labelText: "Reference Number",
                                  labelStyle: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: textfieldcolor),
                                  fillColor: Colors.amber.shade50,
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
                                  const EdgeInsets.fromLTRB(16, 20, 16, 20),
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
                                        save();
                                      } else {
                                        print("no");
                                      }
                                    },
                                    child: Text(
                                      "Add Inventry",
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
