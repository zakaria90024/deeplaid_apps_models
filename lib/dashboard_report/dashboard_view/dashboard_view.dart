import '../../model/dashboard_model.dart';

abstract class DashboardInterfaceView {
  void onDashboardData(DashboardResponse? dashboardResponse);
  void onError(String smg);
}