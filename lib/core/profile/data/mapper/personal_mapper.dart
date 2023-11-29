import 'package:my_hris/core/profile/data/dto/personal_dto.dart';
import 'package:my_hris/core/profile/domain/entity/personal_model.dart';

PersonalModel moveToPersonalModel(PersonalDTO from) {
  return PersonalModel(
    fullName: from.fullName,
    employeeCode: from.employeeCode,
    phoneNumber: from.phoneNumber,
    email: from.email,
    gender: from.gender,
    religion: from.religion,
    maritalStatus: from.maritalStatus,
    bloodType: from.bloodType,
    dateOfBirth: from.dateOfBirth,
    placeOfBirth: from.placeOfBirth,
  );
}
