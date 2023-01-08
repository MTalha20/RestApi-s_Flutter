import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServices{

static var client = http.Client();


static Future <dynamic>? getUsers (apiUrl, apiEndpoint) async {

  Map <String,String> requestHeaders = {
    'Content-Type': 'application/headers',
    };
  
  var url = Uri.https(apiUrl,apiEndpoint);

  var response = await client.get(url, headers: requestHeaders);

  if (response.statusCode == 200){
    print('get Sucessfull');
    var  data = jsonDecode(response.body);
    print(data['total']);
    return data;
  }

  print('get Error');

  return null;

}

static Future <dynamic>? postUsers (apiUrl, apiEndpoint, name, job) async {

  Map <String,String> requestHeaders = {
    'Content-Type': 'application/headers',
    };
  
  var url = Uri.https(apiUrl,apiEndpoint,);

  var response = await client.post(url, headers: requestHeaders, body: jsonEncode(
    {'name': name,
    'job' : job}
  ));

  if (response.statusCode == 201){
    print('post Sucessfull');
    var  data = jsonDecode(response.body);
    print(data);
    return data;
  }

  print('post Error');

  return null;

}

static Future <dynamic>? updateUsers (apiUrl, apiEndpoint, userId, name, job) async {

  Map <String,String> requestHeaders = {
    'Content-Type': 'application/headers',
    };
  
  var url = Uri.https(apiUrl,'${apiEndpoint}/${userId}',);

  var response = await client.put(url, headers: requestHeaders, body: jsonEncode(
    {'name': name,
    'job' : job}
  ));

  if (response.statusCode == 200){
    print('put Sucessfull');
    var  data = jsonDecode(response.body);
    // print(data);
    return data;
  }

  print('put Error');

  return null;

}

static Future <bool> deleteUsers (apiUrl, apiEndpoint, userId) async {

  Map <String,String> requestHeaders = {
    'Content-Type': 'application/headers',
    };
  
  var url = Uri.https(apiUrl,'${apiEndpoint}/${userId}',);

  var response = await client.delete(url, headers: requestHeaders);

  if (response.statusCode == 204){
    print('delete Sucessfull');
    return true;
  }

  print('delete Error');
  return false;

}

}