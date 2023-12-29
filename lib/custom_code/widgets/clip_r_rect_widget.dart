// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert' show Encoding;
import 'package:flutter/foundation.dart' as ff;
import 'package:http/http.dart' as http;
import 'package:encrypt/encrypt.dart' as ee;
import 'image_a_p_i_state_x.dart';
import 'package:encrypt/encrypt.dart';

abstract class ClipRRectWidget extends FFStatefulWidget {
  const ClipRRectWidget({
    ff.Key? key,
    required super.width,
    required super.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, {Widget? child}) => ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: SizedBox(
          width: width,
          height: height,
          child: child,
        ),
      );

  @override
  State createState();
}

class HttpService {
  HttpService({int? timeOut}) {
    timeOutLimit = Duration(seconds: timeOut ?? 15);
  }
  late Duration timeOutLimit;

  Future<http.Response> delete(Uri url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    return http
        .delete(url, headers: headers, body: body, encoding: encoding)
        .timeout(timeOutLimit);
  }

  Future<http.Response> get(Uri url, {Map<String, String>? headers}) {
    return http.get(url, headers: headers).timeout(timeOutLimit);
  }

  Future<http.Response> patch(Uri url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    return http
        .patch(url, headers: headers, body: body, encoding: encoding)
        .timeout(timeOutLimit);
  }

  Future<http.Response> post(Uri url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    return http
        .post(url, headers: headers, body: body, encoding: encoding)
        .timeout(timeOutLimit);
  }

  Future<http.Response> put(Uri url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    return http
        .put(url, headers: headers, body: body, encoding: encoding)
        .timeout(timeOutLimit);
  }

  Future<Uint8List> readBytes(Uri url, {Map<String, String>? headers}) {
    return http.readBytes(url, headers: headers).timeout(timeOutLimit);
  }
}

String? apiKEY;

final key = 'SbP1S2lC/ABJQQwCK1f5Zh79fZ4ogZRsCzXRyJHUk6c=';

final iv = '9897180ef0320b1c4f1abf3fddbb6b2b';

class PexelsAPI {
  factory PexelsAPI() => _this ??= PexelsAPI._();
  PexelsAPI._();
  static PexelsAPI? _this;

  void getSearchWallpaper(String searchQuery) async {
    //
    final http.Response response = await http.get(
        Uri.parse(
            'https://api.pexels.com/v1/search?query=$searchQuery&per_page=30&page=1'),
        headers: {'Authorization': apiKEY!});

    final Map<String, dynamic> jsonData = jsonDecode(response.body);

    // jsonData['photos'].forEach((e) {
    //   PhotosModel photosModel = PhotosModel();
    //   photosModel = PhotosModel.fromMap(e);
    //   photos.add(photosModel);
    // });
  }
}

String encrypt(String? text) {
  //
  var en = '';
  if (text != null && text.isNotEmpty) {
    final enc = Encrypter(AES(ee.Key.fromBase64(key)));
    en = enc.encrypt(text, iv: IV.fromBase16(iv)).base64;
  }
  return en;
}

String decrypt(String? text) {
  //
  var de = '';
  if (text != null && text.isNotEmpty) {
    final enc = Encrypter(AES(ee.Key.fromBase64(key)));
    de = enc.decrypt(ee.Key.fromBase64(text), iv: IV.fromBase16(iv));
  }
  return de;
}
