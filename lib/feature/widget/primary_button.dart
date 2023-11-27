import 'package:flutter/material.dart';
import 'package:my_hris/utils/constant/constant_color.dart';
import 'package:my_hris/utils/constant/constant_unit.dart';
import 'package:my_hris/utils/responsive/size_config.dart';

class PrimaryButton extends StatefulWidget {
  final bool withIcon;
  final Text text;
  final void Function()? onPressed;
  final IconData icon;

  const PrimaryButton({
    super.key,
    required this.withIcon,
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return widget.withIcon
        ? ElevatedButton.icon(
            onPressed: widget.onPressed,
            style: ButtonStyle(
              elevation: const MaterialStatePropertyAll<double>(0),
              fixedSize: MaterialStatePropertyAll<Size>(
                Size(
                  SizeConfig.screenWidth,
                  getProportionateScreenHeight(btnHeight),
                ),
              ),
              shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(btnRoundedCorner),
                ),
              ),
              foregroundColor:
                  const MaterialStatePropertyAll<Color>(whiteColor),
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return primary70Color;
                  } else {
                    return primaryColor;
                  }
                },
              ),
            ),
            icon: Icon(widget.icon),
            label: widget.text,
          )
        : ElevatedButton(
            onPressed: widget.onPressed,
            style: ButtonStyle(
              elevation: const MaterialStatePropertyAll<double>(0),
              fixedSize: MaterialStatePropertyAll<Size>(
                Size(
                  SizeConfig.screenWidth,
                  getProportionateScreenHeight(btnHeight),
                ),
              ),
              shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(btnRoundedCorner),
                ),
              ),
              foregroundColor:
                  const MaterialStatePropertyAll<Color>(whiteColor),
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return primary70Color;
                  } else {
                    return primaryColor;
                  }
                },
              ),
            ),
            child: widget.text,
          );
  }
}
