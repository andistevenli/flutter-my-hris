import 'package:flutter/widgets.dart';
import 'package:my_hris/utils/constant/constant_color.dart';
import 'package:my_hris/utils/extension/typography.dart';

class InfoList extends StatelessWidget {
  final String title;
  final String subtitle;

  const InfoList({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title.xs(
            1,
            TextOverflow.ellipsis,
            color: greyColor,
            bold: false,
            textAlign: TextAlign.start,
          ),
          subtitle.sm(
            1,
            TextOverflow.ellipsis,
            color: blackColor,
            bold: false,
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
