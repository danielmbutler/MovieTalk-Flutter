
import 'package:app/models/Message.dart';
import 'package:app/screens/chat/widgets/message_bubble.dart';
import 'package:app/screens/chat/widgets/message_box.dart';
import 'package:flutter/cupertino.dart';


class MessageList extends StatefulWidget {

  final String movieId;
  final String username;
  final String currentUserId;
  final List<Message> messages;
  final Function sendMessage;

  MessageList(this.currentUserId, this.messages, this.sendMessage, this.movieId, this.username);

  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  ScrollController _scrollController = ScrollController();

  _scrollToBottom() {
    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  }


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // scroll to bottom once list view is built
    WidgetsBinding.instance?.addPostFrameCallback((_) => _scrollToBottom());
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
      Expanded(child: ListView.builder(
      itemCount: widget.messages.length,
      scrollDirection: Axis.vertical,
      controller: _scrollController,
      shrinkWrap: true,
      itemBuilder: (context,index) {
        Message message = widget.messages[index];
        bool isCurrentUser = message.fromId == widget.currentUserId;
        return MessageBubble(text: message.message! , isCurrentUser: isCurrentUser, time: message.timestamp!, username: message.fromUsername!);
      },
    )),
      MessageBox((message) => {
        setState(() {
         widget.sendMessage(message, widget.currentUserId, widget.movieId , widget.username);
        })
      }, _scrollToBottom)
    ]);
  }
}
