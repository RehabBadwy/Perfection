import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:perfection/core/routing/routes.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/theming/colors.dart';
import '../../../core/theming/styles.dart';
import '../logic/users_controller.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 20.h,
            ),
            child: GetBuilder<UsersController>(
              builder: (controller) {
                // التأكد من حالة التحميل
                if (controller.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                // التأكد من أن الـ userModel ليس null قبل الوصول إليه
                if (controller.userModel == null) {
                  return const Center(child: Text('No data available.'));
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                          backgroundColor: ColorsManager.purple,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side:  BorderSide(

                                  color:controller.currentPage == 1 ?
                                  ColorsManager.black:
                                  Colors.transparent,
                                  width: 2),
                            ),
                          ),
                          onPressed: () {
                            controller.currentPage = 1;
                            controller.getUserModel(1);
                          },
                          child: const Text("Page 1",
                          style: TextStyle(
                            color: ColorsManager.white,
                          ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorsManager.purple,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side:  BorderSide(

                                  color:controller.currentPage == 2 ?
                                  ColorsManager.black:
                                  Colors.transparent,
                                  width: 2),
                            ),
                          ),
                          onPressed: () {
                            controller.currentPage = 2;
                            controller.getUserModel(2);
                          },
                          child: const Text("Page 2",
                          style: TextStyle(
                            color: ColorsManager.white,
                          ),
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Text(
                          'Page',
                          style: TextStyles.font14Bold.copyWith(
                            color: ColorsManager.borderWallet,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          width: 30,
                          height: 30,
                          decoration: const BoxDecoration(
                              color: ColorsManager.divider,
                              shape: BoxShape.circle
                          ),
                          child: Center(
                            child: Text(
                              controller.userModel?.page.toString()??"",
                              style: TextStyles.font12Medium.copyWith(
                                color: ColorsManager.blackBold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Support :',
                      style: TextStyles.font14Bold.copyWith(
                        color: ColorsManager.borderWallet,
                      ),
                    ),

                    InkWell(
                      onTap: (){
                        final Uri _url = Uri.parse(controller.userModel?.support!.url.toString()??"");

                        _launchUrl(_url);
                      },
                      child: Text(
                        controller.userModel?.support!.url.toString()??"",
                        style: TextStyles.font12Medium.copyWith(
                          color: ColorsManager.blackBold,
                        ),
                      ),
                    ),

                    // Text(
                    //   'text :',
                    //   style: TextStyles.font14Bold.copyWith(
                    //     color: ColorsManager.borderWallet,
                    //   ),
                    // ),
                    //
                    // Text(
                    //   controller.userModel?.support!.text.toString()??"",
                    //   style: TextStyles.font12Medium.copyWith(
                    //     color: ColorsManager.blackBold,
                    //   ),
                    // ),
                    const SizedBox(height: 20),
                    // GridView يظهر فقط عندما تكون البيانات جاهزة
                    GridView.builder(
                      shrinkWrap: true,
                      itemCount: controller.userModel?.data.length??0,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 30,
                          childAspectRatio: 0.7
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: (){
                            controller.getUserOne(
                              id: controller.userModel!.data[index].id
                            );
                            Get.toNamed(Routes.userDetails);
                          },
                          child: Container(
                            key: UniqueKey(),
                            decoration: BoxDecoration(
                              color: ColorsManager.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: ColorsManager.black.withOpacity(0.1),
                                  blurRadius: 10,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 150.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                    image: DecorationImage(
                                      image: NetworkImage(controller.userModel?.data[index].avatar??""),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "${controller.userModel?.data[index].first_name}  ${controller.userModel?.data[index].last_name} ",
                                  style: TextStyles.font12Medium.copyWith(
                                    color: ColorsManager.blackBold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  controller.userModel?.data[index].email ??"",
                                  style: TextStyles.font10Regular.copyWith(
                                    color: ColorsManager.blackBold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
  Future<void> _launchUrl(_url) async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
