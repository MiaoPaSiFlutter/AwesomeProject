import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat/chat.dart';
import 'package:equatable/equatable.dart';

part 'typing_notification_event.dart';
part 'typing_notification_state.dart';

class TypingNotificationBloc
    extends Bloc<TypingNotificationEvent, TypingNotificationState> {
  final ITypingNotification _typingNotification;
  StreamSubscription? _subscription;

  TypingNotificationBloc(this._typingNotification)
      : super(TypingNotificationState.initial()) {
    on<Subscribed>(
      (event, emit) async {
        if (event.usersWithChat == null) {
          add(NotSubscribed());
          return;
        }
        await _subscription?.cancel();
        _subscription = _typingNotification
            .subscribe(event.user, event.usersWithChat)
            .listen(
                (typingEvent) => add(_TypingNotificationReceived(typingEvent)));
      },
    );
    on<_TypingNotificationReceived>(
      (event, emit) async {
        emit(TypingNotificationState.received(event.event));
      },
    );
    on<TypingNotificationSent>(
      (event, emit) async {
        await _typingNotification.send(events: event.events);
        emit(TypingNotificationState.sent());
      },
    );
    on<NotSubscribed>(
      (event, emit) async {
        emit(TypingNotificationState.initial());
      },
    );
  }

  // @override
  // Stream<TypingNotificationState> mapEventToState(
  //     TypingNotificationEvent typingEvent) async* {
  //   if (typingEvent is Subscribed) {
  //     if (typingEvent.usersWithChat == null) {
  //       add(NotSubscribed());
  //       return;
  //     }
  //     await _subscription.cancel();
  //     _subscription = _typingNotification
  //         .subscribe(typingEvent.user, typingEvent.usersWithChat)
  //         .listen(
  //             (typingEvent) => add(_TypingNotificationReceived(typingEvent)));
  //   }

  //   if (typingEvent is _TypingNotificationReceived) {
  //     yield TypingNotificationState.received(typingEvent.event);
  //   }
  //   if (typingEvent is TypingNotificationSent) {
  //     await _typingNotification.send(events: typingEvent.events);
  //     yield TypingNotificationState.sent();
  //   }

  //   if (typingEvent is NotSubscribed) {
  //     yield TypingNotificationState.initial();
  //   }
  // }

  @override
  Future<void> close() {
    _subscription?.cancel();
    _typingNotification.dispose();
    return super.close();
  }
}
