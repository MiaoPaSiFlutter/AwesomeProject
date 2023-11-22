import 'package:chat/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../colors.dart';
import '../../../states_management/home/chats_cubit.dart';
import '../../../states_management/home/home_cubit.dart';
import '../../../states_management/home/home_state.dart';
import '../../../states_management/message/message_bloc.dart';
import '../../../states_management/message_group/message_group_bloc.dart';
import '../../../ui/pages/home/home_router.dart';
import '../../../ui/widgets/home/active/active_users.dart';
import '../../../ui/widgets/home/chats/chats.dart';
import '../../../ui/widgets/shared/header_status.dart';
import '../../../viewmodels/chats_view_model.dart';

class Home extends StatefulWidget {
  final User me;
  final IHomeRouter router;
  final ChatsViewModel viewModel;
  const Home(this.viewModel, this.router, this.me);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  late User _user;
  List<User> _activeUsers = [];
  @override
  void initState() {
    super.initState();
    _user = widget.me;
    _initialSetup();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title:
              HeaderStatus(_user.userName ?? '未知用户', _user.getAvalUrl(), true),
          bottom: TabBar(
            indicatorPadding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            tabs: [
              Tab(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text('Messages'),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child:
                        BlocBuilder<HomeCubit, HomeState>(builder: (_, state) {
                      if (state is HomeSuccess) {
                        _activeUsers = state.onlineUsers;
                        return Text("Active(${state.onlineUsers.length})");
                      }

                      return const Text("Active(0)");
                    }),
                  ),
                ),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Chats(_user, widget.router),
            ActiveUsers(widget.router, _user),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: kPrimary,
          child: const Icon(
            Icons.group_add_rounded,
            color: Colors.white,
          ),
          onPressed: () async {
            await widget.router.onShowCreateGroup(context, _activeUsers, _user);
          },
        ),
      ),
    );
  }

  _initialSetup() async {
    final user =
        (!(_user.active)) ? await context.read<HomeCubit>().connect() : _user;
    if (context.mounted) {
      context.read<ChatsCubit>().chats();
      context.read<HomeCubit>().activeUsers(user);
      context.read<MessageBloc>().add(MessageEvent.onSubscribed(user));
      context
          .read<MessageGroupBloc>()
          .add(MessageGroupEvent.onSubscribed(user));
    } else {}
  }

  @override
  bool get wantKeepAlive => true;
}
