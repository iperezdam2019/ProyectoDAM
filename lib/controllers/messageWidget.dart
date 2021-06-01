import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';


class MessageWidget{

    static void info(BuildContext context, String message, int seconds) {
    Flushbar(
      title: 'Información',
      message: message,
      icon: Icon(
        Icons.info_outline,
        size: 28,
        color: Colors.blue.shade300,
      ),
      leftBarIndicatorColor: Colors.blue.shade300,
      duration: Duration(seconds: seconds),
    )..show(context);
  }

    static void warn(BuildContext context, String message, int seconds) {
    Flushbar(
      title: 'Advertencia',
      message: message,
      icon: Icon(
        Icons.warning,
        size: 28,
        color: Colors.deepOrangeAccent,
      ),
      leftBarIndicatorColor: Colors.deepOrangeAccent,
      duration: Duration(seconds: seconds),
    )..show(context);
  }

      static void warnDuplicate(BuildContext context, String message, int seconds) {
    Flushbar(
      title: 'Advertencia',
      message: message,
      icon: Icon(
        Icons.warning,
        size: 28,
        color: Colors.deepOrangeAccent,
      ),
      leftBarIndicatorColor: Colors.deepOrangeAccent,
      duration: Duration(seconds: seconds),
    )..show(context);
  }
}