// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'image_a_p_i_state_x.dart' show ImageAPIStateX, BoxShapeCircleWidget;
import 'package:fluttery_framework/controller.dart' hide AppDrawer;

///
class RandomCat extends BoxShapeCircleWidget {
  ///
  const RandomCat({
    Key? key,
    required super.width,
    required super.height,
  }) : super(key: key);

  @override
  State createState() => RandomCatState();
}

class RandomCatState extends ImageAPIStateX<FFStatefulWidget> {
  RandomCatState()
      : super(
          controller: CatController(),
          uri: Uri(
            scheme: 'https',
            host: 'shibe.online',
            path: 'api/cats',
          ),
          message: 'file',
        );
}

///
class CatController extends StateXController {
  ///
  factory CatController() => _this ??= CatController._();
  CatController._();
  static CatController? _this;

  /// Link this Controller's Widget to a specific InheritedWidget
  /// The InheritedWidget is the first State object it registered with.
  @override
  bool dependOnInheritedWidget(BuildContext? context) =>
      states.first.dependOnInheritedWidget(context);

  /// Rebuild the InheritedWidget to also rebuild its dependencies.
  void newAnimals() => states.first.notifyClients();
}
