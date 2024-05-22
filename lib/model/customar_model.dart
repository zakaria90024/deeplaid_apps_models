import 'package:flutter/cupertino.dart';

// @immutable
// class Customar {
//   const Customar({
//     required this.strCustomerName,
//     required this.strPhone,
//   });
//
//   final String strCustomerName;
//   final String strPhone;
//
//   @override
//   String toString() {
//     return '$strCustomerName, $strPhone';
//   }
//
//   @override
//   bool operator ==(Object other) {
//     if (other.runtimeType != runtimeType) {
//       return false;
//     }
//     return other is Customar && other.strCustomerName == strCustomerName && other.strPhone == strPhone;
//   }
//
//   @override
//   int get hashCode => Object.hash(strPhone, strCustomerName);
// }
class Customar {
  late String strCustomerName;
  late String strPhone;

  Customar({ required this.strCustomerName, required this.strPhone});

  Map<String, dynamic> mapStudent() {
    return {
      'strCustomerName': strCustomerName,
      'strPhone': strPhone,

    };
  }
  factory Customar.fromMap(Map<String, dynamic> map) {
    return Customar(
      strCustomerName: map['strCustomerName'],
      strPhone: map['strPhone'],
    );
  }

  String get getStrMerzeName => strCustomerName;

  set setStrMerzeName(String value) {
    strCustomerName = value;
  }

  String get getInttype => strPhone;

  set setInttype(String value) {
    strPhone = value;
  }


  // @override
  // String toString() {
  //   return '$strCustomerName, $strPhone';
  // }
  //
  // @override
  // bool operator ==(Object other) {
  //   if (other.runtimeType != runtimeType) {
  //     return false;
  //   }
  //   return other is Customar && other.strCustomerName == strCustomerName && other.strPhone == strPhone;
  // }
  //
  // @override
  // int get hashCode => Object.hash(strPhone, strCustomerName);

}


// class Customar {
//   String? mpo;
//   String strCustomerName;
//   String? strPhone;
//   String? straddress;

  // Customar(
  //     { this.mpo, required this.strCustomerName, required this.straddress, required this.strPhone});
  //
  // factory Customar.fromJson(Map<String, dynamic> json) {
  //   return Customar(
  //
  //     mpo: json['mpo'],
  //     strCustomerName: json['strCustomerName'],
  //     straddress: json['straddress'],
  //     strPhone: json['strPhone'],
  //
  //   );
  // }
  //
  // set id(int? id) {}
  //
  // Map<String, dynamic> toMap() {
  //   var map = <String, dynamic>{
  //     'mpo': mpo,
  //     'doctorName': strCustomerName,
  //     'doctorAddress': straddress,
  //     'doctorPhone': strPhone,
  //   };
  //   return map;
  // }

  // Customar.fromMap(dynamic res)
  // {
  //   this.mpo = res['mpo'];
  //   this.strCustomerName = res['doctorName'].toString();
  //   this.straddress = res['doctorAddress'].toString();
  //   this.strPhone = res['doctorPhone'].toString();
  // }
//}
