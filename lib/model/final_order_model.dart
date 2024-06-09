import 'dart:convert';
//full order model
class BranchID {
  String strBranchID;

  BranchID({required this.strBranchID});

  Map<String, dynamic> toJson() => {
    "strBranchID": strBranchID,
  };
}

class Detail {
  String date;
  String doctorName;
  String groupName;
  String itemName;
  double itemPrice;
  int itemQuentity;
  double itemTotalPrice;
  String mpo;
  String newCustomer;
  int orderid;
  String slabgroupName;

  Detail({
    required this.date,
    required this.doctorName,
    required this.groupName,
    required this.itemName,
    required this.itemPrice,
    required this.itemQuentity,
    required this.itemTotalPrice,
    required this.mpo,
    required this.newCustomer,
    required this.orderid,
    required this.slabgroupName,
  });

  Map<String, dynamic> toJson() => {
    "date": date,
    "doctorName": doctorName,
    "groupName": groupName,
    "itemName": itemName,
    "itemPrice": itemPrice,
    "itemQuentity": itemQuentity,
    "itemTotalPrice": itemTotalPrice,
    "mpo": mpo,
    "newCustomer": newCustomer,
    "orderid": orderid,
    "slabgroupName": slabgroupName,
  };
}

class DoctorInfo {
  String address;
  String anniversaryDate;
  String chamberName;
  String dateOfBirth;
  String degreeName;
  String district;
  String division;
  String doctorName;
  String gender;
  String hobby;
  String maritalStatus;
  String phoneNumber;
  String religion;
  String strIamgeSig;
  String union;
  String upazila;
  String yearlyBusiness;

  DoctorInfo({
    required this.address,
    required this.anniversaryDate,
    required this.chamberName,
    required this.dateOfBirth,
    required this.degreeName,
    required this.district,
    required this.division,
    required this.doctorName,
    required this.gender,
    required this.hobby,
    required this.maritalStatus,
    required this.phoneNumber,
    required this.religion,
    required this.strIamgeSig,
    required this.union,
    required this.upazila,
    required this.yearlyBusiness,
  });

  Map<String, dynamic> toJson() => {
    "address": address,
    "anniversary_date": anniversaryDate,
    "chamberName": chamberName,
    "date_of_birth": dateOfBirth,
    "degreeName": degreeName,
    "district": district,
    "division": division,
    "doctorName": doctorName,
    "gender": gender,
    "hobby": hobby,
    "material_status": maritalStatus,
    "phoneNumber": phoneNumber,
    "religion": religion,
    "strIamgeSig": strIamgeSig,
    "union": union,
    "upazila": upazila,
    "yearly_business": yearlyBusiness,
  };
}

class Summary {
  String approveBy;
  String approveDate;
  String branchid;
  String date;
  String doctor;
  int id;
  int intCombopack;
  int intDItype;
  int intModepay;
  bool isSelected;
  String mpo;
  String newCustomer;
  int orderId;
  String reciveAddress;
  int status;
  String strselectiontype;
  double totalAmount;
  int totlaQty;

  Summary({
    required this.approveBy,
    required this.approveDate,
    required this.branchid,
    required this.date,
    required this.doctor,
    required this.id,
    required this.intCombopack,
    required this.intDItype,
    required this.intModepay,
    required this.isSelected,
    required this.mpo,
    required this.newCustomer,
    required this.orderId,
    required this.reciveAddress,
    required this.status,
    required this.strselectiontype,
    required this.totalAmount,
    required this.totlaQty,
  });

  Map<String, dynamic> toJson() => {
    "approveBy": approveBy,
    "approveDate": approveDate,
    "branchid": branchid,
    "date": date,
    "doctor": doctor,
    "id": id,
    "intCombopack": intCombopack,
    "intDItype": intDItype,
    "intModepay": intModepay,
    "isSelected": isSelected,
    "mpo": mpo,
    "newCustomer": newCustomer,
    "orderId": orderId,
    "reciveAddress": reciveAddress,
    "status": status,
    "strselectiontype": strselectiontype,
    "totalAmount": totalAmount,
    "totlaQty": totlaQty,
  };
}
