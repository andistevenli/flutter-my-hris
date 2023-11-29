import 'package:my_hris/core/profile/data/dto/address_dto.dart';
import 'package:my_hris/core/profile/data/dto/documents_dto.dart';
import 'package:my_hris/core/profile/data/dto/employment_dto.dart';
import 'package:my_hris/core/profile/data/dto/personal_dto.dart';
import 'package:my_hris/core/profile/data/dto/profile_dto.dart';

class ProfileLocalDataSource {
  Future<ProfileDTO> getProfileInfo() async {
    try {
      return ProfileDTO(
        personalDTO: PersonalDTO(
          fullName: 'Daniel Wetan',
          employeeCode: 'ERK3',
          phoneNumber: '+6287887056115',
          email: 'danielwetan.io@gmail.com',
          gender: 'Male',
          religion: 'Islam',
          maritalStatus: 'Single',
          bloodType: 'A',
          dateOfBirth: '01-01-1990 (33 years old)',
          placeOfBirth: 'Jakarta',
        ),
        employmentDTO: EmploymentDTO(
          company: 'Edukasi Rekanan Anda',
          department: 'Engineer',
          position: 'Software Engineer',
          employeeStatus: 'Active',
          employeeType: 'Full Time',
          joinDate: '01-01-2020',
          approvalLine: 'Elvita Sari',
        ),
        addressDTO: AddressDTO(
          residentialAddress: 'Blugreen',
          citizenAddress: 'Graha Satria',
          province: 'DKI Jakarta',
          city: 'South Jakarta',
          postCode: '10150',
        ),
        documentsDTO: DocumentsDTO(
          ktp: 'k3301022809019990tp',
          kk: '3301022809019991',
          bpjs: '00000000000',
        ),
      );
    } catch (e) {
      throw Exception(e);
    }
  }
}
