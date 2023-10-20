import 'package:flutter/material.dart';
import 'package:flutter_books/flutter_books.dart';

class LoadingView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView>
    with SingleTickerProviderStateMixin {
  final List<String> _imageList = [
    Utils.getImag('images/icon_load_1.png'),
    Utils.getImag('images/icon_load_2.png'),
    Utils.getImag('images/icon_load_3.png'),
    Utils.getImag('images/icon_load_4.png'),
    Utils.getImag('images/icon_load_5.png'),
    Utils.getImag('images/icon_load_6.png'),
    Utils.getImag('images/icon_load_7.png'),
    Utils.getImag('images/icon_load_8.png'),
    Utils.getImag('images/icon_load_9.png'),
    Utils.getImag('images/icon_load_10.png'),
    Utils.getImag('images/icon_load_11.png'),
  ];
  late Animation<int> _animation;
  late AnimationController _controller;
  int _position = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    _animation = IntTween(begin: 0, end: 10).animate(_controller)
      ..addListener(() {
        if (_position != _animation.value) {
          setState(() {
            _position = _animation.value;
          });
        }
      });

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        color: BooksColors.homeGrey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              _imageList[_position],
              width: 43,
              height: 43,
              gaplessPlayback: true,
            ),
          ],
        ));
  }

  dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class FailureView extends StatefulWidget {
  final OnLoadReloadListener _listener;

  FailureView(this._listener);

  @override
  State<StatefulWidget> createState() => _FailureViewState();
}

class _FailureViewState extends State<FailureView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: BooksColors.homeGrey,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            Utils.getImag("images/icon_network_error.png"),
            width: 150,
            height: 150,
          ),
          const SizedBox(
            height: 14,
          ),
          const Text(
            "咦？没网络啦~检查下设置吧",
            style: TextStyle(fontSize: 12, color: BooksColors.textBlack9),
          ),
          const SizedBox(
            height: 25,
          ),
          MaterialButton(
            onPressed: () {
              widget._listener.onReload();
            },
            minWidth: 150,
            height: 43,
            color: BooksColors.textPrimaryColor,
            child: const Text(
              "重新加载",
              style: TextStyle(
                color: BooksColors.white,
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}

mixin OnLoadReloadListener {
  void onReload();
}

enum LoadStatus {
  LOADING,
  SUCCESS,
  FAILURE,
}
