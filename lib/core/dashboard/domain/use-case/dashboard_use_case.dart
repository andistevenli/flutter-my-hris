import 'package:my_hris/core/dashboard/domain/entity/dashboard_model.dart';
import 'package:my_hris/core/dashboard/domain/entity/user_location_model.dart';

abstract class DashboardUseCase {
  Future<DashboardModel> getDashboardInfo();
  Future<UserLocationModel> getCurrentLocation();
}
