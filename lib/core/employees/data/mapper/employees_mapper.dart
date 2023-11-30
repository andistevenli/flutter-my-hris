import 'package:my_hris/core/employees/data/dto/employees_dto.dart';
import 'package:my_hris/core/employees/data/mapper/employees_employment_mapper.dart';
import 'package:my_hris/core/employees/data/mapper/employees_personal_mapper.dart';
import 'package:my_hris/core/employees/domain/entity/employees_model.dart';

EmployeesModel moveToEmployeesModel(EmployeesDTO from) {
  return EmployeesModel(
    employeesPersonalModel:
        moveToEmployeesPersonalModel(from.employeesPersonalDTO),
    employeesEmploymentModel: moveToEmployeesEmploymentModel(
      from.employeesEmploymentDTO,
    ),
  );
}
