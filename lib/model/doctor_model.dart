class DoctorModel {
  String? mpo;
  String? strCustomerName;
  String? strPhone;
  String? straddress;

  DoctorModel(this.mpo, this.strCustomerName, this.straddress, this.strPhone);

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
