class LoginModel {


  String? intMpoType;
  String? lngUniqueNo;
  String? strLedgerName;
  String? strMobileNo;
  String? strResponse;
  String? strSecurityCode;
  String? strTeritorryCode;
  String? strTeritorryName;
  String? strUserID;
  String? strUserPassword;

  LoginModel({required this.intMpoType, required this.lngUniqueNo,required this.strLedgerName, required this.strMobileNo, required this.strResponse, required this.strSecurityCode,
  required this.strTeritorryCode, required this.strTeritorryName, required this.strUserID, required this.strUserPassword});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      intMpoType: json['intMpoType'].toString(),
      lngUniqueNo: json['lngUniqueNo'].toString(),
      strLedgerName: json['strLedgerName'].toString(),
      strMobileNo: json['strMobileNo'].toString(),
      strResponse: json['strResponse'].toString(),
      strSecurityCode: json['strSecurityCode'].toString(),
      strTeritorryCode: json['strTeritorryCode'].toString(),
      strTeritorryName: json['strTeritorryName'].toString(),
      strUserID: json['strUserID'].toString(),
      strUserPassword: json['strUserPassword'].toString(),
    );
  }

  set id(int? id) {}

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
    'intMpoType': intMpoType,
    'lngUniqueNo': lngUniqueNo,
    'strLedgerName': strLedgerName,
    'strMobileNo': strMobileNo,
    'strResponse': strResponse,
    'strSecurityCode': strSecurityCode,
    'strTeritorryCode': strTeritorryCode,
    'strTeritorryName': strTeritorryName,
    'strUserID': strUserID,
    'strUserPassword': strUserPassword,
    };
    return map;
  }

  LoginModel.fromMap(Map<String, dynamic> res)
      : intMpoType = res["intMpoType"],
        lngUniqueNo = res["lngUniqueNo"],
        strLedgerName = res["strLedgerName"],
        strMobileNo = res["strMobileNo"],
        strResponse = res["strResponse"],
        strSecurityCode = res["strSecurityCode"],
        strTeritorryCode = res["strTeritorryCode"],
        strTeritorryName = res["strTeritorryName"],
        strUserID = res["strUserID"],
        strUserPassword = res["strUserPassword"];


}
