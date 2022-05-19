import 'package:weather_app/constants/textstyle.dart';
import 'package:weather_app/utils/color.dart';

import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final bool centered;
  final bool multitext;
  final TextOverflow overflow;
  final Color? color;
  final int? maxlines;
  final double? height;
  final TextAlign? textAlign;

  /// this is heading 1 semi bold style, font size = 29, fontweight = 600.
  AppText.heading1SB(
    this.text, {
    Key? key,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.centered = false,
    this.multitext = false,
    this.textAlign,
    this.maxlines,
    this.height,
  })  : style = heading1SemiBoldStyle.copyWith(color: color),
        super(key: key);

  /// this is heading 1 Medium style, font size = 29, fontweight = 500.
  AppText.heading1M(
    this.text, {
    Key? key,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.centered = false,
    this.multitext = false,
    this.textAlign,
    this.maxlines,
    this.height,
  })  : style = heading1MediumStyle.copyWith(color: color),
        super(key: key);

  /// this is heading 1 Regular style, font size = 29, fontweight = 400.
  AppText.heading1R(
    this.text, {
    Key? key,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.centered = false,
    this.multitext = false,
    this.textAlign,
    this.maxlines,
    this.height,
  })  : style = heading1RegularStyle.copyWith(color: color),
        super(key: key);

  /// this is heading 2 semi bold style, font size = 26, fontweight = 600.
  AppText.heading2SB(
    this.text, {
    Key? key,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.centered = false,
    this.multitext = false,
    this.textAlign,
    this.maxlines,
    this.height,
  })  : style = heading2SemiBoldStyle.copyWith(color: color),
        super(key: key);

  /// this is heading 2 Medium style, font size = 26, fontweight = 500.
  AppText.heading2M(
    this.text, {
    Key? key,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.centered = false,
    this.multitext = false,
    this.textAlign,
    this.maxlines,
    this.height,
  })  : style = heading2MediumStyle.copyWith(color: color),
        super(key: key);

  /// this is heading 2 Regular style, font size = 26, fontweight = 400.
  AppText.heading2R(
    this.text, {
    Key? key,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.centered = false,
    this.multitext = false,
    this.textAlign,
    this.maxlines,
    this.height,
  })  : style = heading2RegularStyle.copyWith(color: color),
        super(key: key);

  /// this is heading 3 semi bold style, font size = 23, fontweight = 600.
  AppText.heading3SB(
    this.text, {
    Key? key,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.centered = false,
    this.multitext = false,
    this.textAlign,
    this.maxlines,
    this.height,
  })  : style = heading3SemiBoldStyle.copyWith(color: color),
        super(key: key);

  /// this is heading 1 Medium style, font size = 23, fontweight = 500.
  AppText.heading3M(
    this.text, {
    Key? key,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.centered = false,
    this.multitext = false,
    this.textAlign,
    this.maxlines,
    this.height,
  })  : style = heading3MediumStyle.copyWith(color: color),
        super(key: key);

  /// this is heading 3 Regular style, font size = 23, fontweight = 400.
  AppText.heading3R(
    this.text, {
    Key? key,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.centered = false,
    this.multitext = false,
    this.textAlign,
    this.maxlines,
    this.height,
  })  : style = heading3RegularStyle.copyWith(color: color),
        super(key: key);

  /// this is heading 1 semi bold style, font size = 20, fontweight = 600.
  AppText.heading4SB(
    this.text, {
    Key? key,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.centered = false,
    this.multitext = false,
    this.textAlign,
    this.maxlines,
    this.height,
  })  : style = heading4SemiBoldStyle.copyWith(color: color),
        super(key: key);

  /// this is heading 4 Medium style, font size = 20, fontweight = 500.
  AppText.heading4M(
    this.text, {
    Key? key,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.centered = false,
    this.multitext = false,
    this.textAlign,
    this.maxlines,
    this.height,
  })  : style = heading4MediumStyle.copyWith(color: color),
        super(key: key);

  /// this is heading 4 Regular style, font size = 20, fontweight = 400.
  AppText.heading4R(
    this.text, {
    Key? key,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.centered = false,
    this.multitext = false,
    this.textAlign,
    this.maxlines,
    this.height,
  })  : style = heading4RegularStyle.copyWith(color: color),
        super(key: key);

  /// this is heading 5 semi bold style, font size = 18, fontweight = 600.
  AppText.heading5SB(
    this.text, {
    Key? key,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.centered = false,
    this.multitext = false,
    this.textAlign,
    this.maxlines,
    this.height,
  })  : style = heading5SemiBoldStyle.copyWith(color: color),
        super(key: key);

  /// this is heading 5 Medium style, font size = 18, fontweight = 500.
  AppText.heading5M(
    this.text, {
    Key? key,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.centered = false,
    this.multitext = false,
    this.textAlign,
    this.maxlines,
    this.height,
  })  : style = heading5MediumStyle.copyWith(color: color),
        super(key: key);

  /// this is heading 5 Regular style, font size = 18, fontweight = 400.
  AppText.heading5R(
    this.text, {
    Key? key,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.centered = false,
    this.multitext = false,
    this.textAlign,
    this.maxlines,
    this.height,
  })  : style = heading5RegularStyle.copyWith(color: color),
        super(key: key);

  /// this is heading 6 semi bold style, font size = 16, fontweight = 600.
  AppText.heading6SB(
    this.text, {
    Key? key,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.centered = false,
    this.multitext = false,
    this.textAlign,
    this.maxlines,
    this.height,
  })  : style = heading6SemiBoldStyle.copyWith(color: color),
        super(key: key);

  /// this is heading 6 Medium style, font size = 16, fontweight = 500.
  AppText.heading6M(
    this.text, {
    Key? key,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.centered = false,
    this.multitext = false,
    this.textAlign,
    this.maxlines,
    this.height,
  })  : style = heading6MediumStyle.copyWith(color: color),
        super(key: key);

  /// this is heading 6 Regular style, font size = 16, fontweight = 400.
  AppText.heading6R(
    this.text, {
    Key? key,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.centered = false,
    this.multitext = false,
    this.textAlign,
    this.maxlines,
    this.height,
  })  : style = heading6RegularStyle.copyWith(color: color),
        super(key: key);

  /// this is textfield text semi bold style, font size = 14, fontweight = 600.
  AppText.textFieldSB(
    this.text, {
    Key? key,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.centered = false,
    this.multitext = false,
    this.textAlign,
    this.maxlines,
    this.height,
  })  : style = textFieldSemiBoldStyle.copyWith(color: color),
        super(key: key);

  /// this is textfield text Medium style, font size = 14, fontweight = 500.
  AppText.textFieldM(
    this.text, {
    Key? key,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.centered = false,
    this.multitext = false,
    this.textAlign,
    this.maxlines,
    this.height,
  })  : style = textFieldMediumStyle.copyWith(color: color),
        super(key: key);

  /// this is textfield text Regular style, font size = 14, fontweight = 400.
  AppText.textFieldR(
    this.text, {
    Key? key,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.centered = false,
    this.multitext = true,
    this.textAlign,
    this.maxlines,
    this.height,
  })  : style = textFieldRegularStyle.copyWith(color: color),
        super(key: key);

  /// this is caption text semi bold style, font size = 12, fontweight = 600.
  AppText.captionSB(
    this.text, {
    Key? key,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.centered = false,
    this.multitext = true,
    this.textAlign,
    this.maxlines,
    this.height,
  })  : style = captionSemiBoldStyle.copyWith(color: color),
        super(key: key);

  /// this is caption text Medium style, font size = 12, fontweight = 500.
  AppText.captionM(
    this.text, {
    Key? key,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.centered = false,
    this.multitext = true,
    this.textAlign,
    this.maxlines,
    this.height,
  })  : style = captionMediumStyle.copyWith(color: color),
        super(key: key);

  /// this is caption text Regular style, font size = 12, fontweight = 400.
  AppText.captionR(
    this.text, {
    Key? key,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.centered = false,
    this.multitext = true,
    this.textAlign,
    this.maxlines,
    this.height,
  })  : style = captionRegularStyle.copyWith(color: color),
        super(key: key);

  /// this is small text semi bold style, font size = 10, fontweight = 600.
  AppText.smallSB(
    this.text, {
    Key? key,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.centered = false,
    this.multitext = true,
    this.textAlign,
    this.maxlines,
    this.height,
  })  : style = smallSemiBoldStyle.copyWith(color: color),
        super(key: key);

  /// this is small text Medium style, font size = 10, fontweight = 500.
  AppText.smallM(
    this.text, {
    Key? key,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.centered = false,
    this.multitext = true,
    this.textAlign,
    this.maxlines,
    this.height,
  })  : style = smallMediumStyle.copyWith(color: color),
        super(key: key);

  /// this is small text Regular style, font size = 10, fontweight = 400.
  AppText.smallR(
    this.text, {
    Key? key,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.centered = false,
    this.multitext = true,
    this.textAlign,
    this.maxlines,
    this.height,
  })  : style = smallRegularStyle.copyWith(color: color),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(height: height),
      overflow: overflow,
      textAlign: centered ? TextAlign.center : textAlign ?? TextAlign.left,
      maxLines: multitext || maxlines != null ? maxlines ?? 999999 : 1,
    );
  }
}
