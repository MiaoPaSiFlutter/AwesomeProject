import 'package:flutter/material.dart';
import 'package:flutter_books/flutter_books.dart';

import 'about_panda_page.dart';

class MePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MePageState();
}

class MePageState extends State<MePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _headView(),
              Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 120,
                    color: BooksColors.meBgColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                        BooksDimens.leftMargin, 0, BooksDimens.rightMargin, 0),
                    child: Image.asset(
                      Utils.getImag("images/icon_me_vip_bg.png"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                        30, BooksDimens.leftMargin, 30, BooksDimens.leftMargin),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          Utils.getImag("images/icon_me_vip.png"),
                          width: 18,
                          height: 18,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          "开通会员",
                          style: TextStyle(
                              color: BooksColors.meTextColor, fontSize: 14),
                        ),
                        Expanded(child: Container()),
                        const Text(
                          "万本好书免费读",
                          style: TextStyle(
                              color: BooksColors.meTextColor, fontSize: 14),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Image.asset(
                          Utils.getImag("images/icon_me_vip_right_arrow.png"),
                          width: 16,
                          height: 16,
                          color: BooksColors.meTextColor,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                    color: BooksColors.white,
                    child: Column(
                      children: <Widget>[
                        _childView(
                          Utils.getImag("images/icon_me_account.png"),
                          "我的账户",
                          "购买、充值记录",
                          true,
                        ),
                        _childView(
                          Utils.getImag("images/icon_me_task.png"),
                          "我的任务",
                          "绑定手机送礼券",
                          false,
                        ),
                        _childView(
                          Utils.getImag("images/icon_me_game.png"),
                          "我的游戏",
                          "",
                          true,
                        ),
                        Container(
                          height: 12,
                          color: BooksColors.dividerColor,
                        ),
                        _childView(
                          Utils.getImag("images/icon_me_gift.png"),
                          "兑换中心",
                          "",
                          true,
                        ),
                        _childView(
                          Utils.getImag("images/icon_me_message.png"),
                          "我的消息",
                          "88",
                          false,
                        ),
                        _childView(
                          Utils.getImag("images/icon_me_comment.png"),
                          "我的评论",
                          "购买、充值记录",
                          true,
                        ),
                        Container(
                          height: 12,
                          color: BooksColors.dividerColor,
                        ),
                        _childView(
                          Utils.getImag("images/icon_me_cloud.png"),
                          "云书架",
                          "同步书籍至云端",
                          true,
                        ),
                        _childView(
                          Utils.getImag("images/icon_me_download.png"),
                          "我的下载",
                          "",
                          true,
                        ),
                        _childView(
                          Utils.getImag("images/icon_me_read_record.png"),
                          "最近阅读记录",
                          "",
                          true,
                        ),
                        Container(
                          height: 12,
                          color: BooksColors.dividerColor,
                        ),
                        _childView(
                          Utils.getImag("images/icon_me_help.png"),
                          "帮助与反馈",
                          "",
                          true,
                        ),
                        _childView(
                          Utils.getImag("images/icon_me_panda.png"),
                          "关于Panda看书",
                          "",
                          true,
                        ),
                        Container(
                          height: 50,
                          color: BooksColors.dividerColor,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headView() {
    return Container(
      color: BooksColors.meBgColor,
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(BooksDimens.leftMargin,
                        20, BooksDimens.rightMargin, 20),
                    child: ClipOval(
                      child: SizedBox(
                        width: 56,
                        height: 56,
                        child: Image.asset(
                            Utils.getImag("images/icon_default_avatar.png")),
                      ),
                    ),
                  ),
                  const Text(
                    "书友q805699513",
                    style: TextStyle(
                      fontSize: BooksDimens.titleTextSize,
                      color: BooksColors.white,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(),
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                      BooksDimens.leftMargin, 7, BooksDimens.rightMargin, 0),
                  child: Image.asset(
                    Utils.getImag('images/icon_me_setting.png'),
                    width: 23,
                    height: BooksDimens.titleHeight,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const SizedBox(
                width: 10,
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "0",
                    style: TextStyle(
                      fontSize: BooksDimens.titleTextSize,
                      color: BooksColors.white,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "熊猫币",
                    style: TextStyle(
                      fontSize: BooksDimens.textSizeL,
                      color: BooksColors.white,
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                color: const Color(0x50FFFFFF),
                width: 1,
                height: 23,
                child: const Text(""),
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "0",
                    style: TextStyle(
                      fontSize: BooksDimens.titleTextSize,
                      color: BooksColors.white,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "礼券",
                    style: TextStyle(
                      fontSize: BooksDimens.textSizeL,
                      color: BooksColors.white,
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                color: const Color(0x50FFFFFF),
                width: 1,
                height: 23,
                child: const Text(""),
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "签到",
                    style: TextStyle(
                      fontSize: BooksDimens.titleTextSize,
                      color: BooksColors.white,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "送礼券",
                    style: TextStyle(
                      fontSize: BooksDimens.textSizeL,
                      color: BooksColors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  Widget _childView(String image, String content, String message, bool isGray) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (c) {
            return AboutPandaPage();
          }));
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
              BooksDimens.leftMargin,
              BooksDimens.leftMargin,
              BooksDimens.rightMargin,
              BooksDimens.rightMargin),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                image,
                width: 23,
                height: 23,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                content,
                style: const TextStyle(
                  color: BooksColors.textBlack3,
                  fontSize: BooksDimens.textSizeM,
                ),
              ),
              Expanded(child: Container()),
              Text(
                message,
                style: TextStyle(
                  color: isGray
                      ? BooksColors.textBlack9
                      : BooksColors.meRedTextColor,
                  fontSize: 13,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Image.asset(
                Utils.getImag("images/icon_me_arrow.png"),
                width: 14,
                height: 14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
