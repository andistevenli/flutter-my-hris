import 'package:my_hris/core/profile/data/dto/employment_dto.dart';
import 'package:my_hris/core/profile/domain/entity/employment_model.dart';

EmploymentModel moveToEmploymentModel(EmploymentDTO from) {
  return EmploymentModel(
    company: from.company,
    department: from.department,
    position: from.position,
    employeeStatus: from.employeeStatus,
    employeeType: from.employeeType,
    joinDate: from.joinDate,
    approvalLine: from.approvalLine,
  );
}
