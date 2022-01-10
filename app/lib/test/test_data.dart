import 'package:app/models/movie.dart';
import 'package:app/screens/chat/widgets/message.dart';
import 'package:app/utils/view_utils.dart';

class TestData {

  static List<MessageWidget> getMessages(){
    List<MessageWidget> messages = List.empty(growable: true);

    for(var i = 0; i < 12; i++ ){
      messages.add(
          MessageWidget(
          username: "username" ,
          text: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, ',
          isCurrentUser: i.isEven ? true : false, time: ViewUtils.getCurrentTime()
      ));
    }

    return messages;

  }
}