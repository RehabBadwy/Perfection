import 'package:flutter/material.dart';
import '../theming/colors.dart';
import '../theming/styles.dart';

class Button extends StatelessWidget {
  final String text;
  final double width ;
  final double height;
  final Function onPressed;
  const Button({super.key,
    required this.text,
    required this.width,
    this.height =57,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onPressed();
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: ColorsManager.red,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
          child: Text(text,
            style: TextStyles.font16Medium.copyWith(
                color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}
