class ItemModel {
  String? commgroupgame;
  String? dblPartyvalue;
  String? dblRate;
  String? dblcomboMaxvalue;
  String? dblcomboMinqty;
  String? groupName;
  String? itemName;
  String? itemcode;
  String? depot;

  ItemModel( {
    required this.commgroupgame,
    required this.dblPartyvalue,
    required this.dblRate,
    required this.dblcomboMaxvalue,
    required this.dblcomboMinqty,
    required this.groupName,
    required this.itemName,
    required this.itemcode,
    required this.depot});


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
      depot: json['depot']

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
      'depot':depot
    };
    return map;
  }

  // DoctorModel.fromMap(Map<String, dynamic> res)
  //     : mpo = res["mpo"],
  //       strCustomerName = res["doctorName"],
  //       straddress = res["doctorAddress"],
  //       strPhone = res["doctorPhone"];


  ItemModel.fromMap(dynamic res) {

    this.commgroupgame = res['commgroupgame'];
    this.dblPartyvalue = res['dblPartyvalue'];
    this.dblRate = res['dblRate'];
    this.dblcomboMaxvalue = res['dblcomboMaxvalue'];
    this.dblcomboMinqty = res['dblcomboMinqty'];
    this.groupName = res['groupName'];
    this.itemName = res['itemName'];
    this.itemcode = res['itemcode'];
    this.depot = res['depot'];
  }


}
