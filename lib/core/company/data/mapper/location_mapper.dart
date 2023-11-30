import 'package:my_hris/core/company/data/dto/location_dto.dart';
import 'package:my_hris/core/company/domain/entity/location_model.dart';

LocationModel moveToLocationModel(LocationDTO from) {
  return LocationModel(
    latitude: from.latitude,
    longitude: from.longitude,
    address: from.address,
  );
}
