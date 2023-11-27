import 'package:flutter/material.dart';
import 'package:my_hris/utils/constant/constant_unit.dart';

extension Typography on String {
  Text xs(int maxLines, TextOverflow textOverflow,
      {required Color color,
      required bool bold,
      required TextAlign textAlign}) {
    return Text(
      this,
      maxLines: maxLines,
      overflow: textOverflow,
      style: TextStyle(
        color: color,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        fontSize: extraSmallFontSize,
      ),
      textAlign: textAlign,
    );
  }

  Text sm(int maxLines, TextOverflow textOverflow,
      {required Color color,
      required bool bold,
      required TextAlign textAlign}) {
    return Text(
      this,
      maxLines: maxLines,
      overflow: textOverflow,
      style: TextStyle(
        color: color,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        fontSize: smallFontSize,
      ),
      textAlign: textAlign,
    );
  }

  Text md(int maxLines, TextOverflow textOverflow,
      {required Color color,
      required bool bold,
      required TextAlign textAlign}) {
    return Text(
      this,
      maxLines: maxLines,
      overflow: textOverflow,
      style: TextStyle(
        color: color,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        fontSize: mediumFontSize,
      ),
      textAlign: textAlign,
    );
  }

  Text lg(int maxLines, TextOverflow textOverflow,
      {required Color color,
      required bool bold,
      required TextAlign textAlign}) {
    return Text(
      this,
      maxLines: maxLines,
      overflow: textOverflow,
      style: TextStyle(
        color: color,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        fontSize: largeFontSize,
      ),
      textAlign: textAlign,
    );
  }

  Text xl(int maxLines, TextOverflow textOverflow,
      {required Color color,
      required bool bold,
      required TextAlign textAlign}) {
    return Text(
      this,
      maxLines: maxLines,
      overflow: textOverflow,
      style: TextStyle(
        color: color,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        fontSize: extraLargeFontSize,
      ),
      textAlign: textAlign,
    );
  }
}
