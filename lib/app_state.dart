import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _apiKEY = await secureStorage.getString('ff_apiKEY') ?? _apiKEY;
    });
    await _safeInitAsync(() async {
      _key = await secureStorage.getString('ff_key') ?? _key;
    });
    await _safeInitAsync(() async {
      _iv = await secureStorage.getString('ff_iv') ?? _iv;
    });
    await _safeInitAsync(() async {
      _host = await secureStorage.getString('ff_host') ?? _host;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _apiKEY =
      'liYxRskqljyclu+mmWy95ka5yREiWtvuq2fTpYN92C4YpufhQ/gMVegYbWPqmeboaFD+owZSli87QQUhSfrnsw==';
  String get apiKEY => _apiKEY;
  set apiKEY(String _value) {
    _apiKEY = _value;
    secureStorage.setString('ff_apiKEY', _value);
  }

  void deleteApiKEY() {
    secureStorage.delete(key: 'ff_apiKEY');
  }

  String _key = 'SbP1S2lC/ABJQQwCK1f5Zh79fZ4ogZRsCzXRyJHUk6c=';
  String get key => _key;
  set key(String _value) {
    _key = _value;
    secureStorage.setString('ff_key', _value);
  }

  void deleteKey() {
    secureStorage.delete(key: 'ff_key');
  }

  String _iv = '9897180ef0320b1c4f1abf3fddbb6b2b';
  String get iv => _iv;
  set iv(String _value) {
    _iv = _value;
    secureStorage.setString('ff_iv', _value);
  }

  void deleteIv() {
    secureStorage.delete(key: 'ff_iv');
  }

  String _host = 'sTcRO90YrwvA0Ka3okTKjg==';
  String get host => _host;
  set host(String _value) {
    _host = _value;
    secureStorage.setString('ff_host', _value);
  }

  void deleteHost() {
    secureStorage.delete(key: 'ff_host');
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
