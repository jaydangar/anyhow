import 'package:flutter/material.dart';

class MediaQueryUtils {
  Size size;
  final BuildContext context;

  MediaQueryUtils({@required this.context}) {
    size = MediaQuery.of(context).size;
  }

  get height => size.height;
  get width => size.width;
}
