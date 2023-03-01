class DoctorModel {
  String? mpo;
  String? strCustomerName;
  String? strPhone;
  String? straddress;

  DoctorModel({required this.mpo, required this.strCustomerName,required this.straddress, required this.strPhone});

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      mpo: json['mpo'],
      strCustomerName: json['strCustomerName'],
      straddress: json['straddress'],
      strPhone: json['strPhone'],

    );
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'mpo': mpo,
      'doctorName': strCustomerName,
      'doctorAddress': straddress,
      'doctorPhone': strPhone,
    };
    return map;
  }

  DoctorModel.fromMap(Map<String, dynamic> res)
      : mpo = res["mpo"],
        strCustomerName = res["doctorName"],
        straddress = res["doctorAddress"],
        strPhone = res["doctorPhone"];



}
