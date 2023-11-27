import 'package:flutter/material.dart';
import 'package:my_hris/utils/constant/constant_color.dart';
import 'package:my_hris/utils/constant/constant_unit.dart';
import 'package:my_hris/utils/responsive/size_config.dart';

class Box extends StatefulWidget {
  final Widget? child;

  const Box({
    super.key,
    required this.child,
  });

  @override
  State<Box> createState() => _BoxState();
}

class _BoxState extends State<Box> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      padding: const EdgeInsets.all(pagePadding),
      decoration: BoxDecoration(
        border: Border.all(
          width: borderWidth,
          color: whiteColor,
        ),
        borderRadius: BorderRadius.circular(containerRadius),
        color: whiteFEColor,
      ),
      width: double.infinity,
      child: widget.child,
    );
  }
}
