// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom widgets

export 'package:json_response/json_response.dart';

import 'image_a_p_i_state_x.dart' show BoxShapeCircleWidget;

///
class RandomBird extends BoxShapeCircleWidget {
  ///
  const RandomBird({
    Key? key,
    required super.width,
    required super.height,
  }) : super(key: key);

  @override
  State createState() => RandomBirdState();
}

class RandomBirdState extends ImageAPIStateX<FFStatefulWidget> {
  RandomBirdState()
      : super(
//          controller: BirdController(),
          uri: Uri(
            scheme: 'https',
            host: 'shibe.online',
            path: 'api/birds',
          ),
        );
}

// /// This SOC is associated with the Bird images and works with
// /// InheritBird StatefulWidget and the InheritedWidget, _BirdInherited
// class BirdController extends StateXController {
//   ///
//   factory BirdController() => _this ??= BirdController._();
//   BirdController._();
//   static BirdController? _this;
//
//   /// Link this Controller's Widget to a specific InheritedWidget
//   /// The InheritedWidget is the first State object it registered with.
//   @override
//   bool dependOnInheritedWidget(BuildContext? context) =>
//       states.first.dependOnInheritedWidget(context);
//
//   /// Rebuild the InheritedWidget to also rebuild its dependencies.
//   void newAnimals() => states.first.notifyClients();
// }
