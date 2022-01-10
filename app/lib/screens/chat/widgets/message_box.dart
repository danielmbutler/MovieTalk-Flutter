import 'package:amplify_flutter/amplify.dart';
import 'package:app/screens/chat/widgets/message_bubble.dart';
import 'package:app/utils/view_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var message = "";

class MessageBox extends StatefulWidget {
  final Function sendMessage;
  final Function scrollToBottom;
  MessageBox(this.sendMessage, this.scrollToBottom);

  @override
  _MessageBox createState() => _MessageBox();
}

class _MessageBox extends State<MessageBox> {
  @override
  Widget build(BuildContext context) {
    var message = "";

    TextEditingController controller = TextEditingController();
    controller.addListener(() {
      if (controller.text.length > 1) {
        message = controller.text.toString();
      }
    });

    controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length));

    void sendMessage() {
      if(message.isEmpty){
        ViewUtils.showSnackBar(context, "message is empty");
        return;
      }
      widget.sendMessage(message);
      widget.scrollToBottom();
      controller.clear();
    }

    return Container(
        margin: const EdgeInsets.only(left: 12, right: 12, bottom: 10),
        child: TextField(
            autofocus: false,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            controller: controller,
            onTap: () => {widget.scrollToBottom()},
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(color: Colors.black),
              ),
              suffixIcon: IconButton(
                icon: Icon(Icons.send), onPressed: () { sendMessage(); },
              )
            ),

        )
    );
  }


}
