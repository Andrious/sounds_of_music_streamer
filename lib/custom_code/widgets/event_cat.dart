// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'random_bird.dart';
import 'event_bird.dart';
import 'random_cat.dart';
import 'clip_r_rect_widget.dart';

class EventCat extends ClipRRectWidget {
  const EventCat({
    Key? key,
    required super.width,
    required super.height,
  }) : super(key: key);

  @override
  State createState() => RandomCatState();
}

///
class FeatureCollections extends PexelsController {
  @override
  Uri getUri() => Uri(
        scheme: 'https',
        host: host,
        path: 'v1/collections/featured',
        query: 'per_page=1',
      );

  /// Retrieve the data
  @override
  Future<List<String>> uriData(Json response) async {
    //
    final List<String> data = [];

    // dynamic dataItem;
    //
    // if (jsonResponse is List) {
    //   int index;
    //   if (message == null ||
    //       message.isEmpty ||
    //       double.tryParse(message) == null) {
    //     index = 0;
    //   } else {
    //     index = int.parse(message);
    //     if (index < 0 || index >= jsonResponse.length) {
    //       index = 0;
    //     }
    //   }
    //   dataItem = jsonResponse[index];
    // } else {
    //   if (message == null || message.isEmpty) {
    //     dataItem = jsonResponse.entries.first;
    //   } else {
    //     dataItem = jsonResponse[message];
    //   }
    // }
    //
    // switch (dataItem.runtimeType) {
    //   case List:
    //     dataItem.forEach(data.add);
    //     break;
    //   case String:
    //     data.add(dataItem);
    //     break;
    // }
    return data;
  }

  @override
  Image createImage() => Image.network(
        src,
        scale: 1,
        excludeFromSemantics: false,
        fit: BoxFit.cover,
        alignment: Alignment.center,
        repeat: ImageRepeat.noRepeat,
        matchTextDirection: false,
        gaplessPlayback: false,
        filterQuality: FilterQuality.low,
        isAntiAlias: false,
      );
}
