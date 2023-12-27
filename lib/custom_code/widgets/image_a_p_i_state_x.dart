// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'dart:convert' show json;
import 'f_f_stateful_widget.dart';
import 'package:http/http.dart' as http;
import 'package:fluttery_framework/controller.dart' hide AppDrawer;
import 'package:fluttery_framework/view.dart' hide AppDrawer;

///
abstract class BoxShapeCircleWidget extends FFStatefulWidget {
  ///
  const BoxShapeCircleWidget({
    Key? key,
    required super.width,
    required super.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, {Widget? child}) => Container(
        width: width,
        height: height,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: child,
      );

  @override
  State<StatefulWidget> createState();
}

/// The State object allows for a web service to be called.
class ImageAPIStateX<T extends FFStatefulWidget> extends StateX<T>
    implements ImageAPIState {
  ///
  ImageAPIStateX({
    required this.uri,
    this.message,
    StateXController? controller,
  }) : super(controller: controller) {
    //
    final id = add(ImageAPIController());
    // Retrieve the Controller by its unique id.
    _con = controllerById(id) as ImageAPIController;
  }

  ///
  @override
  final Uri? uri;

  ///
  @override
  final String? message;

  late ImageAPIController _con;

  @override
  Widget buildAndroid(context) {
    controller?.dependOnInheritedWidget(context);
    return GestureDetector(
      onTap: _con.onTap,
      onDoubleTap: _con.onTap,
      child: widget.build(context, child: _con.image ?? const SizedBox()),
    );
  }

  /// Allow initAsync() to run repeatedly.
  @override
  Future<bool> runAsync() => initAsync();

  /// Supply an 'error handler' routine if something goes wrong
  /// in the corresponding initAsync() routine.
  @override
  bool onAsyncError(FlutterErrorDetails details) => false;

  /// Currently not providing an 'iOS' version of the interface.
  @override
  Widget buildiOS(BuildContext context) => buildAndroid(context);
}

///
abstract class ImageAPIState {
  ///
  ImageAPIState({required this.uri, required this.message});

  ///
  final Uri? uri;

  ///
  final String? message;
}

/// This is the 'image API' State Object Controller.
class ImageAPIController extends StateXController {
  /// No factory constructor and so multiple instances of this class is possible.

  /// The List of data returned by the API.
  List<String> _data = [];

  /// The resulting image from the API.
  Image? image;

  ///
  void onTap() => state?.setState(() {});

  /// The number of images loading using this class.
  static int imageCount = 0;

  /// The number of images currently loading
  static int loadingCount = 0;

  /// Contains all the asynchronous operations that must complete before proceeding.
  @override
  Future<bool> initAsync() async {
    bool init;
    try {
      init = await _loadImage();
    } catch (e) {
      init = false;
    }
    return init;
  }

  /// Load the image to
  Future<bool> _loadImage() async {
    // Call the API
    _data = await _getURIData();

    if (_data.isNotEmpty) {
      image = Image.network(_data[0]);
      final imageStream = image!.image.resolve(const ImageConfiguration());
      final completer = Completer<void>();
      imageCount++;
      loadingCount++;
      final listener = ImageStreamListener((ImageInfo info, bool syncCall) {
        // Error if called again and so test if completed.
        if (!completer.isCompleted) {
          completer.complete();
          loadingCount--;
          if (loadingCount == 0) {
            /// All the image(s) have completed loading.
          }
        }
      });
      imageStream.addListener(listener);
      await completer.future;
      // No need anymore. Best to remove in case triggered again.
      imageStream.removeListener(listener);
    }
    return _data.isNotEmpty;
  }

  /// Retrieve the data
  Future<List<String>> _getURIData() async {
    //
    final List<String> data = [];

    // Cast to the abstract class with the two properties.
    final api = state as ImageAPIState;

    final message = api.message;

    final uri = api.uri;

    if (uri != null) {
      //
      final http.Response response = await http.get(uri);

      final jsonResponse = json.decode(response.body);

      dynamic dataItem;

      if (jsonResponse is List) {
        int index;
        if (message == null ||
            message.isEmpty ||
            double.tryParse(message) == null) {
          index = 0;
        } else {
          index = int.parse(message);
          if (index < 0 || index >= jsonResponse.length) {
            index = 0;
          }
        }
        dataItem = jsonResponse[index];
      } else {
        if (message == null || message.isEmpty) {
          dataItem = jsonResponse.entries.first;
        } else {
          dataItem = jsonResponse[message];
        }
      }

      switch (dataItem.runtimeType) {
        case List:
          dataItem.forEach(data.add);
          break;
        case String:
          data.add(dataItem);
          break;
      }
    }
    return data;
  }

  /// Supply an 'error handler' routine if something goes wrong
  /// in the corresponding initAsync() routine.
  @override
  void onAsyncError(FlutterErrorDetails details) {
    super.onAsyncError(details);
  }
}

///
class InheritController extends StateXController {
  /// Link this Controller's Widget to a specific InheritedWidget
  /// The InheritedWidget is the first State object it registered with.
  @override
  bool dependOnInheritedWidget(BuildContext? context) =>
      states.first.dependOnInheritedWidget(context);

  /// Rebuild the InheritedWidget to also rebuild its dependencies.
  void newAnimals() => states.first.notifyClients();
}