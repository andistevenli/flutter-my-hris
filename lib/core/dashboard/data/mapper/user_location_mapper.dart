import 'package:my_hris/core/dashboard/data/dto/user_location_dto.dart';
import 'package:my_hris/core/dashboard/domain/entity/user_location_model.dart';

UserLocationModel moveToLocationModel(UserLocationDTO from) {
  return UserLocationModel(
    userLongitude: from.userLongitude,
    userLatitude: from.userLatitude,
    targetLongitude: from.targetLongitude,
    targetLatitude: from.targetLatitude,
    address: from.address,
  );
}
