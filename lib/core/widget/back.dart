import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/theming/colors.dart';
import '../theming/styles.dart';

class BackButtonWidget extends StatelessWidget {

  final String textName;
  final Function()? onPressed;
  final String image;
  final Color? color;
  final Color? colorText;
  const BackButtonWidget(
      {super.key,
        required this.textName,
        this.onPressed,
        required this.image,
        this.color,
        this.colorText,
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center, // التمركز عمودياً
        children: [
          InkWell(
            onTap: onPressed,
            child: SvgPicture.asset(
              image,
              colorFilter: color != null
                  ? ColorFilter.mode(
                color!,
                BlendMode.srcIn,
              )
                  : null,
              width: 40.w,
              height: 40.h,
            ),
          ),
          Expanded( // لضمان أن النص يأخذ المساحة المتبقية
            child: Text(
              textName,
              textAlign: TextAlign.center, // التمركز في المنتصف
              style: TextStyles.font17Bold.copyWith(
                color: colorText ?? ColorsManager.white,
              ),
            ),
          ),
        ],
      ),
    );

  }
}