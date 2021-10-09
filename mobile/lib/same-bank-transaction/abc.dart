// import 'package:flutter/material.dart';
// import 'package:mobile/same-bank-transaction/wel_page.dart';
// // import 'package:passing_data/ToDoDetail.dart';
// // import 'package:passing_data/Todo.dart';
// // import 'package:passing_data/WelcomePage.dart';

// void main() {
//   runApp(MyAppx());
// }

// class MyAppx extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Formx(),
//     );
//   }
// }

// class Formx extends StatefulWidget {
//   const Formx({Key? key}) : super(key: key);

//   @override
//   _FormxState createState() => _FormxState();
// }

// class _FormxState extends State<Formx> {
//   TextEditingController _name = TextEditingController();
//   TextEditingController _email = TextEditingController();
//   TextEditingController _phone = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 controller: _name,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Enter your Name'
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 controller: _email,
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Enter your Email'
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 controller: _phone,
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Enter your Phone No'
//                 ),
//               ),
//             ),
//             ElevatedButton(onPressed: (){

//               Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WelcomePage(name1: _name.text, email: _email.text, phone: _phone.text)));

//             }, child: Text('Go Next Page'))
//           ],
//         ),
//       ),
//     );
//   }
// }