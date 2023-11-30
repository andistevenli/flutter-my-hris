import 'package:my_hris/core/company/data/dto/department_dto.dart';
import 'package:my_hris/core/company/domain/entity/department_model.dart';

DepartmentModel moveToDepartmentModel(DepartmentDTO from) {
  return DepartmentModel(
    departmentName: from.departmentName,
    lead: from.lead,
    employees: from.employees,
    status: from.status,
  );
}
