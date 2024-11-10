import 'package:dio/dio.dart';

import 'consatnt.dart';

class ApiService {
  final Dio dio;

  ApiService()
      : dio = Dio(BaseOptions(
    baseUrl: 'https://cargotech.bandtech-app.com',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
  )) {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // تحديث التوكن إذا لزم الأمر
        options.headers['Authorization'] = 'Bearer $token';
        return handler.next(options);
      },
    ));
  }

  // Future<Response?> fetchData(String endpoint, {Map<String, dynamic>? queryParams}) async {
  //   try {
  //     final response = await dio.get(endpoint, queryParameters: queryParams);
  //     print(response.data);
  //   } catch (e) {
  //     print('Error: $e');
  //   }
  // }
  Future<Response?> fetchData(String endpoint, {Map<String, dynamic>? queryParams}) async {
    try {
      final response = await dio.get(endpoint, queryParameters: queryParams);
      print('Response data: ${response.data}');  // Optional: Log data for debugging
      return response;
    } catch (e) {
      print('Fetch error: $e');
      return null;  // Return null to indicate a failure
    }
  }
  // Future postData(String endpoint, {Map<String, dynamic>? data}) async {
  //   try {
  //     final response = await dio.post(endpoint, data: data);
  //     print(response.data);
  //   } catch (e) {
  //     print('Error: $e');
  //   }
  // }
  Future<Response?> postData(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      final response = await dio.post(
        endpoint,
        data: data,
        options: Options(
          followRedirects: false, // تعطيل إعادة التوجيه
          validateStatus: (status) => status != null && status < 400, // السماح بحالة 300-399
        ),
      );
      print("Response Data: ${response.data}");
      print("Status Code: ${response.statusCode}");
      return response;
    } catch (e) {
      if (e is DioException && e.response != null) {
        print('Error Status Code: ${e.response?.statusCode}');
        print('Error Headers: ${e.response?.headers}');
        print('Error Data: ${e.response?.data}');
      } else {
        print('General Error: $e');
      }
      return Response(
        requestOptions: RequestOptions(path: endpoint),
        statusCode: 500,
        data: {'message': 'Error during post request: $e'},
      );
    }
  }
  // Future<Response?> postData(String endpoint, {Map<String, dynamic>? data}) async {
  //   try {
  //     final response = await dio.post(endpoint, data: data);
  //     print(response.data);
  //     return response;
  //   } catch (e) {
  //     print('Error: $e');
  //     return null;
  //   }
  // }
  Future putData(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      final response = await dio.put(endpoint, data: data,
      options: Options(
        followRedirects: false, // تعطيل إعادة التوجيه
        validateStatus: (status) => status != null && status < 400, // السماح بحالة 300-399
      ),
    );
    print("Response Data: ${response.data}");
    print("Status Code: ${response.statusCode}");
    return response;
    } catch (e) {
      if (e is DioException && e.response != null) {
        print('Error Status Code: ${e.response?.statusCode}');
        print('Error Headers: ${e.response?.headers}');
        print('Error Data: ${e.response?.data}');
      } else {
        print('General Error: $e');
      }
      return Response(
        requestOptions: RequestOptions(path: endpoint),
        statusCode: 500,
        data: {'message': 'Error during post request: $e'},
      );
    }
  }

  Future<Response?> deleteData(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      final response = await dio.delete(
        endpoint,
        data: data,
        options: Options(
          followRedirects: false, // Disable redirection
          validateStatus: (status) => status != null && status < 400, // Allow status codes 300-399
        ),
      );

      print('Response Data: ${response.data}');
      return response;

    } catch (e) {
      if (e is DioException && e.response != null) {
        // Detailed error logging for better debugging
        print('Error Status Code: ${e.response?.statusCode}');
        print('Error Headers: ${e.response?.headers}');
        print('Error Data: ${e.response?.data}');

        return Response(
          requestOptions: RequestOptions(path: endpoint),
          statusCode: e.response?.statusCode,
          data: e.response?.data ?? {'message': 'Unknown error in DioException'},
        );

      } else {
        // General error logging
        print('General Error: $e');

        return Response(
          requestOptions: RequestOptions(path: endpoint),
          statusCode: 500,
          data: {'message': 'Unexpected error occurred: $e'},
        );
      }
    }
  }
}