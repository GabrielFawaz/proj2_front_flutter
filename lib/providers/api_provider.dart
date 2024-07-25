import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

import '../Services.dart';
class APIProvider extends GetxService{
 ////
 //static String url = "http://192.168.1.110:8000/api/";
static String? token;
 static String url = "http://127.0.0.1:8000/api/";
  late dio.Dio _dio;
 static List<String>? cookies;



 // Getter for the token
//Dio getc()=>Dio()..httpClientAdapter=BrowserHttpClientAdapter(withCredentials: true);
  APIProvider(){
    _dio=dio.Dio(
      dio.BaseOptions(
        //  baseUrl: "https://reqres.in/api/",
        //  connectTimeout: Duration(seconds: 30),
     // 10 minutes in milliseconds
      //  extra: {"withCredentials":true},
          validateStatus: (status){
            return true;
          //  return status!=null && status>=200 && status<300;
          }
      ),

    );

  }

  Future<dio.Response> postRequest(

      String method, Map<String,dynamic> queryParams,dynamic body,{String? cookies,String?token})async{
    // print(1);
    // DioForBrowser dioForBrowser = DioForBrowser(_dio.options);
    // print(2);
    // var adapter= BrowserHttpClientAdapter();
    // print(3);
    // adapter.withCredentials=true;
    // print(4);
    // _dio.httpClientAdapter=adapter;

    print(5);
    if (cookies!=null|| token!=null ){
      _dio.options = dio.BaseOptions(
          headers: {
            'Cookie': cookies??cookies,
            'Authorization' : token?? 'Bearer ${token}'
          }
      );
    }
    print(6);
    dio.Response response=await _dio.post(method,queryParameters: queryParams,data: body);
    print(7);
    print(response.statusCode);
    if(response.statusCode==200){
      // getc();
      return response;
    }else if(response.statusCode==400){
      throw Exception(response.data['error']);
    }else if(response.statusCode==500){
      throw Exception('server error');
    }else{
      throw Exception('unkown error');
    }

  }





  Future<dio.Response> getRequest(String method, Map<String, dynamic>? queryParams,
      {required Map<String, String> headers}) async {

    try {
      dio.Response response = await _dio.get(
        method,
        queryParameters: queryParams,
        options: dio.Options(
          headers: headers,
        ),
      );


      // Handle response based on status code
      if (response.statusCode == 200) {
        return response;
      } else if (response.statusCode == 400) {
        throw Exception(response.data['error']);
      } else if (response.statusCode == 500) {
        throw Exception('server error');
      } else {
        throw Exception('unknown error');
      }
    } catch (e) {
      print('Error: $e');
      if (e is dio.DioError) {
        print('Response data: ${e.response?.data}');
        print('Response headers: ${e.response?.headers}');
        print('Response request: ${e.requestOptions}');
      }
      throw Exception('Error: $e');
    }
  }


  Future<dio.Response> putRequest(
      String method,
      Map<String, dynamic> queryParams,
      dynamic body, {
        required Map<String, String> headers,
      }) async {
    try {
      return await _dio.put(
        method,
        queryParameters: queryParams,
        data: body,
        options: dio.Options(headers: headers),
      );
    } on dio.DioException catch (e) {
      if (e.response != null) {
        print('Dio error: ${e.response!.statusCode} - ${e.response!.data}');
        throw Exception('Server error: ${e.response!.statusCode}');
      } else {
        print('Dio error: ${e.message}');
        throw Exception('Network error: ${e.message}');
      }
    } catch (e) {
      print('General error: $e');
      throw Exception('Error: $e');
    }
  }


 /* Future<dio.Response> putRequest(
      String method, Map<String,dynamic> queryParams)async{
    dio.Response response=await _dio.put(method,queryParameters: queryParams);
    if(response.statusCode==200){
      return response;
    }else if(response.statusCode==400){
      throw Exception(response.data['error']);
    }else if(response.statusCode==500){
      throw Exception('server error');
    }else{
      throw Exception('unkown error');
    }
  }*/


  Future<dio.Response> deleteRequest(String method, {Map<String, String> headers = const {}}) async {
    try {
      final response = await _dio.delete(
        method,
        options: dio.Options(
          headers: headers,
        ),
      );

      if (response.statusCode == 200) {
        return response;
      } else if (response.statusCode == 400) {
        throw Exception(response.data['error']);
      } else if (response.statusCode == 500) {
        throw Exception('server error');
      } else {
        throw Exception('unknown error');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }


}



  
  
  
  






//TODO GET REQUEST
/*
  Future<dio.Response> getRequest(String method, Map<String,dynamic> queryParams)async{
    dio.Response response=await _dio.get(method,queryParameters: queryParams);
    if(response.statusCode==200){
      return response;
    }else if(response.statusCode==400){
      throw Exception(response.data['error']);
    }else if(response.statusCode==500){
      throw Exception('server error');
    }else{
      throw Exception('unkown error');
    }
  }
*/