//mengecek jarak dari lokasi yang ditentukan
import 'dart:math';

double calculateDistance(double userLatitude, double userLongitude,
    double officeLatitude, double officeLongitude) {
  const double earthRadius = 6371.0; // Earth radius in kilometers
  double dLat = (officeLatitude - userLatitude) * (pi / 180.0);
  double dLon = (officeLongitude - userLongitude) * (pi / 180.0);

  double a = sin(dLat / 2) * sin(dLat / 2) +
      cos(userLatitude * (pi / 180.0)) *
          cos(officeLatitude * (pi / 180.0)) *
          sin(dLon / 2) *
          sin(dLon / 2);
  double c = 2 * atan2(sqrt(a), sqrt(1 - a));

  double distance = earthRadius * c;
  return distance;
}
