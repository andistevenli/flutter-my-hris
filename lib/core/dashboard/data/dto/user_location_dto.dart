class UserLocationDTO {
  final double userLongitude;
  final double userLatitude;
  final double targetLongitude;
  final double targetLatitude;
  final String address;

  UserLocationDTO({
    required this.userLongitude,
    required this.userLatitude,
    required this.targetLongitude,
    required this.targetLatitude,
    required this.address,
  });
}
