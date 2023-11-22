import 'package:chat/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../models/chat.dart';
import '../../../../states_management/home/home_cubit.dart';
import '../../../../states_management/home/home_state.dart';
import '../../../../ui/pages/home/home_router.dart';
import '../../../../ui/widgets/home/profile_image.dart';

class ActiveUsers extends StatefulWidget {
  final User me;
  final IHomeRouter router;
  const ActiveUsers(this.router, this.me, {super.key});

  @override
  _ActiveUsersState createState() => _ActiveUsersState();
}

class _ActiveUsersState extends State<ActiveUsers> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (_, state) {
      if (state is HomeLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is HomeSuccess) return _buildList(state.onlineUsers);
      return Container();
    });
  }

  _listItem(User user) => ListTile(
        leading: ProfileImage(
          imageUrl: user.photoUrl,
          online: true,
        ),
        title: Text(
          user.userName ?? '未知用户',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
        ),
      );

  _buildList(List<User> users) => ListView.separated(
      padding: const EdgeInsets.only(top: 30, right: 16),
      itemBuilder: (BuildContext context, indx) => GestureDetector(
            child: _listItem(users[indx]),
            onTap: () {
              widget.router.onShowMessageThread(context, [users[indx]],
                  widget.me, Chat(users[indx].id, ChatType.individual));
            },
          ),
      separatorBuilder: (_, __) => const Divider(),
      itemCount: users.length);
}
