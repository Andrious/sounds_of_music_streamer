// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'image_a_p_i_state_x.dart' show ImageAPIStateX, BoxShapeCircleWidget;

///
class RandomDog extends BoxShapeCircleWidget {
  ///
  const RandomDog({
    Key? key,
    required super.width,
    required super.height,
  }) : super(key: key);

  @override
  State createState() => RandomDogState();
}

class RandomDogState extends ImageAPIStateX<FFStatefulWidget> {
  RandomDogState()
      : super(
//          controller: DogController(),
          uri: Uri(
            scheme: 'https',
            host: 'dog.ceo',
            path: 'api/breeds/image/random/1',
          ),
          message: 'message',
        );
}

// ///
// class DogController extends StateXController {
//   ///
//   factory DogController() => _this ??= DogController._();
//   DogController._();
//   static DogController? _this;
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
