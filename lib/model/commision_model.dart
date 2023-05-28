class CommissionSlabModel {
  String? dblFromRange;
  String? dblPercentage;
  String? dblToRange;
  String? groupName;
  String? strDate;


  CommissionSlabModel({required this.dblFromRange, required this.dblPercentage, required this.dblToRange,
    required this.groupName,required this.strDate});


  factory CommissionSlabModel.fromJson(Map<String, dynamic> json) {
    return CommissionSlabModel(

      dblFromRange: json['dblFromRange'].toString(),
      dblPercentage: json['dblPercentage'].toString(),
      dblToRange: json['dblToRange'].toString(),
      groupName: json['groupName'],
      strDate: json['strDate'],

    );
  }

  set id(int? id) {}

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'dblFromRange': dblFromRange,
      'dblPercentage': dblPercentage,
      'dblToRange': dblToRange,
      'groupName': groupName,
      'strDate': strDate,
    };
    return map;
  }

  // DoctorModel.fromMap(Map<String, dynamic> res)
  //     : mpo = res["mpo"],
  //       strCustomerName = res["doctorName"],
  //       straddress = res["doctorAddress"],
  //       strPhone = res["doctorPhone"];



}
