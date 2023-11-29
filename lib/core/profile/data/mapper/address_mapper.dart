import 'package:my_hris/core/profile/data/dto/address_dto.dart';
import 'package:my_hris/core/profile/domain/entity/address_model.dart';

AddressModel moveToAddressModel(AddressDTO from) {
  return AddressModel(
    residentialAddress: from.residentialAddress,
    citizenAddress: from.citizenAddress,
    province: from.province,
    city: from.city,
    postCode: from.postCode,
  );
}
