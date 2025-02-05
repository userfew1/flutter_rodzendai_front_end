import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "http://localhost:5012/api/";

  // GET Request รองรับ Query Parameters
  Future<dynamic> getData(String endpoint, {Map<String, String>? queryParams}) async {
    Uri url = Uri.parse('$baseUrl$endpoint');
    if (queryParams != null) {
      url = url.replace(queryParameters: queryParams);
    }
    final response = await http.get(url, headers: _defaultHeaders());
    return _handleResponse(response);
  }

  // POST Request
  Future<dynamic> postData(String endpoint, Map<String, dynamic> data, {Map<String, String>? headers}) async {
    final response = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: headers ?? _defaultHeaders(),
      body: jsonEncode(data),
    );
    return _handleResponse(response);
  }

  // PUT Request
  Future<dynamic> putData(String endpoint, Map<String, dynamic> data, {Map<String, String>? headers}) async {
    final response = await http.put(
      Uri.parse('$baseUrl$endpoint'),
      headers: headers ?? _defaultHeaders(),
      body: jsonEncode(data),
    );
    return _handleResponse(response);
  }

  // DELETE Request
  Future<dynamic> deleteData(String endpoint, {Map<String, String>? headers}) async {
    final response = await http.delete(
      Uri.parse('$baseUrl$endpoint'),
      headers: headers ?? _defaultHeaders(),
    );
    return _handleResponse(response);
  }

  // Default Headers
  Map<String, String> _defaultHeaders() {
    return {
      'Content-Type': 'application/json',
    };
  }

  // Handle response
  dynamic _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      try {
        return jsonDecode(response.body);
      } catch (e) {
        return response.body;
      }
    } else {
      throw Exception('Error: ${response.statusCode}, ${response.body}');
    }
  }
}
