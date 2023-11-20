import '../helper/helper_index.dart';

class FriendsModel {
  final String name;
  final String avatar;

  FriendsModel({
    required this.name,
    required this.avatar,
  });
}

List<FriendsModel> friendsData = [
  FriendsModel(
    name: "Rahul",
    avatar: Utils.assets("images/user/u1.jpg"),
  ),
  FriendsModel(
    name: "Shruti",
    avatar: Utils.assets("images/user/u2.jpg"),
  ),
  FriendsModel(
    name: "Ranjan",
    avatar: Utils.assets("images/user/u3.jpg"),
  ),
  FriendsModel(
    name: "Kethy",
    avatar: Utils.assets("images/user/u4.jpg"),
  ),
  FriendsModel(
    name: "Emma",
    avatar: Utils.assets("images/user/u5.jpg"),
  ),
  FriendsModel(
    name: "Vikash",
    avatar: Utils.assets("images/user/u6.jpg"),
  ),
  FriendsModel(
    name: "Suhani",
    avatar: Utils.assets("images/user/u7.jpg"),
  ),
  FriendsModel(
    name: "Kunal",
    avatar: Utils.assets("images/user/u8.jpg"),
  ),
  FriendsModel(
    name: "Khushi",
    avatar: Utils.assets("images/user/u9.jpg"),
  ),
  FriendsModel(
    name: "Sameer",
    avatar: Utils.assets("images/user/u10.jpg"),
  ),
];
