import 'package:flutter/material.dart';

var navigatorKey = GlobalKey<NavigatorState>();
var navigator = navigatorKey.currentState;

extension Navigation on NavigatorState {
  Future pushScreen(Widget widget) {
    return this.push(MaterialPageRoute(
        builder: (context) => widget,
        settings: RouteSettings(name: widget.key.toString())));
  }

  Future pushReplacementScreen(Widget widget) {
    return this.pushReplacement(MaterialPageRoute(
        builder: (context) => widget,
        settings: RouteSettings(name: widget.key.toString())));
  }

  Future pushAndRemoveUntilScreen(Widget widget) {
    return this.pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (context) => widget,
            settings: RouteSettings(name: widget.key.toString())),
        (route) => false);
  }
}
