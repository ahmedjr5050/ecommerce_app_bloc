// ignore_for_file: use_rethrow_when_possible

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
      return response.data;
    } catch (error) {
      throw error; // Rethrow the error to propagate it further if needed
    }
  }

  Future<dynamic> signin(String endpoint, String email, String password) async {
    try {
      final response = await _dio.post(
        baseUrl + endpoint,
        data: {'email': email, 'password': password},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      return response.data;
    } catch (error) {
      throw error; // Rethrow the error to propagate it further if needed
    }
  }
  Future<dynamic> signup(String endpoint, String name, String email,String password,String phone) async {
    try {
      final response = await _dio.post(
        baseUrl + endpoint,
        data: {'name':name,'email': email, 'password': password,'phone':phone},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      return response.data;
    } catch (error) {
      throw error; // Rethrow the error to propagate it further if needed
    }
  }
}
