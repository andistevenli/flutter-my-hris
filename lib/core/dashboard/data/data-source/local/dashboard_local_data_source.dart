import 'package:my_hris/core/dashboard/data/dto/dashboard_dto.dart';
import 'package:my_hris/utils/constant/constant_text.dart';

class DashboardLocalDataSource {
  Future<DashboardDTO> getDashboardInfo() async {
    DateTime now = DateTime.now();
    int currentHour = now.hour;
    late String greeting;
    if (currentHour >= 6 && currentHour < 10) {
      greeting = morning;
    } else if (currentHour >= 10 && currentHour < 12) {
      greeting = morningToNoon;
    } else if (currentHour >= 12 && currentHour < 13) {
      greeting = noon;
    } else if (currentHour >= 13 && currentHour < 18) {
      greeting = afternoon;
    } else if (currentHour >= 18 && currentHour < 19) {
      greeting = timeForHome;
    } else if (currentHour >= 19 && currentHour < 23) {
      greeting = evening;
    } else {
      greeting = defaultGreeting;
    }
    return DashboardDTO(
      greeting: greeting,
      name: 'Daniel Wetan',
      position: 'Software Engineer',
      totalEmployees: 32,
      currentEmployees: 24,
      maleQty: 20,
      femaleQty: 12,
      activeEmployees: 32,
      inactiveEmployees: 0,
    );
  }
}
