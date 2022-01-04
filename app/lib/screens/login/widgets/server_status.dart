import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServerStatus extends StatelessWidget {
  final String message;
  final bool isServerRunning;

  ServerStatus(this.message, this.isServerRunning);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text("Movie Talk Server Status: $message"),
        const Padding(padding: EdgeInsets.only(right: 6.0)),
        Container(
          width: 10.0,
          height: 10.0,
          decoration: BoxDecoration(
            color: isServerRunning ? Colors.green : Colors.red,
            shape: BoxShape.circle,
          ),
        ),
        const Padding(padding: EdgeInsets.only(right: 6.0)),
      ],
    );
  }
}
