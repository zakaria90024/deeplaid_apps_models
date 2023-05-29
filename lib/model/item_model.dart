class ItemModel {
  String? commgroupgame;
  String? dblPartyvalue;
  String? dblRate;
  String? dblcomboMaxvalue;
  String? dblcomboMinqty;
  String? groupName;
  String? itemName;
  String? itemcode;

  ItemModel({
    required this.commgroupgame,
    required this.dblPartyvalue,
    required this.dblRate,
    required this.dblcomboMaxvalue,
    required this.dblcomboMinqty,
    required this.groupName,
    required this.itemName,
    required this.itemcode});


  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(

      commgroupgame: json['commgroupgame'],
      dblPartyvalue: json['dblPartyvalue'].toString(),
      dblRate: json['dblRate'].toString(),
      dblcomboMaxvalue: json['dblcomboMaxvalue'].toString(),
      dblcomboMinqty: json['dblcomboMinqty'].toString(),
      groupName: json['groupName'],
      itemName: json['itemName'],
      itemcode: json['itemcode'],

    );
  }

  set id(int? id) {}

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'commgroupgame': commgroupgame,
      'dblPartyvalue': dblPartyvalue,
      'dblRate': dblRate,
      'dblcomboMaxvalue': dblcomboMaxvalue,
      'dblcomboMinqty': dblcomboMinqty,
      'groupName': groupName,
      'itemName': itemName,
      'itemcode': itemcode,
    };
    return map;
  }

  // DoctorModel.fromMap(Map<String, dynamic> res)
  //     : mpo = res["mpo"],
  //       strCustomerName = res["doctorName"],
  //       straddress = res["doctorAddress"],
  //       strPhone = res["doctorPhone"];



}