// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'image_a_p_i_state_x.dart' show ImageAPIStateX, BoxShapeCircleWidget;

///
class RandomFox extends BoxShapeCircleWidget {
  ///
  const RandomFox({
    Key? key,
    required super.width,
    required super.height,
  }) : super(key: key);

  @override
  State createState() => RandomFoxState();
}

class RandomFoxState extends ImageAPIStateX<FFStatefulWidget> {
  RandomFoxState()
      : super(
//          controller: FoxController(),
          uri: Uri(
            scheme: 'https',
            host: 'randomfox.ca',
            path: 'floof',
          ),
          message: 'image',
        );
}

// ///
// class FoxController extends StateXController {
//   ///
//   factory FoxController() => _this ??= FoxController._();
//   FoxController._();
//   static FoxController? _this;
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
