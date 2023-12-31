// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'random_bird.dart';
import 'image_a_p_i_state_x.dart';
import 'clip_r_rect_widget.dart';
import 'package:http/http.dart' as http;
import 'package:state_extended/state_extended.dart';

class EventBird extends ClipRRectWidget {
  const EventBird({
    Key? key,
    required super.width,
    required super.height,
  }) : super(key: key);

  @override
  State createState() => RandomBirdState();
}

/// The State object allows for a web service to be called.
class PexelsState<T extends FFStatefulWidget> extends StateX<T> {
  ///
  PexelsState({
    PexelsController? controller,
  }) : super(controller: controller) {
    _con = controller as PexelsController;
  }
  late PexelsController _con;

  // Allows for an InheritedWidget
  @override
  Widget buildIn(context) {
    controller?.dependOnInheritedWidget(context);
    return widget.build(context, child: _con.build(context));
  }

  /// Supply an 'error handler' routine if something goes wrong
  /// in the corresponding initAsync() routine.
  @override
  bool onAsyncError(FlutterErrorDetails details) => false;
}

///
abstract class PexelsController extends StateXController {
  //
  /// The number of images loading using this class.
  static int imageCount = 0;

  /// The number of images currently loading
  static int loadingCount = 0;

  late Map<String, String>? headers = {'Authorization': apiKEY!};

  String src = '';

  /// Optionally supplied a child Widget to be considered
  Widget build(BuildContext context) => const SizedBox();

  /// Contains all the asynchronous operations that must complete before proceeding.
  @override
  Future<bool> initAsync() async {
    bool init;
    try {
      init = await _loadData();
    } catch (e) {
      init = false;
    }
    return init;
  }

  /// Load the image
  Future<bool> _loadData() async {
    //
    /// The List of data returned by the API.
    List<String> _data = [];

    //
    final http.Response response = await http.get(getUri(), headers: headers);

    final jsonResponse = Json.from(response: response);

    // Call the API
    _data = await uriData(jsonResponse);

    if (_data.isNotEmpty) {
      //
      final image = createImage();
      final imageStream = image.image.resolve(const ImageConfiguration());
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

  /// Supply the Uri
  Uri getUri();

  ///
  Image createImage();

  /// Retrieve the data
  Future<List<String>> uriData(Json response);
}
