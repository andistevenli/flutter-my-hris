import 'package:flutter/material.dart';
import 'package:my_hris/core/dashboard/domain/entity/user_location_model.dart';
import 'package:my_hris/utils/math/calculate_distance.dart';

class LocationDialog extends StatelessWidget {
  final UserLocationModel userLocationModel;
  final void Function()? onPressed;

  const LocationDialog({
    super.key,
    required this.userLocationModel,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    double distance = calculateDistance(
      userLocationModel.userLatitude,
      userLocationModel.userLongitude,
      userLocationModel.targetLatitude,
      userLocationModel.targetLongitude,
    );
    return AlertDialog(
      icon: Icon(distance > 1.0 ? Icons.error : Icons.check),
      iconColor: distance > 1.0 ? Colors.red : Colors.green,
      title: Text(distance > 1.0 ? "Out Of Range" : "Time to Clock In"),
      content: Text(distance > 1.0
          ? "You are outside the scope of the office, the maximum is 1 km from your office. Your current location : ${userLocationModel.address}"
          : "Nice! You are inside the scope of the office. Your current location : ${userLocationModel.address}"),
      actions: [
        TextButton(
          onPressed: onPressed,
          child: const Text("Okay"),
        ),
      ],
    );
  }
}
