class GroupModel {
  String? GroupName;

  GroupModel({required this.GroupName});

  factory GroupModel.fromJson(Map<String, dynamic> json) {
    return GroupModel(
      GroupName: json['GroupName'],
    );
  }

  set id(int? id) {}

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'GroupName': GroupName,
    };
    return map;
  }

// DoctorModel.fromMap(Map<String, dynamic> res)
//     : mpo = res["mpo"],
//       strCustomerName = res["doctorName"],
//       straddress = res["doctorAddress"],
//       strPhone = res["doctorPhone"];
}
