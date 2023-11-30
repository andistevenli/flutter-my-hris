import 'package:my_hris/core/employees/data/dto/employees_employment_dto.dart';
import 'package:my_hris/core/employees/domain/entity/employees_employment_model.dart';

EmployeesEmploymentModel moveToEmployeesEmploymentModel(
    EmployeesEmploymentDTO from) {
  return EmployeesEmploymentModel(
    company: from.company,
    department: from.department,
    position: from.position,
    employeeStatus: from.employeeStatus,
    employeeType: from.employeeType,
    joinDate: from.joinDate,
    approvalLine: from.approvalLine,
  );
}
