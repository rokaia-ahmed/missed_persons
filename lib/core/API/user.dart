import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:missed_people/views/home/widgets/app_widgets.dart';

import '../shared_preferences/shared_pref_user.dart';

String baseUrl = 'http://16.171.40.96:9090/users';

Future<Map<String, dynamic>?> login(
    BuildContext context, String email, String password) async {
  String url = '$baseUrl/login';
  http.Response response = await http.post(
    Uri.parse(url),
    body: {
      'email': email,
      'password': password,
    },
  );
  print('Response status code: ${response.statusCode}');
  if (response.statusCode == 200 ||
      response.statusCode == 201 ||
      response.statusCode == 202) {
    return jsonDecode(response.body);
  } else {
    print('error: ${response.body}');
    AppWidgets.showMessage(context, 'Error: ${response.body}');
    return null;
  }
}

Future<Map<String, dynamic>?> signUp(
  BuildContext context,
  String name,
  String phone,
  String email,
  String password,
) async {
  String url = '$baseUrl/signup';
  http.Response response = await http.post(
    Uri.parse(url),
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
    }),
  );
  print('Response status code: ${response.statusCode}');
  if (response.statusCode == 200 ||
      response.statusCode == 201 ||
      response.statusCode == 202) {
    return jsonDecode(response.body);
  } else {
    print('error: ${response.body}');
    AppWidgets.showMessage(context, 'Error: ${response.body}');
    return null;
  }
}

Future<Map<String, dynamic>?> updateData(
  String phone,
  String email,
  String password,
  String name,
  String image,
) async {
  String url = '$baseUrl/update/${PrefUser.getUser()!.id}';
  http.Response response = await http.put(
    Uri.parse(url),
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      'picture': image,
    }),
  );
  print('Response status code: ${response.statusCode}');
  if (response.statusCode == 200 ||
      response.statusCode == 201 ||
      response.statusCode == 202) {
    return jsonDecode(response.body);
  } else {
    print('error: ${response.body}');
    return null;
  }
}

Future<void> sendOTP(BuildContext context, int id) async {
  String url = 'http://16.171.40.96:9090/moaazOTP/sendOtp/$id';
  http.Response response = await http.post(
    Uri.parse(url),
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    },
    body: jsonEncode({}),
  );
  print('Response status code: ${response.statusCode}');
  if (response.statusCode == 200 ||
      response.statusCode == 201 ||
      response.statusCode == 202) {
    return;
  } else {
    print('error: ${response.body}');
    AppWidgets.showMessage(context, 'Error: ${response.body}');
    return;
  }
}

Future<bool> verifyOTP(BuildContext context, int id, String otp) async {
  String url = 'http://16.171.40.96:9090/moaazOTP/verifyOtp';
  http.Response response = await http.post(
    Uri.parse(url),
    body: {
      'userId': id.toString(),
      'otp': otp,
    },
  );
  print('Response status code: ${response.statusCode}');
  if (response.statusCode == 200 ||
      response.statusCode == 201 ||
      response.statusCode == 202) {
    print(response.body);
    return jsonDecode(response.body);
  } else {
    print('error: ${response.body}');
    AppWidgets.showMessage(context, 'Error: ${response.body}');
    return false;
  }
}
