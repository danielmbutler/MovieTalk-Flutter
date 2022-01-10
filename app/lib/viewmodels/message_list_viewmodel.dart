
import 'package:amplify_flutter/amplify.dart';
import 'package:app/models/Message.dart';
import 'package:app/utils/view_utils.dart';
import 'package:flutter/cupertino.dart';

class MessageListViewModel with ChangeNotifier{
  
  List<Message> messages = List.generate(1, (index) => Message(), growable: true);

 Future<List<Message>?> getMessages() async {
    try {
      return await Amplify.DataStore.query(Message.classType);
   } on Exception catch (e) {
     return null;
   }
 }



  Future<void> addMessage(String message, String fromId, String movieId) async {
    Message messageToSave = Message(message: message, fromId: fromId, movieId: movieId, timestamp: ViewUtils.getCurrentTime());
    await Amplify.DataStore.save(messageToSave);
    notifyListeners();
  }
}