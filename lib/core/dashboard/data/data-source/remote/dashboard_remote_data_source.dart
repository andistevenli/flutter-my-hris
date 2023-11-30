import 'package:my_hris/core/dashboard/data/dto/user_location_dto.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:my_hris/utils/constant/eureka_edutech_office_location.dart';

class DashboardRemoteDataSource {
  Future<UserLocationDTO> getCurrentLocation() async {
    try {
      // get longitude and latitude of location
      final Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      // get detail location from latitude and longitude
      final List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks[0];
        String address = "";
        address += placemark.name != null ? "${placemark.name}, " : "";
        address += placemark.street != null ? "${placemark.street}, " : "";
        address +=
            placemark.subLocality != null ? "${placemark.subLocality}, " : "";
        address += placemark.locality != null ? "${placemark.locality}, " : "";
        address += placemark.subAdministrativeArea != null
            ? "${placemark.subAdministrativeArea}, "
            : "";
        address +=
            placemark.postalCode != null ? "${placemark.postalCode}, " : "";
        address += placemark.country != null
            ? "${placemark.country}."
            : "Tidak Diketahui";
        return UserLocationDTO(
          userLongitude: position.longitude,
          userLatitude: position.latitude,
          targetLongitude: officeLongitude,
          targetLatitude: officeLatitude,
          address: address,
        );
      } else {
        return UserLocationDTO(
          userLongitude: 0,
          userLatitude: 0,
          targetLongitude: 0,
          targetLatitude: 0,
          address: "Unknown Address",
        );
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
