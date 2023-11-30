import 'package:flutter/material.dart';
import 'package:my_hris/utils/constant/constant_color.dart';
import 'package:my_hris/utils/constant/constant_unit.dart';
import 'package:my_hris/utils/extension/typography.dart';

class TextActionButton extends StatefulWidget {
  final String text;
  final Color bgColor;
  final void Function()? onPressed;

  const TextActionButton({
    super.key,
    required this.text,
    required this.bgColor,
    required this.onPressed,
  });

  @override
  State<TextActionButton> createState() => _TextActionButtonState();
}

class _TextActionButtonState extends State<TextActionButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return primary10Color;
            } else {
              return widget.bgColor;
            }
          },
        ),
        elevation: const MaterialStatePropertyAll<double>(0),
        shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
      onPressed: widget.onPressed,
      child: widget.text.sm(
        1,
        TextOverflow.ellipsis,
        color: infoColor,
        bold: false,
        textAlign: TextAlign.center,
      ),
    );
  }
}
