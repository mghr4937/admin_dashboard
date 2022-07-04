import 'package:dio/dio.dart';
import 'package:admin_dashboard/services/local_storage.dart';

class CafeApi {
  static Dio _dio = Dio();

  static void configure() {
    _dio.options.baseUrl = 'http://localhost:8080/api';
    _dio.options.headers = {'x-token': LocalStorage.prefs.getString('token') ?? ''};
  }

  static Future httpGet(String path) async {
    try {
      final response = await _dio.get(path);
      return response.data;
    } catch (e) {
      print(e);
      throw ('Error en GET');
    }
  }

  static Future httpPost(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);
    try {
      final response = await _dio.post(path, data: formData);
      return response.data;
    } catch (e) {
      print(e);
      throw ('Error en POST');
    }
  }

  static Future httpPut(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);
    try {
      final response = await _dio.put(path, data: formData);
      return response.data;
    } catch (e) {
      print(e);
      throw ('Error en PUT');
    }
  }

  static Future httpDelete(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);
    try {
      final response = await _dio.delete(path, data: formData);
      return response.data;
    } catch (e) {
      print(e);
      throw ('Error en DELETE');
    }
  }
}
