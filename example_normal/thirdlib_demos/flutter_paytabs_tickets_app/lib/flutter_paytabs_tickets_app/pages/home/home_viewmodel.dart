// ignore_for_file: unused_result

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_paytabs_tickets_app/flutter_paytabs_tickets_app.dart';

import 'home_mock.dart';

class HomeViewModel {
  EventsService eventsRepository = EventsService();
  List<Event> events = [];
  List<UpcomingEvents> upcomingEvents = [];

  init(WidgetRef ref) {
    getEvents(ref);
    getUpcomingEvents(ref);
    ref.refresh(showMoreUpcomingEventsProvider);
    ref.refresh(forYouProvider);
    ref.refresh(eventsLoadedProvider);
    ref.refresh(timeoutProvider);
    ref.refresh(timeoutProviderHelper);
  }

  getEvents(WidgetRef ref) => eventsRepository.getEvents().then((value) {
        // 这里使用Mock数据
        if (value.isEmpty) {
          value = collections;
        }
        events.addAll(value);
        ref.read(sharedEventsProvider.notifier).state = events;
        ref.read(forYouProvider.notifier).state = true;
      });

  getUpcomingEvents(WidgetRef ref) =>
      eventsRepository.getUpcomingEvents().then((value) {
        // 这里使用Mock数据
        if (value.isEmpty) {
          value = upcomingEvents;
        }
        upcomingEvents.addAll(value);
        ref.read(showMoreUpcomingEventsProvider.notifier).state =
            upcomingEvents.map((e) => false).toList();
      });
}
