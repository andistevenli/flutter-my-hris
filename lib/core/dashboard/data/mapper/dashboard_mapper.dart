import 'package:my_hris/core/dashboard/data/dto/dashboard_dto.dart';
import 'package:my_hris/core/dashboard/domain/entity/dashboard_model.dart';

DashboardModel moveToDashboardModel(DashboardDTO from) {
  return DashboardModel(
    greeting: from.greeting,
    name: from.name,
    position: from.position,
    totalEmployees: from.totalEmployees,
    currentEmployees: from.currentEmployees,
    maleQty: from.maleQty,
    femaleQty: from.femaleQty,
    activeEmployees: from.activeEmployees,
    inactiveEmployees: from.inactiveEmployees,
  );
}
