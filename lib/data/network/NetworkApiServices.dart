import 'dart:convert';
import 'dart:io';
import 'package:mvvm/data/app_execaption.dart';
import 'package:mvvm/data/network/BaseApiServices.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends  BaseApiServices{
  @override
  Future getApiResponse(String? url)async {
    dynamic responseJson;
    try{
      final response = await http.put(Uri.parse(url!)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    }on SocketException{
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future postApiResponse(String? url, dynamic data)async {
    dynamic responseJson;
    try{
      http.Response response = await http.put(Uri.parse(url!), body: data).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    }on SocketException{

      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
      dynamic responseJson = jsonDecode(response.body);
      return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
      throw FetchDataException('error occured during communicating with server' +'wiht status code' + response.statusCode.toString());
    }
  }
}