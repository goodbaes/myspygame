import 'package:flutter/widgets.dart';

abstract class Feature {
  String get name;
  Map<String, WidgetBuilder> get routes;
}
