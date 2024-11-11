import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void snackbar({
  required String msg,
  required Color bgcolor,
}) {
  Fluttertoast.showToast(
    msg: msg,
    backgroundColor: bgcolor,
    timeInSecForIosWeb: 1,
    toastLength: Toast.LENGTH_SHORT,
    textColor: Colors.white,
    gravity: ToastGravity.BOTTOM,
  );
}
