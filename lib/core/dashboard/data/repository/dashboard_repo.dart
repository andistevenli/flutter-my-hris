import 'package:my_hris/core/dashboard/domain/entity/dashboard_model.dart';

abstract class IDashboardRepo {
  Future<DashboardModel> getDashboardInfo();
}
