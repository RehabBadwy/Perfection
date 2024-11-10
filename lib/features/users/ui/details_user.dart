import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:perfection/core/widget/back.dart';
import 'package:perfection/features/users/logic/users_controller.dart';

import '../../../core/theming/colors.dart';
import '../../../core/theming/styles.dart';

class DetailsUser extends StatelessWidget {
  const DetailsUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      body: SafeArea(
        child: GetBuilder<UsersController>(
          builder: (controller){
            if (controller.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            // التأكد من أن الـ userModel ليس null قبل الوصول إليه
            if (controller.UserModelOne == null) {
              return const Center(child: Text('No data available.'));
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              BackButtonWidget(
                  textName: "User Details",
                  onPressed: (){
                    Get.back();
                  },
                  image: "assets/svg/back.svg",
              ),
                SizedBox(height: 13.h,),

                Center(
                  child: Container(
                    height: 100.h,
                    width: 100.w,
                    decoration: BoxDecoration(

                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(controller.UserModelOne!.avatar),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.h,),
                Padding(
                  padding:  EdgeInsets.symmetric(
                    vertical: 20.h,
                    horizontal: 20.w,
                  ),
                  child: Container(

                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: ColorsManager.divider,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        SizedBox(height: 12.h,),
                        InkWell(
                          onTap: (){

                          },
                          child: Row(
                            children: [
                              Text(
                                "email : ",
                                style: TextStyles.font16Medium.copyWith(
                                  color: ColorsManager.black,
                                ),
                              ),
                              SizedBox(width: 16.w,),
                              Text(controller.UserModelOne!.email,
                                style: TextStyles.font16Medium.copyWith(
                                  color: ColorsManager.black,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 12.h,),
                        Row(
                          children: [
                            Text(
                              "Name : ",
                              style: TextStyles.font16Medium.copyWith(
                                color: ColorsManager.black,
                              ),
                            ),
                            SizedBox(width: 16.w,),
                            Text(
                                "${controller.UserModelOne!.first_name}  ${controller.UserModelOne!.last_name}",
                              style: TextStyles.font16Medium.copyWith(
                                color: ColorsManager.black,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 12.h,),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16.h,),


              ],
            );
          },
        ),
      ),
    );
  }
}
