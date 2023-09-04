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

  set id(int? id) {}

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'mpo': mpo,
      'doctorName': strCustomerName,
      'doctorAddress': straddress,
      'doctorPhone': strPhone,
    };
    return map;
  }

  DoctorModel.fromMap(dynamic res)
  {     this.mpo = res['mpo'];
        this.strCustomerName = res['doctorName'].toString();
        this.straddress = res['doctorAddress'].toString();
        this.strPhone = res['doctorPhone'].toString();
  }



  // DoctorModel.fromObject(dynamic res) {
  //   this.mpo = res["mpo"],
  //   this.strCustomerName = res["name"],
  //   this.description = res["description"],
  //   this.unitPrice = res);
  // }


}
