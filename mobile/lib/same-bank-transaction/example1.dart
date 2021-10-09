// // ignore: unused_import
// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:http/http.dart' as http;
// import 'package:google_fonts/google_fonts.dart';
// import 'package:mobile/dashboard.dart';
// import 'package:mobile/same-bank-transaction/sb_beneficiary.dart';
// import 'package:mobile/same-bank-transaction/wel_page.dart';
// import 'package:mobile/signin.dart';

// class Example1 extends StatefulWidget {
//   const Example1({Key? key}) : super(key: key);

//   @override
//   _Example1State createState() => _Example1State();
// }

// class _Example1State extends State<Example1> {
//   final _formKey = GlobalKey<FormState>();
//   TextEditingController beneficiary_account_name = TextEditingController();

//   // List<String> AccType = ['YES', 'Jana Jaya', 'Vanitha Vasana'];
//   // String? selectAccType;

//   // List<String> IdType = ['National ID Number', 'Passport'];
//   // String? selectIdType;
//   // Future save() async {
//   //   await http.post(
//   //     Uri.parse(
//   //         'http://localhost:5000/same-bank-beneficiary/insert-beneficiary'),
//   //     headers: <String, String>{
//   //       'Content-Type': 'application/json; charset=UTF-8',
//   //     },
//   //     body: jsonEncode(<String, String>{
//   //       'beneficiary_account_name': sb_beneficiary.beneficiary_account_name,
//   //       'beneficiary_account_number': sb_beneficiary.beneficiary_account_number,
//   //       'beneficiary_email': sb_beneficiary.beneficiary_email,
//   //       'beneficiary_mobile': sb_beneficiary.beneficiary_mobile,
//   //       'account_mobile': '0776572518',
//   //     }),
//   //   );

//   // }

//   Sb_Beneficiary sb_beneficiary = Sb_Beneficiary("", "", "", "", "");
//   Color textfieldcolor = Colors.black;
//   // #FFC107

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;

//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         centerTitle: true,
//         title: Text(
//           "Add Favorite Beneficiary",
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           color: Colors.amber,
//           height: size.height * 1.1,
//           child: Column(
//             children: [
//               Container(
//                 color: Colors.amber,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                 ),
//               ),
//               Expanded(
//                   child: Container(
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(10),
//                               topRight: Radius.circular(10))),
//                       child: Form(
//                         key: _formKey,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.all(10.0),
//                               child: SizedBox(
//                                   height: size.height / 3,
//                                   width: size.width,
//                                   child: Image.asset(
//                                       "images/add_beneficiary_sb.png")),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(16.0),
//                               child: TextFormField(
//                                 controller: TextEditingController(
//                                     text: sb_beneficiary
//                                         .beneficiary_account_name),
//                                 onChanged: (value) {
//                                   sb_beneficiary.beneficiary_account_name =
//                                       value;
//                                 },
//                                 validator: (value) {
//                                   if (value!.isEmpty) {
//                                     return 'Please enter name';
//                                   }
//                                   return null;
//                                 },
//                                 style: TextStyle(color: Colors.black),
//                                 decoration: InputDecoration(
//                                   prefixIcon: Image.asset("icons/idtype.png"),
//                                   labelText: "Beneficiary Account Name",
//                                   labelStyle: GoogleFonts.montserrat(
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 18,
//                                       color: textfieldcolor),
//                                   fillColor: Colors.amber.shade50,
//                                   filled: true,
//                                   focusedBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(30.0),
//                                     borderSide: BorderSide(
//                                       color: Colors.amber,
//                                     ),
//                                   ),
//                                   errorBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(30.0),
//                                     borderSide: BorderSide(
//                                       color: Colors.deepOrange,
//                                     ),
//                                   ),
//                                   focusedErrorBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(30.0),
//                                     borderSide: BorderSide(
//                                       color: Colors.deepOrange,
//                                     ),
//                                   ),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(30.0),
//                                     borderSide: BorderSide(
//                                       color: Colors.transparent,
//                                       width: 2.0,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             // Padding(
//                             //   padding:
//                             //       EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
//                             //   child: TextField(
//                             //     controller: TextEditingController(
//                             //         text: sb_beneficiary.beneficiary_account_name),
//                             //     onChanged: (value) {
//                             //       sb_beneficiary.beneficiary_account_name = value;
//                             //     },
//                             //     autofocus: true,
//                             //     decoration: InputDecoration(
//                             //         enabledBorder: UnderlineInputBorder(
//                             //             borderSide: BorderSide(
//                             //                 color: Colors.indigo, width: 1.0)),
//                             //         labelText: "Last Name",
//                             //         labelStyle: TextStyle(
//                             //             color: Colors.indigo,
//                             //         // fontSize: labelFont
//                             //         ),
//                             //         focusedBorder: UnderlineInputBorder(
//                             //             borderSide: BorderSide(
//                             //                 color: Colors.indigo, width: 1.5))),
//                             //   ),
//                             // ),
//                             Padding(
//                               padding:
//                                   const EdgeInsets.fromLTRB(16, 20, 16, 20),
//                               child: Container(
//                                 height: 60,
//                                 width: 400,
//                                 child: FlatButton(
//                                     color: Colors.amber,
//                                     shape: RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(30.0)),
//                                     onPressed: () {
//                                       Navigator.of(context).push(
//                                         // MaterialPageRoute(builder: (context) => Dashboard()),
//                                         MaterialPageRoute(
//                                             builder: (context) => WelcomePage(
//                                                 beneficiary_account_name:
//                                                     sb_beneficiary.beneficiary_account_name
//                                                         )),
//                                       );
//                                     },
//                                     child: Text(
//                                       "Add Inventry",
//                                       style: GoogleFonts.workSans(
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 24,
//                                           color: Colors.white),
//                                     )),
//                               ),
//                             ),
//                           ],
//                         ),
//                       )))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
