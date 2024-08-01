
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToastNormal(msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 14.0);
}

showToastError(msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 14.0);
}

showToastSuccess(msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 14.0);
}

customSnackBarSuccess(BuildContext context, String title, Color color){
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content:
        Text(title,
            style: const TextStyle(
              fontFamily: "Constantia",
              fontSize: 14,
              fontWeight: FontWeight.w400,
            )
        ),
        backgroundColor: color,
      ));
}