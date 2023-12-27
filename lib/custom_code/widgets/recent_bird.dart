// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'random_bird.dart';
import 'image_a_p_i_state_x.dart' show ImageAPIStateX, BoxShapeCircleWidget;
import 'package:fluttery_framework/controller.dart' hide AppDrawer;

///
class RecentBird extends BoxShadowWidget {
  ///
  const RecentBird({
    Key? key,
    required super.width,
    required super.height,
  }) : super(key: key);

  @override
  State createState() => RandomBirdState();
}
