import 'package:app/screens/chat/widgets/message.dart';
import 'package:app/test/test_data.dart';
import 'package:flutter/cupertino.dart';

class MessageListViewModel with ChangeNotifier{

  List<Message> messages = TestData.getMessages();

  void addMessage(Message message){
    messages.add(message);
    notifyListeners();
  }
}