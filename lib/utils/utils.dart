import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils{
  static void fieldChanged(BuildContext context , FocusNode current, FocusNode next){
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }






  static toastMessage(String message){
    Fluttertoast.showToast(msg: message,
    backgroundColor: Colors.red
    );
  }
  static void show_Custom_Flushbar(String message, BuildContext context) {

    Flushbar(
      borderRadius: BorderRadius.circular(5),
      flushbarPosition: FlushbarPosition.TOP,
      icon: const Icon(Icons.error, color: Colors.white,),
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(10),

      backgroundGradient: LinearGradient(
        colors: [
          Colors.redAccent,
          Colors.red.shade300,
          Colors.red
        ],
        stops: const [0.4, 0.7, 1],
      ),
      boxShadows: const [
        BoxShadow(
          color: Colors.black45,
          offset: Offset(3, 3),
          blurRadius: 3,
        ),
      ],
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      message: message,
      messageSize: 14,
    ).show(context);
  }
}