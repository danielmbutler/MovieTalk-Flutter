import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServerStatus extends StatefulWidget {
   final String message;
   final bool isServerRunning;
   ServerStatus(this.message,this.isServerRunning);

  @override
  _ServerStatusState createState() => _ServerStatusState(message, isServerRunning);
}

class _ServerStatusState extends State<ServerStatus> {
  final String message;
  final bool isServerRunning;
  _ServerStatusState(this.message, this.isServerRunning);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
            "Movie Talk Server Status: $message"
        ),
        const Padding(padding: EdgeInsets.only(right: 6.0)),
        Container(
          width: 10.0,
          height: 10.0,
          decoration: BoxDecoration(
            color: isServerRunning ? Colors.green : Colors.red,
            shape: BoxShape.circle,
          ),)
      ],
    );
  }
}
