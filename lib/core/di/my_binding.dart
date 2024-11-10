


import 'package:get/get.dart';
import '../../features/users/logic/users_controller.dart';
import '../helper/api_server.dart';
import '../helper/cash.dart';




class MyBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    await CacheHelper.init();


    ApiService apiService = ApiService();
    Get.put(apiService);


      Get.put(UsersController(apiService: apiService), permanent: true,);

      // UsersController controller = Get.find<UsersController>();


  }
}