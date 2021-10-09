// ignore: unused_import

class MenuData{

  final String dash_title, dash_image, dash_url;

  MenuData({required this.dash_title, required this.dash_image, required this.dash_url});
}

List<MenuData> menuDatas = [
  MenuData(
    dash_title: "Account Balance",
    dash_image: "images/accbal.png",
    dash_url: "AccountBalance()",
  ),
  MenuData(
    dash_title: "Transfer Services",
    dash_image: "images/montra.png",
    dash_url: "TransferServices()",
  ),
  MenuData(
    dash_title: "Bill Payments",
    dash_image: "images/billpay.png",
    dash_url: "BillPayments()",
  ),
  MenuData(
    dash_title: "Cheque Services",
    dash_image: "images/cheser.png",
    dash_url: "ChequeServices()",
  ),
  MenuData(
    dash_title: "Settings",
    dash_image: "images/settings.png",
    dash_url: "Settings()",
  ),
];
