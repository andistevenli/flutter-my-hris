import 'package:my_hris/core/profile/data/dto/address_dto.dart';
import 'package:my_hris/core/profile/data/dto/documents_dto.dart';
import 'package:my_hris/core/profile/data/dto/employment_dto.dart';
import 'package:my_hris/core/profile/data/dto/personal_dto.dart';

class ProfileDTO {
  final PersonalDTO personalDTO;
  final EmploymentDTO employmentDTO;
  final AddressDTO addressDTO;
  final DocumentsDTO documentsDTO;

  ProfileDTO({
    required this.personalDTO,
    required this.employmentDTO,
    required this.addressDTO,
    required this.documentsDTO,
  });
}
