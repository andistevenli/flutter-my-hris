import 'package:flutter/material.dart';
import 'package:my_hris/feature/widget/text_action_button.dart';
import 'package:my_hris/utils/constant/constant_color.dart';
import 'package:my_hris/utils/extension/typography.dart';

class CustomBottomSheetBuilder extends StatefulWidget {
  final String title;
  final List<Widget> content;

  const CustomBottomSheetBuilder({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  State<CustomBottomSheetBuilder> createState() => _CustomBottomSheetBuilder();
}

class _CustomBottomSheetBuilder extends State<CustomBottomSheetBuilder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: .5,
                  color: lightGreyColor,
                ),
              ),
            ),
            height: 64,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  widget.title.lg(
                    1,
                    TextOverflow.ellipsis,
                    color: primaryColor,
                    bold: true,
                    textAlign: TextAlign.center,
                  ),
                  TextActionButton(
                    text: 'Cancel',
                    bgColor: whiteColor,
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ListView(
                children: widget.content,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
