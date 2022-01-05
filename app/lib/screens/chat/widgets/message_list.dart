
import 'package:app/screens/chat/widgets/message_box.dart';
import 'package:app/viewmodels/message_list_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class MessageList extends StatefulWidget {

  MessageList();

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
    var vm = Provider.of<MessageListViewModel>(context);
    var messages = vm.messages;
    // scroll to bottom once list view is built
    WidgetsBinding.instance?.addPostFrameCallback((_) => _scrollToBottom());
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
      Expanded(child: ListView.builder(
      itemCount: messages.length,
      scrollDirection: Axis.vertical,
      controller: _scrollController,
      shrinkWrap: true,
      itemBuilder: (context,index) {
        return messages[index];
      },
    )),
      MessageBox((message) => {
        setState(() {
          vm.addMessage(message);
        })
      }, _scrollToBottom)
    ]);
  }
}
