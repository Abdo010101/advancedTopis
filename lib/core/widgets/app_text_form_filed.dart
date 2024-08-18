import 'package:development/core/helpers/spacing.dart';
import 'package:development/core/theming/colors.dart';
import 'package:development/core/theming/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  final String hintText;
  final bool? obstureText;
  final EdgeInsetsGeometry? contextPadding;
  final TextStyle? hintStyle;
  final Widget? suffixIcon;
  final Widget? pefixIcon;
  final Color? backgroundColor;
  final OutlineInputBorder? enableBorder;
  final OutlineInputBorder? focusBorder;

  const AppTextFormField(
      {super.key,
      required this.hintText,
      this.obstureText,
      this.contextPadding,
      this.hintStyle,
      this.suffixIcon,
      this.backgroundColor,
      this.focusBorder,
      this.enableBorder,
      this.pefixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyles.font14DarkBlueMedium,
      obscureText: obstureText ?? false,
      decoration: InputDecoration(
        // give you more control about padding
        isDense: true,
        contentPadding: contextPadding ??
            EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        hintText: hintText,
        hintStyle: hintStyle ?? TextStyles.font14LightGrayRegular,

        suffixIcon: pefixIcon,
        prefixIcon: suffixIcon,

        fillColor: backgroundColor ?? ColorsManager.moreLighterGray,
        filled: true,

        enabledBorder: enableBorder ??
            OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide:
                    BorderSide(width: 1.3, color: ColorsManager.lighterGray)),
        focusedBorder: focusBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: ColorsManager.mainBlue),
            ),
      ),
    );
  }
}
