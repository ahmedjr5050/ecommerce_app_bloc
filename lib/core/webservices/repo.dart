import 'package:dio/dio.dart';

class HomeRepo {
  static final Dio _dio = Dio();
  String baseUrl = 'https://student.valuxapps.com/api/';
  Future<dynamic> getHomeData(String endpoint) async {
    try {
      final response = await _dio.get(
        baseUrl + endpoint,
      );
      return response.data;
    } catch (error) {
      print('Error fetching home data: $error');
      throw error;
    }
  }
  
  Future<dynamic> search(String endpoint, String query) async {
    try {
      final response = await _dio.post(
        baseUrl + endpoint,
        data: query,
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      print(response.data); // Print the response data
      return response.data;
    } catch (error) {
      print('Error fetching data: $error'); // Print the error message
      throw error; // Rethrow the error to propagate it further if needed
    }
  }
}

