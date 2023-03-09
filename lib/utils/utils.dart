import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class Utils {
  static void FieldFocusChang(
      BuildContext context, FocusNode current, FocusNode next) {
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.red,
      textColor: Colors.yellow,
      fontSize: 20,
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          backgroundColor: Colors.red,
          forwardAnimationCurve: Curves.decelerate,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: EdgeInsets.all(15),
          flushbarPosition: FlushbarPosition.TOP,
          reverseAnimationCurve: Curves.easeInOut,
          positionOffset: 20,
          icon: const Icon(
            Icons.error,
            size: 28,
            color: Colors.white,
          ),
          duration: Duration(seconds: 3),
          message: message,
        )..show(context));
  }

  static void flushBarSuccessfulMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          backgroundColor: Colors.green,
          forwardAnimationCurve: Curves.decelerate,
          borderRadius: BorderRadius.all(Radius.circular(40)),
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: EdgeInsets.all(15),
          flushbarPosition: FlushbarPosition.TOP,
          reverseAnimationCurve: Curves.easeInOut,
          positionOffset: 20,
          icon: const Icon(
            Icons.error,
            size: 28,
            color: Colors.white,
          ),
          duration: Duration(seconds: 3),
          message: message,
        )..show(context));
  }

  static SnakBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.red,
      content: Text(message),
    ));
  }
}
