
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theming/colors.dart';
import '../theming/styles.dart';


class AppDropDown extends StatefulWidget {
  final List<String> items;
  final String? selectedItem;
  final String? hint;
  final double maxHeight;
  final String? leading;
  final Color? border;
  final Color? borderC;
  final VoidCallback? onTap;
  final Function(String) onChange;

  const AppDropDown({
    super.key,
    required this.items,
    required this.selectedItem,
    required this.onChange,
    this.hint,
    this.leading,
    this.border,
    this.borderC,
    this.maxHeight = 250.0,
    this.onTap,
  });

  @override
  State<AppDropDown> createState() => _AppDropDownState();
}

class _AppDropDownState extends State<AppDropDown> {
  final ExpansionTileController controller = ExpansionTileController();
  bool changed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),


      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
              text: TextSpan(
                text: "المحافظه ",
                style:   TextStyles.font12Regular.copyWith(
      color: ColorsManager.black,
      ),

                children: <TextSpan>[
                  TextSpan(
                    text: "*",
                    style: const TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ],
              )),
          SizedBox(height: 10.h),
          Theme(
            data: Theme.of(context).copyWith(
              dividerColor: Colors.transparent,
             // primaryColor:   const Color(0xffDDDDDD),
              listTileTheme: const ListTileThemeData(
           //     contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                dense: true,
                horizontalTitleGap: 10.0,
                minLeadingWidth: 0,
                minVerticalPadding: 0,
              ),
            ),
            child: ExpansionTile(

              leading: widget.leading != null
                  ? SvgPicture.asset(
                widget.leading!,
                colorFilter: ColorFilter.mode(
                    changed ?  Colors.black : Colors.black,
                    BlendMode.srcIn),
              )
                  : null,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
                side:  BorderSide(
                  color:widget.border ??  ColorsManager.stroke,
                  width: 1,
                ),
              ),
              collapsedShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
                side: const BorderSide(
                  color:  ColorsManager.stroke,
                  width: 1,
                ),
              ),
              initiallyExpanded: false,
              backgroundColor: Colors.white,
              collapsedBackgroundColor: Colors.white,
              controller: controller,
              onExpansionChanged: (value) {
                if (value && widget.onTap != null) {
                  widget.onTap!();
                }
              },
              title: Text(
                widget.selectedItem?? widget.hint ?? "",
                softWrap: false,
                style: TextStyles.font14Bold.copyWith(
                  color: changed ? ColorsManager.black : ColorsManager.grey,
                ),
              ),
              trailing: SvgPicture.asset(
                "assets/svg/angle.svg",
                colorFilter: ColorFilter.mode(
                    changed ? ColorsManager.black : ColorsManager.black,
                    BlendMode.srcIn),
                //color: changed ? ColorsManager.black : ColorsManager.black,
              ),
          //    childrenPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              children: [
                Container(

                  constraints: BoxConstraints(
                    maxHeight: widget.maxHeight.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,

                    borderRadius: BorderRadius.circular(20.r),
                    // boxShadow: const [
                    //   BoxShadow(
                    //     color: Color(0x1A000000),
                    //     spreadRadius: 0,
                    //     blurRadius: 15,
                    //     offset: Offset(0, 0),
                    //   ),
                    //],
                  ),
                  child: ListView.separated(
                    padding: const EdgeInsets.only(
                      right: 10
                    ),
                    separatorBuilder: (context, index) {
                      return  SizedBox(
                        height: 5.h,

                      );
                    },
                    shrinkWrap: true,
                    itemCount: widget.items.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {

                          widget.onChange(widget.items[index]);

                          controller.collapse();
                          changed = true;
                          setState(() {});
                        },
                        child: Text(
                          widget.items[index],
                          style: TextStyles.font16Medium,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}