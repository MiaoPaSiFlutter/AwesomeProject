import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constant/constant_index.dart';
import '../models/models_index.dart';
import '../tools/tools_index.dart';

class MessageDetailPage extends StatefulWidget {
  final Message data;

  const MessageDetailPage({
    super.key,
    required this.data,
  });

  @override
  _MessageDetailPageState createState() => _MessageDetailPageState();
}

class _MessageDetailPageState extends State<MessageDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            children: [
              Container(
                width: 32,
                height: 32,
                margin: const EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AppColor.border,
                  image: DecorationImage(
                    image: AssetImage('${widget.data.shopLogoUrl}'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text('${widget.data.shopName}',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600)),
            ],
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: SvgPicture.asset(Utils.assets('icons/Arrow-left.svg')),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(
              height: 1,
              width: MediaQuery.of(context).size.width,
              color: AppColor.primarySoft,
            ),
          ),
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        body: Column(
          children: [
            // Section 1 - Chat
            Expanded(
              child: Container(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  physics: const BouncingScrollPhysics(),
                  reverse: true,
                  children: const [
                    MyBubbleChatWidget(
                      chat:
                          'Lorem ipsum dolor ut labore et dolore magna aliqua. Ut enim ad minim veniam',
                      time: '10:48',
                    ),
                    SenderBubbleChatWidget(
                      chat:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, ad minim veniam',
                      time: '10:48',
                    ),
                    MyBubbleChatWidget(
                      chat:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam',
                      time: '10:48',
                    ),
                    SenderBubbleChatWidget(
                      chat:
                          'Log elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam',
                      time: '10:48',
                    ),
                    MyBubbleChatWidget(
                      chat:
                          'por incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam',
                      time: '10:48',
                    ),
                    SenderBubbleChatWidget(
                      chat:
                          'Lorem ipsum dpor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam',
                      time: '10:48',
                    ),
                  ],
                ),
              ),
            ),
            // Section 2 - Chat Bar
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: const BoxDecoration(
                border:
                    Border(top: BorderSide(color: AppColor.border, width: 1)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // TextField
                  Expanded(
                    child: TextField(
                      maxLines: null,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.camera_alt_outlined,
                            color: AppColor.primary,
                          ),
                        ),
                        hintText: 'Type a message here...',
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 14),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: AppColor.border, width: 1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: AppColor.border, width: 1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  // Send Button
                  Container(
                    margin: const EdgeInsets.only(left: 16),
                    width: 42,
                    height: 42,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.primary,
                        padding: const EdgeInsets.all(0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        shadowColor: Colors.transparent,
                      ),
                      child: const Icon(Icons.send_rounded,
                          color: Colors.white, size: 18),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).viewInsets.bottom,
              color: Colors.transparent,
            ),
          ],
        ));
  }
}

class MyBubbleChatWidget extends StatelessWidget {
  final String chat;
  final String time;

  const MyBubbleChatWidget({
    super.key,
    required this.chat,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '$time',
            style: TextStyle(color: AppColor.secondary.withOpacity(0.5)),
          ),
          Container(
            margin: const EdgeInsets.only(left: 16),
            width: MediaQuery.of(context).size.width * 65 / 100,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: const BoxDecoration(
              color: AppColor.primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                topLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: Text(
              '$chat',
              textAlign: TextAlign.right,
              style: const TextStyle(color: Colors.white, height: 150 / 100),
            ),
          ),
        ],
      ),
    );
  }
}

class SenderBubbleChatWidget extends StatelessWidget {
  final String chat;
  final String time;

  const SenderBubbleChatWidget({
    super.key,
    required this.chat,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            width: MediaQuery.of(context).size.width * 65 / 100,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: const BoxDecoration(
              color: AppColor.primarySoft,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: Text(
              '$chat',
              textAlign: TextAlign.left,
              style:
                  const TextStyle(color: AppColor.secondary, height: 150 / 100),
            ),
          ),
          Text(
            '$time',
            style: TextStyle(color: AppColor.secondary.withOpacity(0.5)),
          ),
        ],
      ),
    );
  }
}
