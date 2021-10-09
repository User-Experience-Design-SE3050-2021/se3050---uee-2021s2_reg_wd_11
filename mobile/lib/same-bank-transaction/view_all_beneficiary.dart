import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/same-bank-transaction/edit_favorite_beneficiary.dart';
import 'package:mobile/same-bank-transaction/sb_beneficiary.dart';
import 'package:mobile/same-bank-transaction/wel_page.dart';

void main() {
  runApp(MyApp2());
}

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ViewAllBeneficiarySB(),
    );
  }
}

class ViewAllBeneficiarySB extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ViewAllBeneficiarySBState();
  }
}

class _ViewAllBeneficiarySBState extends State<ViewAllBeneficiarySB> {
  Future<List<Sb_Beneficary_Main>> listDataJSON() async {
    final url = Uri.parse(
        "http://localhost:5000/same-bank-beneficiary/get-all-beneficiaries/0776572518");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List listData = json.decode(response.body);
      return listData
          .map((listData) => new Sb_Beneficary_Main.fromJson(listData))
          .toList();
    } else {
      throw Exception("Error");
    }
  }

  Color textfieldcolor = Colors.blue;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "View All Inventries",
        ),
      ),
      body: FutureBuilder<List<Sb_Beneficary_Main>>(
          future: listDataJSON(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return new ListView.builder(
                  itemCount: snapshot.data!.length,
                  padding: EdgeInsets.all(10),
                  itemBuilder: (BuildContext context, int currentIndex) {
                    return Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      height: 160,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: <Widget>[
                          Container(
                            height: 136,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 15),
                                    blurRadius: 27,
                                    color: Colors.black12)
                              ],
                            ),
                            child: Container(
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  color: Colors.blue.shade50,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              height: 50,
                              width: 200,
                              child: FlatButton(
                                  color: Colors.blue.shade600,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EditFavoriteBeneficiarySB(
                                                beneficiary_account_name: snapshot
                                                    .data![currentIndex]
                                                    .beneficiary_account_name,
                                                beneficiary_account_number: snapshot
                                                    .data![currentIndex]
                                                    .beneficiary_account_number,
                                                beneficiary_email: snapshot
                                                    .data![currentIndex]
                                                    .beneficiary_email,
                                                beneficiary_mobile: snapshot
                                                    .data![currentIndex]
                                                    .beneficiary_mobile,
                                              )),
                                    );
                                  },
                                  child: Text(
                                    "Edit",
                                    style: GoogleFonts.workSans(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                        color: Colors.white),
                                  )),
                            ),
                          ),
                          Positioned(
                            top: 90,
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              height: 50,
                              width: 200,
                              child: FlatButton(
                                  color: Colors.blue.shade600,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  onPressed: () {},
                                  child: Text(
                                    "Delete",
                                    style: GoogleFonts.workSans(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                        color: Colors.white),
                                  )),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            child: SizedBox(
                              height: 136,
                              width: size.width - 200,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Text(
                                      snapshot.data![currentIndex]
                                          .beneficiary_account_name,
                                      style: GoogleFonts.acme(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                              bottom: 0,
                              left: 0,
                              child: SizedBox(
                                height: 136,
                                width: size.width - 200,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 80),
                                      child: Text(
                                        snapshot.data![currentIndex]
                                            .beneficiary_account_number,
                                        style: GoogleFonts.acme(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                            color: Colors.black),
                                      ),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                              ))
                        ],
                      ),
                    );
                  });
            }
          }),
    );
  }
}


// return Column(

//                       children: [
                        
//                         Row(
//                           children: [
//                             Container(
//                               child : Container (
//                                   color: Colors.blue.shade50,
//                                   margin: EdgeInsets.only(
//                                   top: 10.0,
//                                   bottom: 10.0,
//                                   left: 20.0,
//                                   right: 16.0),
//                                   width: 970.0,
//                                   height: 100.0,
                              
                              
//                               child: Padding(
//                                 padding: const EdgeInsets.only(top: 40.0,bottom: 20.0,left: 40.0,right: 40.0),
                                
//                                 child: Text(
//                                   snapshot.data![currentIndex].item_name,
//                                   style: TextStyle(
//                                     fontSize: 20.0,
//                                   ),
//                                   overflow: TextOverflow.ellipsis,
//                                 ),
//                               ),
//                                ),
//                             ),
//                           ],
//                         ),
//                         Divider(),
//                       ],
//                     );