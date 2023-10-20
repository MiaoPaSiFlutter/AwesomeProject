import 'dart:async';

import 'package:hzy_common_module/hzy_common_module.dart';

typedef EventCallback<T> = void Function(T event);

class EventBusUtils {
  factory EventBusUtils() => _getInstance();
  static EventBusUtils get instance => _getInstance();
  static EventBusUtils? _instance;
  EventBus? _eventBus;

  // 初始化
  EventBusUtils._internal() {
    _eventBus = EventBus();
  }

  /// 订阅stream列表
  // List<StreamSubscription> subscriptionList;

  static EventBusUtils _getInstance() {
    _instance ??= EventBusUtils._internal();
    return _instance!;
  }

  /// 开启eventbus订阅
  StreamSubscription on<T extends AppEvent>(EventCallback<T> callback) {
    StreamSubscription stream = _eventBus!.on<T>().listen((event) {
      callback(event);
    });
    // subscriptionList.add(stream);
    return stream;
  }

  /// 发送消息
  void emit(event) {
    _eventBus!.fire(event);
  }

  /// 移除steam
  void off(StreamSubscription steam) {
    steam.cancel();
  }
}

var eventBus = EventBusUtils.instance;


/*


class MpsfHomePage extends StatefulWidget {
  const MpsfHomePage({Key? key}) : super(key: key);

  @override
  State createState() => _MpsfHomePageState();
}

class _MpsfHomePageState extends State<MpsfHomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  late StreamSubscription updateAppEvent;

  @override
  void initState() {
    super.initState();
    updateAppEvent = eventBus.on<UpdateAppEvent>((event) {
      JdToastUtil.show("APP可以更新了！！！");
      // updateAppDialog.show(context, event);
    });

    Future.delayed(const Duration(seconds: 3), () {
      eventBus.emit(UpdateAppEvent());
    });
  }

  @override
  void dispose() {
    eventBus.off(updateAppEvent);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.red),
        ),
        child: const JdShouYeScreen(),
      ),
    );
  }
}


*/
