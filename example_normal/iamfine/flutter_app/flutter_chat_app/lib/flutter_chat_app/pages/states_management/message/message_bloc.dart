import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat/chat.dart';
import 'package:equatable/equatable.dart';
import 'package:hzy_common_module/hzy_common_module.dart';

part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final IMessageService _messageService;
  StreamSubscription? _subscription;

  MessageBloc(this._messageService) : super(MessageState.initial()) {
    on<Subscribed>(
      (event, emit) async {
        dPrint('MessageBloc - on<Subscribed>');
        await _subscription?.cancel();
        _subscription = _messageService
            .messages(activeUser: event.user)
            .listen((message) => add(_MessageReceived(message)));
      },
    );
    on<_MessageReceived>(
      (event, emit) async {
        dPrint('MessageBloc - on<_MessageReceived>');
        emit(MessageState.received(event.message));
      },
    );
    on<MessageSent>(
      (event, emit) async {
        dPrint('MessageBloc - on<MessageSent>');
        final message = await _messageService.send(event.messages);
        emit(MessageState.sent(message));
      },
    );
  }

  // @override
  // Stream<MessageState> mapEventToState(MessageEvent event) async* {
  //   if (event is Subscribed) {
  //     await _subscription?.cancel();
  //     _subscription = _messageService
  //         .messages(activeUser: event.user)
  //         .listen((message) => add(_MessageReceived(message)));
  //   }

  //   if (event is _MessageReceived) {
  //     yield MessageState.received(event.message);
  //   }
  //   if (event is MessageSent) {
  //     final message = await _messageService.send(event.messages);
  //     yield MessageState.sent(message);
  //   }
  // }

  @override
  Future<void> close() {
    _subscription?.cancel();
    _messageService.dispose();
    return super.close();
  }
}
