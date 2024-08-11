class DashboardData {
  final double amount;
  final String property;

  DashboardData({
    required this.amount,
    required this.property,
  });

  // Factory constructor to create an instance from a map (JSON)
  factory DashboardData.fromJson(Map<String, dynamic> json) {
    return DashboardData(
      amount: json['dblAmount'],
      property: json['strProperty'],
    );
  }

  // Method to convert an instance into a map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'dblAmount': amount,
      'strProperty': property,
    };
  }
}
