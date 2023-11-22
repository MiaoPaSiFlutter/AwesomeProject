import 'package:bloc/bloc.dart';
import '../../models/local_message.dart';
import '../../viewmodels/chat_view_model.dart';

class MessageThreadCubit extends Cubit<List<LocalMessage>> {
  final ChatViewModel viewModel;
  MessageThreadCubit(this.viewModel) : super([]);

  Future<void> messages(String chatId) async {
    final messages = await viewModel.getMessages(chatId);
    emit(messages);
  }
}
