import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../core/helper/api_server.dart';
import '../model/all_user_model.dart';
import '../model/user_model.dart';

class UsersController extends GetxController {
  final ApiService? apiService ;
  UsersController({this.apiService});

  @override
  onInit() {
    super.onInit();
    getUserModel();
  }

  UserModel? userModel;
  bool isLoading = false;

  Future<void> getUserModel() async {
    isLoading = true;
    update(); // Call this to notify listeners about loading state change

    try {
      // Fetch data from the API
      final response = await apiService!.fetchData("https://reqres.in/api/users?page=1");

      // Check response status and handle it accordingly
      if (response != null && response.statusCode == 200) {
        // Parse the JSON response into the UserModel object
        userModel = UserModel.fromJson(response.data); // Use response.data['data']
        print("userModel ID: ${userModel!.page}");
        print("userModel ID: ${userModel!.support!.url}");
      } else {
        // Handle unexpected status codes
        print("Failed to load user data. Status code: ${response!.statusCode}");
      }
    } catch (e) {
      // Log the error
      rethrow;
      print("Error occurred while fetching user data: $e");
      // Optionally, you can handle the error further, such as showing a message to the user
    } finally {
      // Update loading state
      isLoading = false;
      update(); // Notify listeners that loading is complete
    }
  }

 AllUserModel ?UserModelOne ;
  Future<void> getUserOne({required int id}) async {
    isLoading = true;
    update(); // Call this to notify listeners about loading state change

    try {
      // Fetch data from the API
      final response = await apiService!.fetchData("https://reqres.in/api/users/$id");

      // Check response status and handle it accordingly
      if (response != null && response.statusCode == 200) {


        // Parse the JSON response into the UserModel object
        UserModelOne = AllUserModel.fromJson(response.data['data']); // Use response.data['data'
        UserModelOne = AllUserModel.fromJson(response.data['support']); // Use response.data['data'
        print("userModel ID: ${UserModelOne!.id}");
        // print("userModel ID: ${UserModelOne!.support!.url}");
      } else {
        // Handle unexpected status codes
        print("Failed to load user data. Status code: ${response!.statusCode}");
      }
    } catch (e) {
      // Log the error
      rethrow;
      print("Error occurred while fetching user data: $e");
      // Optionally, you can handle the error further, such as showing a message to the user
    } finally {
      // Update loading state
      isLoading = false;
      update(); // Notify listeners that loading is complete
    }
  }
}