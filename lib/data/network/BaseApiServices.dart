// ignore_for_file: file_names

abstract class BaseApiServices {
  Future<dynamic> getApiResponse(String? url);
  Future<dynamic> postApiResponse(String? url, dynamic data);
}
