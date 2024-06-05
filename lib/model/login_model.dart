class LoginModel {
  String? intMpoType;
  String? strLedgerName;
  String? strMobileNo;
  String? strResponse;
  String? strSecurityCode;
  String? strTeritorryCode;
  String? strTeritorryName;
  String? strUserID;
  String? strUserPassword;
  String? strRole;
  String? strTeam;
  String? strZone;
  String? strTeamZone;
  String? strbranchID;
  String? strMerzeName;


  // static const String strUserID = "strUserID";
  // static const String intMpoType = "intMpoType";
  // static const String strCardNo = "strCardNo";
  // static const String strArea = "strArea";
  // static const String strDivision = "strDivision";
  // static const String strMerzeName = "strMerzeName";
  // static const String strMobileNo = "strMobileNo";
  // static const String strUserPassword = "strUserPassword";
  // static const String strRole = "strRole";
  // static const String strTeamZone = "strRole";
  //static const String strbranchID = "strbranchID";


  LoginModel(
      {required this.intMpoType,
      required this.strLedgerName,
      required this.strMobileNo,
      required this.strResponse,
      required this.strTeritorryCode,
      required this.strTeritorryName,
      required this.strUserID,
      required this.strUserPassword,
      required this.strRole,
      required this.strTeamZone,
      required this.strbranchID,
      required this.strMerzeName

      });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      intMpoType: json['intMpoType'].toString(),
      strLedgerName: json['strLedgerName'].toString(),
      strMobileNo: json['strMobileNo'].toString(),
      strResponse: json['strResponse'].toString(),
      strTeritorryCode: json['strTeritorryCode'].toString(),
      strTeritorryName: json['strTeritorryName'].toString(),
      strUserID: json['strUserID'].toString(),
      strRole: json['strRole'].toString(),
      strUserPassword: json['strUserPassword'].toString(),
      strTeamZone: json['strTeamZone'].toString(),
      strbranchID: json['strbranchID'].toString(),
      strMerzeName: json['strMerzeName'].toString(),
    );
  }

  set id(int? id) {}

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'intMpoType': intMpoType,
      'strLedgerName': strLedgerName,
      'strMobileNo': strMobileNo,
      'strResponse': strResponse,
      'strTeritorryCode': strTeritorryCode,
      'strTeritorryName': strTeritorryName,
      'strUserID': strUserID,
      'strRole': strRole,
      'strUserPassword': strUserPassword,
      'strTeamZone': strTeamZone,
      'strbranchID': strbranchID,
      'strMerzeName': strMerzeName,
    };
    return map;
  }

  LoginModel.fromMap(Map<String, dynamic> res)
      : intMpoType = res["intMpoType"],
        strLedgerName = res["strLedgerName"],
        strMobileNo = res["strMobileNo"],
        strResponse = res["strResponse"],
        strTeritorryCode = res["strTeritorryCode"],
        strTeritorryName = res["strTeritorryName"],
        strRole = res["strRole"],
        strUserID = res["strUserID"],
        strTeamZone = res["strTeamZone"],
        strUserPassword = res["strUserPassword"],
        strbranchID = res["strbranchID"],
        strMerzeName = res["strMerzeName"];
}
