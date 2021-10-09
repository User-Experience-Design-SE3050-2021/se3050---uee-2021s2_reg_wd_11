import 'package:flutter/material.dart';
import 'package:mobile/same-bank-transaction/sb_beneficiary.dart';

class WelcomePage extends StatelessWidget {
  String beneficiary_account_name;
  String beneficiary_email;
  WelcomePage(
      {Key? key,
      required this.beneficiary_account_name,
      required this.beneficiary_email})
      : super(key: key);

  Sb_Beneficiary sb_beneficiary = Sb_Beneficiary("", "", "", "", "");
  @override
  Widget build(BuildContext context) {
    print(beneficiary_account_name);
    return Scaffold(
      body: Center(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: $beneficiary_account_name'),
              // TextFormField(
              //   onChanged: (beneficiary_account_name) {
              //     sb_beneficiary.beneficiary_account_name = beneficiary_account_name;

              //   },
              //   controller: TextEditingController(
              //                       text:
              //                           beneficiary_account_name),
              // ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller:
                      TextEditingController(text: beneficiary_account_name),
                  onChanged: (value) {
                    sb_beneficiary.beneficiary_account_name = value;
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
                    labelText: "Beneficiary Account Name",
                    // labelStyle: GoogleFonts.montserrat(
                    //     fontWeight: FontWeight.w500,
                    //     fontSize: 18,
                    //     color: textfieldcolor),
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
                  controller:
                      TextEditingController(text: beneficiary_email),
                  onChanged: (value) {
                    sb_beneficiary.beneficiary_email = value;
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
                    labelText: "Beneficiary Account Name",
                    // labelStyle: GoogleFonts.montserrat(
                    //     fontWeight: FontWeight.w500,
                    //     fontSize: 18,
                    //     color: textfieldcolor),
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
              //Text('Email: $email'),
              //Text('Phone: $phone'),
            ],
          ),
        ),
      ),
    );
  }
}
