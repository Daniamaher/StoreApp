/*import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api{
Future<dynamic>get({required String url,@required String ? token})async{
  Map <String,String>headers={};

http.Response response=await http.get(Uri.parse(url),headers: headers);
    
    if(response.statusCode==200){
      return jsonDecode(response.body);
    }
    else{
       throw Exception('there is a problem with status code ${response.statusCode}');


    }

}





Future <dynamic> post ({required String url , @required dynamic body,@required String ? token})async{
Map <String,String>headers={};
/*if(token!=null){
  headers.addAll('Authorozation':'Bearer $token')
}*/
http.Response response = await http.post(Uri.parse(url),
         body:body,
         /*headers: {
            'Accept':'application/json',
            'Content-Type':'multipart/form-data',
          }*/
          );
  if(response.statusCode==200){
   Map<String,dynamic> data=jsonDecode(response.body);
   return data;
}

else{
throw Exception('there is a problem with status code ${response.statusCode} with body ${jsonDecode(response.body)}');

}
}

  put({required String url, required Map<String, String> body}) {}
}





















Future<Map<String, dynamic>> put({
  required String url,
  required dynamic body,
  String? token,
}) async {
  Map<String, String> headers = {};
  headers.addAll({'Content-Type': 'application/x-www-form-urlencoded'});

  /*if(token!=null){
    headers.addAll({'Authorization':'Bearer $token'});
  }*/
    print('url = $url body = $body token = $token ');

  http.Response response = await http.put(
    Uri.parse(url),
    body: body,
    headers: headers,
  );

  if (response.statusCode == 200) {
    Map<String, dynamic> data = jsonDecode(response.body);
    print(data);
    return data;
  } else {
    throw Exception('There is a problem with status code ${response.statusCode} with body ${jsonDecode(response.body)}');
  }
}
*/













import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url, @required String? token}) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode}');
    }
  }

  Future<dynamic> post(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response =
        await http.post(Uri.parse(url), body: body, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return data;
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode} with body ${jsonDecode(response.body)}');
    }
  }

  Future<dynamic> put(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {};
    headers.addAll({'Content-Type': 'application/x-www-form-urlencoded'});
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    print('url = $url body = $body token = $token ');
    http.Response response =
        await http.put(Uri.parse(url), body: body, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      print(data);
      return data;
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode} with body ${jsonDecode(response.body)}');
    }
  }
}