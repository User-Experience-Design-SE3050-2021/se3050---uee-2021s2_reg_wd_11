// ignore_for_file: unused_field

class Sb_Beneficiary {
  String beneficiary_account_name;
  String beneficiary_account_number;
  String beneficiary_email;
  String beneficiary_mobile;
  String account_mobile;

  Sb_Beneficiary(
    this.beneficiary_account_name,
    this.beneficiary_account_number,
    this.beneficiary_email,
    this.beneficiary_mobile,
    this.account_mobile,
  );
}

class Sb_Beneficary_Main {
  final String beneficiary_account_name;
  final String beneficiary_account_number;
  final String beneficiary_email;
  final String beneficiary_mobile;
  final String account_mobile;

  Sb_Beneficary_Main({
    required this.beneficiary_account_name,
    required this.beneficiary_account_number,
    required this.beneficiary_email,
    required this.beneficiary_mobile,
    required this.account_mobile,
  });

  factory Sb_Beneficary_Main.fromJson(Map<String, dynamic> json) {
    return Sb_Beneficary_Main(
      beneficiary_account_name: json['beneficiary_account_name'],
      beneficiary_account_number: json['beneficiary_account_number'],
      beneficiary_email: json['beneficiary_email'],
      beneficiary_mobile: json['beneficiary_mobile'],
      account_mobile: json['account_mobile'],
    );
  }
}

class Sb_Beneficiary_Update {
  String id;
  String beneficiary_account_name;
  String beneficiary_account_number;
  String beneficiary_email;
  String beneficiary_mobile;
  String account_mobile;

  Sb_Beneficiary_Update(
    this.id,
    this.beneficiary_account_name,
    this.beneficiary_account_number,
    this.beneficiary_email,
    this.beneficiary_mobile,
    this.account_mobile,
  );
}
