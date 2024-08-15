import 'dart:convert';

class DashboardResponse {
  final List<CollectionItem> collection;
  final List<CollectionItem> dues;
  final List<CollectionItem> limit;
  final List<CollectionItem> order;
  final List<CollectionItem> sales;
  final String strStatus;

  DashboardResponse({
    required this.collection,
    required this.dues,
    required this.limit,
    required this.order,
    required this.sales,
    required this.strStatus,
  });

  factory DashboardResponse.fromJson(Map<String, dynamic> json) {
    return DashboardResponse(
      collection: (json['Collection'] as List)
          .map((item) => CollectionItem.fromJson(item))
          .toList(),
      dues: (json['Dues'] as List).map((item) => CollectionItem.fromJson(item)).toList(),
      limit: (json['Limit'] as List).map((item) => CollectionItem.fromJson(item)).toList(),
      order: (json['Order'] as List).map((item) => CollectionItem.fromJson(item)).toList(),
      sales: (json['Sales'] as List).map((item) => CollectionItem.fromJson(item)).toList(),
      strStatus: json['strStatus'] as String,
    );
  }
}

class CollectionItem {
  final double dblAmount;
  final String strProperty;

  CollectionItem({
    required this.dblAmount,
    required this.strProperty,
  });

  factory CollectionItem.fromJson(Map<String, dynamic> json) {
    return CollectionItem(
      dblAmount: (json['dblAmount'] as num).toDouble(),
      strProperty: json['strProperty'] as String,
    );
  }
}







