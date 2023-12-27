// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

/// Base StatefulWidget to work with FlutterFlow
abstract class FFStatefulWidget extends WHStatefulWidget {
  const FFStatefulWidget({
    Key? key,
    required super.width,
    required super.height,
  }) : super(key: key);

  /// Optionally supplied a child Widget to be considered
  Widget build(BuildContext context, {Widget? child});

  @override
  State createState();
}
