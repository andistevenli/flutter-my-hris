import 'package:flutter/material.dart';

extension Space on double {
  SizedBox get dp => SizedBox(
        height: this,
      );
}
