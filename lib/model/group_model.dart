class GroupModel {
  String GroupName;
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

  // Assumes a factory constructor to create an instance from a map
  factory GroupModel.fromMap(Map<String, dynamic> map) {
    return GroupModel(
      GroupName: map['GroupName']
    );
  }

  // GroupModel.fromMap(dynamic res) {
  //   this.GroupName = res['GroupName'];
  // }

// DoctorModel.fromMap(Map<String, dynamic> res)
//     : mpo = res["mpo"],
//       strCustomerName = res["doctorName"],
//       straddress = res["doctorAddress"],
//       strPhone = res["doctorPhone"];



  // Customar({required this.doctorName, required this.doctorPhone});
  //
  // Map<String, dynamic> toMap() {
  //   return {
  //     'doctorName': doctorName,
  //     'doctorPhone': doctorPhone,
  //   };
  // }
  //
  // // Assumes a factory constructor to create an instance from a map
  // factory Customar.fromMap(Map<String, dynamic> map) {
  //   return Customar(
  //     doctorName: map['doctorName'],
  //     doctorPhone: map['doctorPhone'],
  //   );
  // }
}
