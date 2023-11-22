import 'package:chat/chat.dart';
import '../data/datasources/datasource_contract.dart';
import '../models/chat.dart';
import '../models/local_message.dart';
import '../viewmodels/base_view_model.dart';

class ChatsViewModel extends BaseViewModel {
  IDatasource _datasource;
  IUserService _userService;

  ChatsViewModel(this._datasource, this._userService) : super(_datasource);

  Future<List<Chat>> getChats() async {
    final chats = await _datasource.findAllChats();
    await Future.forEach(chats, (Chat chat) async {
      final ids = chat.membersId?.map<String>((e) => e.keys.first).toList();
      if (ids != null) {
        final users = await _userService.fetch(ids);
        chat.members = users;
      } else {
        chat.members = [];
      }
    });

    return chats;
  }

  Future<void> receivedMessage(Message message) async {
    final chatId = message.groupId ?? message.from;
    LocalMessage localMessage = LocalMessage(
        chatId: chatId, message: message, receipt: ReceiptStatus.deliverred);
    await addMessage(localMessage);
  }
}
