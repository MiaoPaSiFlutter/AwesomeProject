import 'package:flutter/foundation.dart';

class NotificationSchedulingProvider extends ChangeNotifier {
  bool _isNotifSchedule = false;

  bool get isNotifSchedule => _isNotifSchedule;

  void notifScheduleNews(bool val) async {
    _isNotifSchedule = val;
    notifyListeners();
  }
}
