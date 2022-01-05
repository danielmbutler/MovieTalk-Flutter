
import 'package:flutter/material.dart';

class ViewUtils {

  static void showSnackBar(BuildContext context, String message){
     var snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static String getCurrentTime(){
    return DateTime.now().hour.toString() + ":" + DateTime.now().minute.toString();
  }
}
