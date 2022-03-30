import 'package:catholic/network/user_model.dart';
import 'package:http/http.dart';

import '../util/data_result.dart';

const baseUrl = 'https://api.wowcatholic.org/';
const apiKey = 'Web45k87u23bNR64g094h5wFWa9v56Q1L';
const system = 'WebAPI';

class CatholicService {
  Future getRequest(String url) async {
    final response = await get(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Access-Control_Allow_Origin": "*"
    });
    if (response.statusCode == 200) {
      print('statusCode: $response.statusCode');
      return response.body;
    } else {
      print('statusCode: $response.statusCode');
      return Future.value(null);
    }
  }

  Future postRequest(String url, Map<String, dynamic> json) async {
    print('userLogin Json = $json');
    final response = await post(Uri.parse(url), body: json);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      print('statusCode: $response.statusCode');
      return Future.value(null);
    }
  }

  Future<dynamic> registerUser(User user) async {
    final response = await postRequest(
        baseUrl + 'dating/auth/signup?system=$system&key=$apiKey',
        user.toJson());
    return response;
  }

  Future<dynamic> logInUser(User user) async {
    final response = await postRequest(
        baseUrl + 'dating/auth/login?system=$system&key=$apiKey',
        user.toJson());
    return response;
  }

  Future<dynamic> checkUser(String email) async {
    final response = await getRequest(
        baseUrl + 'dating/user-exist?system=$system&key=$apiKey&email=$email');
    return response;
  }
}
