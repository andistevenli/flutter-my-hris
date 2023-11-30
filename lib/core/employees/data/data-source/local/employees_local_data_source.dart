import 'package:my_hris/core/employees/data/dto/employees_dto.dart';
import 'package:my_hris/core/employees/data/dto/employees_employment_dto.dart';
import 'package:my_hris/core/employees/data/dto/employees_personal_dto.dart';

class EmployeesLocalDataSource {
  Future<List<EmployeesDTO>> getEmployeesInfo() async {
    try {
      List<EmployeesDTO> list = [
        //Project manager
        EmployeesDTO(
          employeesPersonalDTO: EmployeesPersonalDTO(
              fullName: 'Elvita Sari',
              employeeCode: 'ERK5',
              email: 'elvita@eurekaedutech.com',
              gender: 'Female',
              religion: 'Islam',
              maritalStatus: 'Single',
              bloodType: 'A'),
          employeesEmploymentDTO: EmployeesEmploymentDTO(
              company: 'Edukasi Rekanan Anda',
              department: 'Management',
              position: 'Project Manager',
              employeeStatus: 'Active',
              employeeType: 'Full time',
              joinDate: '01-01-2020',
              approvalLine: 'Yogi Lesmana'),
        ),
        //UI UX Engineer
        EmployeesDTO(
          employeesPersonalDTO: EmployeesPersonalDTO(
              fullName: 'Faturachman Asyari',
              employeeCode: 'ERK6',
              email: 'faturvian04@gmail.com',
              gender: 'Male',
              religion: 'Islam',
              maritalStatus: 'Single',
              bloodType: 'A'),
          employeesEmploymentDTO: EmployeesEmploymentDTO(
              company: 'Edukasi Rekanan Anda',
              department: 'Engineer',
              position: 'UI/UX Engineer',
              employeeStatus: 'Active',
              employeeType: 'Full time',
              joinDate: '01-01-2020',
              approvalLine: 'Elvita Sari'),
        ),
        //HR Staff
        EmployeesDTO(
          employeesPersonalDTO: EmployeesPersonalDTO(
              fullName: 'Taufiq Hidayay',
              employeeCode: 'SES01',
              email: 'taufiq.hidayat@semestaenergi.co.id',
              gender: 'Male',
              religion: 'Islam',
              maritalStatus: 'Married',
              bloodType: 'O'),
          employeesEmploymentDTO: EmployeesEmploymentDTO(
              company: 'Edukasi Rekanan Anda',
              department: 'Management',
              position: 'HR Staff',
              employeeStatus: 'Active',
              employeeType: 'Full time',
              joinDate: '01-01-2020',
              approvalLine: 'Yogi Lesmana'),
        ),
        //Bank Soal Write
        EmployeesDTO(
          employeesPersonalDTO: EmployeesPersonalDTO(
              fullName: 'Dimas Widianto Ramadhan',
              employeeCode: 'ERK7',
              email: 'Dimaswork031@gmail.com',
              gender: 'Male',
              religion: 'Islam',
              maritalStatus: 'Single',
              bloodType: 'A'),
          employeesEmploymentDTO: EmployeesEmploymentDTO(
              company: 'Edukasi Rekanan Anda',
              department: 'Edutech',
              position: 'Ban Soal Write',
              employeeStatus: 'Active',
              employeeType: 'Full time',
              joinDate: '01-01-2020',
              approvalLine: 'Elvita Sari'),
        ),
        //CEO
        EmployeesDTO(
          employeesPersonalDTO: EmployeesPersonalDTO(
              fullName: 'Yogi Lesmana',
              employeeCode: 'ERK24',
              email: 'yogilesmana@eurekaedutech.com',
              gender: 'Male',
              religion: 'Buddha',
              maritalStatus: 'Married',
              bloodType: 'O'),
          employeesEmploymentDTO: EmployeesEmploymentDTO(
              company: 'Edukasi Rekanan Anda',
              department: 'Management',
              position: 'CEO',
              employeeStatus: 'Active',
              employeeType: 'Full time',
              joinDate: '01-01-2020',
              approvalLine: 'Yogi Lesmana'),
        ),
      ];
      return list;
    } catch (e) {
      throw Exception(e);
    }
  }
}
