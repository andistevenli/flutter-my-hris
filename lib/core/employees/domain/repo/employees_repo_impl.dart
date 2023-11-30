import 'package:my_hris/core/employees/data/data-source/local/employees_local_data_source.dart';
import 'package:my_hris/core/employees/data/dto/employees_dto.dart';
import 'package:my_hris/core/employees/data/mapper/employees_employment_mapper.dart';
import 'package:my_hris/core/employees/data/mapper/employees_mapper.dart';
import 'package:my_hris/core/employees/data/mapper/employees_personal_mapper.dart';
import 'package:my_hris/core/employees/data/repo/employees_repo.dart';
import 'package:my_hris/core/employees/domain/di/employees_domain_injector.dart';
import 'package:my_hris/core/employees/domain/entity/employees_model.dart';

class EmployeesRepoImpl implements IEmployeesRepo {
  @override
  Future<List<EmployeesModel>> getEmployeesInfo() async {
    try {
      List<EmployeesDTO> listDto =
          await employeesDomainInjector<EmployeesLocalDataSource>()
              .getEmployeesInfo();
      return listDto.map((e) => moveToEmployeesModel(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<EmployeesModel> getEmployeesDetailInfo(int index) async {
    try {
      List<EmployeesDTO> listDto =
          await employeesDomainInjector<EmployeesLocalDataSource>()
              .getEmployeesInfo();
      return EmployeesModel(
        employeesPersonalModel:
            moveToEmployeesPersonalModel(listDto[index].employeesPersonalDTO),
        employeesEmploymentModel: moveToEmployeesEmploymentModel(
            listDto[index].employeesEmploymentDTO),
      );
    } catch (e) {
      throw Exception(e);
    }
  }
}
