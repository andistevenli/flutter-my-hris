import 'package:my_hris/core/employees/domain/entity/employees_employment_model.dart';
import 'package:my_hris/core/employees/domain/entity/employees_personal_model.dart';

class EmployeesModel {
  final EmployeesPersonalModel employeesPersonalModel;
  final EmployeesEmploymentModel employeesEmploymentModel;

  EmployeesModel({
    required this.employeesPersonalModel,
    required this.employeesEmploymentModel,
  });
}
