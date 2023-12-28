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

///
class StringCrypt {
  ///
  StringCrypt({
    String? password,
    String? key,
  }) {
    //
    if (password == null || password.trim().isEmpty) {
      password = null;
    } else {
      password = password.trim().padLeft(_length, '+');
    }

    if (key == null || key.trim().isEmpty) {
      key = null;
    } else {
      key = key.trim().padLeft(_length, '+');
    }

    _iv = key == null ? IV.fromSecureRandom(_length) : IV.fromUtf8(key);

    final _key = password == null
        ? ee.Key.fromSecureRandom(_length)
        : ee.Key.fromUtf8(password);

    _encrypter = Encrypter(AES(_key));
  }
  IV? _iv;
  late Encrypter _encrypter;
  // The required length
  final int _length = 16; // 32;

  ///
  Future<String> en(String data, [String? key]) => encrypt(data, key);

  ///
  Future<String> encrypt(String data, [String? key]) async {
    //
    if (key == null || key.trim().isEmpty) {
      key = null;
    } else {
      key = key.trim().padLeft(_length, '+');
    }

    final iv = key == null ? _iv : IV.fromUtf8(key);

    String encrypt;
    try {
      encrypt = _encrypter.encrypt(data, iv: iv).base64;
    } catch (ex) {
      encrypt = '';
      getError(ex);
    }
    return encrypt;
  }

  ///
  Future<String> de(String data, [String? key]) => decrypt(data, key);

  ///
  Future<String> decrypt(String data, [String? key]) async {
    //
    if (key == null || key.trim().isEmpty) {
      key = null;
    } else {
      key = key.trim().padLeft(_length, '+');
    }

    final iv = key == null ? _iv : IV.fromUtf8(key);

    String decrypt;
    try {
      decrypt = _encrypter.decrypt(Encrypted.fromBase64(data), iv: iv);
    } catch (ex) {
      decrypt = '';
      getError(ex);
    }
    return decrypt;
  }

  ///
  bool get hasError => _error != null;

  ///
  bool get inError => _error != null;
  Object? _error;

  ///
  Exception? getError([Object? error]) {
    // Return the stored exception
    Exception? ex;
    if (_error != null) {
      ex = _error as Exception;
    }
    // Empty the stored exception
    if (error == null) {
      _error = null;
    } else {
      if (error is! Exception) {
        error = Exception(error.toString());
      }
      _error = error;
    }
    // Return the exception just past if any.
    return ex ??= error as Exception;
  }

  void test() {
    final plainText = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit';

    final key = ee.Key.fromSecureRandom(32);
    final iv = IV.fromSecureRandom(16);
    final encrypter = Encrypter(AES(key));

    final encrypted = encrypter.encrypt(plainText, iv: iv);
    final decrypted = encrypter.decrypt(encrypted, iv: iv);
  }
}
