import 'package:my_hris/core/employees/data/dto/employees_employment_dto.dart';
import 'package:my_hris/core/employees/data/dto/employees_personal_dto.dart';

class EmployeesDTO {
  final EmployeesPersonalDTO employeesPersonalDTO;
  final EmployeesEmploymentDTO employeesEmploymentDTO;

  EmployeesDTO({
    required this.employeesPersonalDTO,
    required this.employeesEmploymentDTO,
  });
}
