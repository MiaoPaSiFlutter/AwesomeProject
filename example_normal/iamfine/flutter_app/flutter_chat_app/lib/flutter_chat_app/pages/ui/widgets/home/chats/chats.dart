import 'package:chat/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hzy_common_module/hzy_common_module.dart';
import 'package:intl/intl.dart';
import '../../../../colors.dart';
import '../../../../models/chat.dart';
import '../../../../states_management/home/chats_cubit.dart';
import '../../../../states_management/message/message_bloc.dart';
import '../../../../states_management/message_group/message_group_bloc.dart';
import '../../../../states_management/typing/typing_notification_bloc.dart';
import '../../../../theme.dart';
import '../../../../ui/pages/home/home_router.dart';
import '../../../../ui/widgets/home/profile_image.dart';
import '../../../../utils/color_generator.dart';

class Chats extends StatefulWidget {
  final User user;
  final IHomeRouter router;
  const Chats(this.user, this.router, {super.key});

  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  var chats = [];
  final typingEvents = [];
  @override
  void initState() {
    super.initState();
    _updateChatsOnMessageReceived();
    context.read<ChatsCubit>().chats();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatsCubit, List<Chat>>(builder: (__, chats) {
      this.chats = chats;
      if (this.chats.isEmpty) return Container();
      List<String> userIds = [];
      for (var chat in chats) {
        userIds += chat.members!.map((e) => e.id).toList();
      }
      context.read<TypingNotificationBloc>().add(
          TypingNotificationEvent.onSubscribed(widget.user,
              usersWithChat: userIds.toSet().toList()));
      return _buildListView();
    });
  }

  _buildListView() {
    return ListView.separated(
        padding: const EdgeInsets.only(top: 30.0, right: 16.0),
        itemBuilder: (_, indx) => GestureDetector(
              child: _chatItem(chats[indx]),
              onTap: () async {
                await widget.router.onShowMessageThread(
                    context, chats[indx].members, widget.user, chats[indx]);

                if (context.mounted) {
                  await context.read<ChatsCubit>().chats();
                }
              },
            ),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: chats.length);
  }

  _chatItem(Chat chat) => ListTile(
        contentPadding: const EdgeInsets.only(left: 16.0),
        leading: ProfileImage(
          imageUrl: chat.type == ChatType.individual
              ? (chat.members != null && chat.members!.isNotEmpty)
                  ? chat.members!.first.photoUrl
                  : null
              : null,
          online: chat.type == ChatType.individual
              ? (chat.members != null && chat.members!.isNotEmpty)
                  ? chat.members!.first.active
                  : false
              : false,
        ),
        title: Text(
          chat.type == ChatType.individual
              ? (chat.members != null && chat.members!.isNotEmpty)
                  ? '${chat.members!.first.userName}'
                  : '${chat.name}'
              : '${chat.name}',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: isLightTheme(context) ? Colors.black : Colors.white,
              ),
        ),
        subtitle: BlocBuilder<TypingNotificationBloc, TypingNotificationState>(
            builder: (__, state) {
          if (state is TypingNotificationReceivedSuccess &&
              state.event.event == Typing.start &&
              state.event.chatId == chat.id) {
            typingEvents.add(state.event.chatId);
          }

          if (state is TypingNotificationReceivedSuccess &&
              state.event.event == Typing.stop &&
              state.event.chatId == chat.id) {
            typingEvents.remove(state.event.chatId);
          }

          if (typingEvents.contains(chat.id)) {
            switch (chat.type) {
              case ChatType.group:
                final st = state as TypingNotificationReceivedSuccess;
                final username = chat.members
                    ?.firstWhere((e) => e.id == st.event.from)
                    .userName;

                return Text(
                  '$username is typung...',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontStyle: FontStyle.italic),
                );
              default:
                return Text(
                  'typung...',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontStyle: FontStyle.italic),
                );
            }
          }

          String msgContent = '';
          if (chat.mostRecent != null) {
            if (chat.type == ChatType.individual) {
              msgContent = chat.mostRecent!.message.contents;
            } else {
              dPrint('chat: ${chat.toMap()}');
              String? from;
              for (var member in (chat.members ?? [])) {
                if (member.id == chat.mostRecent?.message.from) {
                  from = chat.mostRecent?.message.from;
                } else {
                  from = 'You';
                }
              }

              msgContent = '$from: ${chat.mostRecent!.message.contents}';
            }
          } else {
            msgContent = 'Group created';
          }

          return Text(
            msgContent,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: isLightTheme(context) ? Colors.black54 : Colors.white70,
                fontWeight: (chat.unread ?? 0) > 0
                    ? FontWeight.bold
                    : FontWeight.normal),
          );
        }),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (chat.mostRecent != null)
              Text(
                DateFormat('h:mm a').format(chat.mostRecent!.message.timestamp),
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: isLightTheme(context)
                        ? Colors.black54
                        : Colors.white70),
              ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: (chat.unread ?? 0) > 0
                    ? Container(
                        height: 15.0,
                        width: 15.0,
                        color: kPrimary,
                        alignment: Alignment.center,
                        child: Text(
                          chat.unread.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(color: Colors.white),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            )
          ],
        ),
      );

  _updateChatsOnMessageReceived() {
    final chatsCubit = context.read<ChatsCubit>();
    context.read<MessageBloc>().stream.listen((state) async {
      if (state is MessageReceivedSuccess) {
        await chatsCubit.viewModel.receivedMessage(state.message);
        chatsCubit.chats();
      }
    });

    context.read<MessageGroupBloc>().stream.listen((state) async {
      if (state is MessageGroupReceived) {
        final group = state.group;
        if (group.id == null) {
          return;
        }
        group.members.removeWhere((e) => e == widget.user.id);
        final membersId = group.members
            .map((e) => {e: RandomeColorGenerator.getColor().value.toString()})
            .toList();

        final chat = Chat(group.id!, ChatType.group,
            name: group.name, membersId: membersId);
        await chatsCubit.viewModel.createNewChat(chat);
        chatsCubit.chats();
      }
    });
  }
}
