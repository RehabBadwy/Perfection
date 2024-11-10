import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theming/colors.dart';
import '../theming/styles.dart';

class TextFieldWidget extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;

  //focuse node
  final FocusNode? focusNode;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final TextInputType? textInputType;
  final String? hintText;
  final String textName;
  final String? star;
  final bool? isObscureText;
  final bool? enable;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Padding? content;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final int? maxLength;
  final int? maxLines;
  final Function(String?) validator;
  final Function(String)? onChanged;

  final bool phoneNumber;
  final String? initialCountryCode;
  final List<FilteringTextInputFormatter>? inputFormatters;

  const TextFieldWidget({
    super.key,
    this.enabledBorder,
    this.contentPadding,
    this.focusedBorder,
    this.inputTextStyle,
    this.prefixIcon,
    this.star,
    this.hintStyle,
    this.textStyle,
    this.textInputType,
    this.content,
    this.onChanged,
     this.hintText,
    this.textName = '',
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    required this.validator,
    this.maxLength,
    this.maxLines,
    this.enable,
    this.inputFormatters,
    this.phoneNumber = false,

    this.focusNode,
    this.initialCountryCode = "LY",
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (textName.isNotEmpty)
          RichText(
              text: TextSpan(
            text: "$textName ",
            style:
            textStyle ??

            TextStyles.font16Medium.copyWith(
              color: ColorsManager.black,
            ),

            children: <TextSpan>[
              TextSpan(
                text: star,
                style: const TextStyle(
                  color: Colors.red,
                ),
              ),
            ],
          )),
        SizedBox(height: 10.h),
        TextFormField(
          inputFormatters: [
            // FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
            // ...?inputFormatters,
            LengthLimitingTextInputFormatter(maxLength ?? 1000),
            ...?inputFormatters
          ],
          focusNode: focusNode,
          enabled: enable ?? true,
          maxLines: maxLines ?? 1,
          maxLength: maxLength,
          controller: controller,
          onChanged: onChanged,
          keyboardType: textInputType ?? TextInputType.text,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(
                color: ColorsManager.container,
              ),
            ),
            contentPadding: contentPadding ??
                EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 10.h,
                ),
            focusedBorder: focusedBorder,
            enabledBorder: enabledBorder,
            hintStyle: hintStyle ??
                TextStyles.font16Regular.copyWith(
                  color: ColorsManager.white,
                ),
            hintText: hintText,
            suffixIcon: suffixIcon,
            fillColor: ColorsManager.white,
            filled: true,
          ),
          obscureText: isObscureText ?? false,
          validator: (value) {
            return validator(value!);
          },
        )

      ],
    );
  }
}
