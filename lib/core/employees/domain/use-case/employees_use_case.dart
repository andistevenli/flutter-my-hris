import 'package:my_hris/core/employees/domain/entity/employees_model.dart';

abstract class EmployeesUseCase {
  Future<List<EmployeesModel>> getEmployeesInfo();
  Future<EmployeesModel> getEmployeesDetailInfo(final int index);
}
