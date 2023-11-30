import 'package:my_hris/core/employees/data/dto/employees_personal_dto.dart';
import 'package:my_hris/core/employees/domain/entity/employees_personal_model.dart';

EmployeesPersonalModel moveToEmployeesPersonalModel(EmployeesPersonalDTO from) {
  return EmployeesPersonalModel(
    fullName: from.fullName,
    employeeCode: from.employeeCode,
    email: from.email,
    gender: from.gender,
    religion: from.religion,
    maritalStatus: from.maritalStatus,
    bloodType: from.bloodType,
  );
}
