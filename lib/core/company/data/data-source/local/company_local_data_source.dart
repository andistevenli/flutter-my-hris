import 'package:my_hris/core/company/data/dto/company_information_dto.dart';
import 'package:my_hris/core/company/data/dto/department_dto.dart';
import 'package:my_hris/core/company/data/dto/general_dto.dart';
import 'package:my_hris/core/company/data/dto/location_dto.dart';
import 'package:my_hris/core/company/data/dto/position_dto.dart';
import 'package:my_hris/core/company/data/dto/tax_information_dto.dart';

class CompanyLocalDataSource {
  Future<GeneralDTO> getGeneralInfo() async {
    try {
      return GeneralDTO(
        companyInformationDTO: CompanyInformationDTO(
          companyName: 'Edukasi Rekanan Anda',
          phoneNumber: '0878871023',
          email: 'info@eurekaedutech.com',
          address: 'Graha Satria 1 Office',
          province: 'DKI Jakarta',
          city: 'South Jakarta',
        ),
        taxInformationDTO: TaxInformationDTO(
          companyNPWP: '000000000000000',
          taxableDate: '2020-01-01',
          taxPersonName: 'Adam',
          taxPersonNPWP: '000000000000001',
        ),
        locationDTO: LocationDTO(
          latitude: -6.291578195767436,
          longitude: 106.7955458443573,
          address:
              'Jalan RS. Fatmawati No.5, RT.01/RW.09, Cilandak Barat, Jakarta, RT.2/RW.9, West Cilandak, Cilandak, South Jakarta City, Jakarta 12430',
        ),
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<DepartmentDTO>> getDepartmentInfo() async {
    try {
      List<DepartmentDTO> list = [
        DepartmentDTO(
          departmentName: 'Engineer',
          lead: 'Muhammad Adam',
          employees: 7,
          status: 'Active',
        ),
        DepartmentDTO(
          departmentName: 'Management',
          lead: 'Yogi Lesmana',
          employees: 4,
          status: 'Active',
        ),
        DepartmentDTO(
          departmentName: 'Edutainment',
          lead: 'Iftihal Rahman',
          employees: 3,
          status: 'Active',
        ),
        DepartmentDTO(
          departmentName: 'Creative',
          lead: 'Ilham Maulana Zapar Sidik',
          employees: 3,
          status: 'Active',
        ),
        DepartmentDTO(
          departmentName: 'Finance',
          lead: 'Eta Aprilia',
          employees: 2,
          status: 'Active',
        ),
        DepartmentDTO(
          departmentName: 'Xpert',
          lead: 'Putri Husnul Aprilia',
          employees: 4,
          status: 'Active',
        ),
        DepartmentDTO(
          departmentName: 'Logistik',
          lead: 'Ragil Wisnu Witarto',
          employees: 2,
          status: 'Active',
        ),
        DepartmentDTO(
          departmentName: 'Edutech',
          lead: 'Cahyarani Paramesti',
          employees: 7,
          status: 'Active',
        ),
      ];
      return list;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<PositionDTO>> getPositionInfo() async {
    try {
      List<PositionDTO> list = [
        PositionDTO(
          positionName: 'Software Engineer',
          departmentName: 'Engineer',
          employees: 4,
        ),
        PositionDTO(
          positionName: 'Project Manager',
          departmentName: 'Management',
          employees: 1,
        ),
        PositionDTO(
          positionName: 'Event Project Manager',
          departmentName: 'Management',
          employees: 1,
        ),
        PositionDTO(
          positionName: 'Partnership',
          departmentName: 'Edutainment',
          employees: 1,
        ),
        PositionDTO(
          positionName: 'Graphic Designer',
          departmentName: 'Creative',
          employees: 2,
        ),
        PositionDTO(
          positionName: 'Producer',
          departmentName: 'Edutainment',
          employees: 2,
        ),
        PositionDTO(
          positionName: 'Staff',
          departmentName: 'Finance',
          employees: 1,
        ),
        PositionDTO(
          positionName: 'Digital Marketing',
          departmentName: 'Xpert',
          employees: 1,
        ),
        PositionDTO(
          positionName: 'Logistic',
          departmentName: 'Logistik',
          employees: 2,
        ),
        PositionDTO(
          positionName: 'Video Editor',
          departmentName: 'Creative',
          employees: 1,
        ),
        PositionDTO(
          positionName: 'Bank Soal Writer',
          departmentName: 'Edutech',
          employees: 6,
        ),
        PositionDTO(
          positionName: 'Marketing Office',
          departmentName: 'Edutech',
          employees: 1,
        ),
        PositionDTO(
          positionName: 'Admin',
          departmentName: 'Finance',
          employees: 1,
        ),
        PositionDTO(
          positionName: 'Social Media',
          departmentName: 'Xpert',
          employees: 1,
        ),
        PositionDTO(
          positionName: 'CEO',
          departmentName: 'Management',
          employees: 1,
        ),
        PositionDTO(
          positionName: 'Trainer Database Specialist',
          departmentName: 'Xpert',
          employees: 1,
        ),
        PositionDTO(
          positionName: 'Mobile Developer',
          departmentName: 'Engineer',
          employees: 1,
        ),
        PositionDTO(
          positionName: 'Quality Assurance',
          departmentName: 'Engineer',
          employees: 1,
        ),
        PositionDTO(
          positionName: 'Project Leader',
          departmentName: 'Xpert',
          employees: 1,
        ),
        PositionDTO(
          positionName: 'UI/UX Engineer',
          departmentName: 'Engineer',
          employees: 1,
        ),
        PositionDTO(
          positionName: 'HR Staff',
          departmentName: 'Management',
          employees: 1,
        ),
      ];
      return list;
    } catch (e) {
      throw Exception(e);
    }
  }
}
