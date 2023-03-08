import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthServices extends ChangeNotifier{
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseToken = 'AIzaSyDPpnWQ5D4xW1CiTr1Sie4_PzSVAdNZmNk';

  Future<String?> createUser(String email, String pasword) async{
    final Map<String, dynamic> authData = {
      'email': email,
      'password': pasword
    };
    final url = Uri.https(_baseUrl, '/v1/accounts:signUp',{
      'key': _firebaseToken
    });
    final  resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodeResp = json.decode(resp.body);

    print(decodeResp);
  }

  Future<String?> login(String email, String pasword) async{
    final Map<String, dynamic> authData = {
      'email': email,
      'password': pasword
    };
    final url = Uri.https(_baseUrl, '/v1/accounts:signInWithPassword',{
      'key': _firebaseToken
    });
    final  resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodeResp = json.decode(resp.body);

    print(decodeResp);
  }
}