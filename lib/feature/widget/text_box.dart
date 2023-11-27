import 'package:flutter/material.dart';
import 'package:my_hris/utils/constant/constant_color.dart';
import 'package:my_hris/utils/constant/constant_unit.dart';

class TextBox extends StatefulWidget {
  final TextEditingController textEditingController;
  final bool last;
  final TextInputType textInputType;
  final TextCapitalization textCapitalization;
  final bool isPassword;
  final void Function(String)? onChanged;
  final String hintText;
  final String? Function(String?)? validator;

  const TextBox({
    super.key,
    required this.textEditingController,
    required this.last,
    required this.textInputType,
    required this.textCapitalization,
    required this.isPassword,
    required this.onChanged,
    required this.hintText,
    required this.validator,
  });

  @override
  State<TextBox> createState() => _TextBoxState();
}

class _TextBoxState extends State<TextBox> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return widget.isPassword
        ? TextFormField(
            controller: widget.textEditingController,
            textInputAction:
                widget.last ? TextInputAction.done : TextInputAction.next,
            keyboardType: widget.textInputType,
            textCapitalization: widget.textCapitalization,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: blackColor,
            ),
            obscureText: !_isPasswordVisible,
            obscuringCharacter: '•',
            maxLines: 1,
            onChanged: widget.onChanged,
            decoration: InputDecoration(
              isDense: true,
              errorMaxLines: 2,
              hintMaxLines: 2,
              hintText: widget.hintText,
              hintStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: greyColor,
              ),
              errorStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: errorColor,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: const BorderSide(
                  color: primaryColor,
                  width: borderWidth,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: const BorderSide(
                  color: whiteF7Color,
                  width: borderWidth,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: const BorderSide(
                  color: successColor,
                  width: borderWidth,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: const BorderSide(
                  color: errorColor,
                  width: borderWidth,
                ),
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
                icon: _isPasswordVisible
                    ? const Icon(
                        Icons.visibility,
                        color: greyColor,
                        size: 24,
                      )
                    : const Icon(
                        Icons.visibility_off,
                        color: greyColor,
                        size: 24,
                      ),
              ),
            ),
            validator: widget.validator,
          )
        : TextFormField(
            controller: widget.textEditingController,
            textInputAction:
                widget.last ? TextInputAction.done : TextInputAction.next,
            keyboardType: widget.textInputType,
            textCapitalization: widget.textCapitalization,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: blackColor,
            ),
            obscureText: widget.isPassword,
            obscuringCharacter: '•',
            maxLines: 1,
            onChanged: widget.onChanged,
            decoration: InputDecoration(
              isDense: true,
              errorMaxLines: 2,
              hintMaxLines: 2,
              hintText: widget.hintText,
              hintStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: greyColor,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: const BorderSide(
                  color: primaryColor,
                  width: borderWidth,
                ),
              ),
              errorStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: errorColor,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: const BorderSide(
                  color: whiteF7Color,
                  width: borderWidth,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: const BorderSide(
                  color: successColor,
                  width: borderWidth,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: const BorderSide(
                  color: errorColor,
                  width: borderWidth,
                ),
              ),
            ),
            validator: widget.validator,
          );
  }
}
