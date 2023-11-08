import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:flutter_paytabs_tickets_app/flutter_paytabs_tickets_app.dart';

class EventsService {
  Future<List<Event>> getEvents() async {
    try {
      Response response = await DioHelper.getData(url: epGetEvents, query: {});

      if (response.statusCode == 200) {
        EventsResponse eventsResponse = EventsResponse.fromJson(response.data);
        return eventsResponse.events;
      }
    } catch (exception) {}
    return <Event>[];
  }

  Future<List<UpcomingEvents>> getUpcomingEvents() async {
    try {
      Response response =
          await DioHelper.getData(url: epGetUpcomingEvents, query: {});

      if (response.statusCode == 200) {
        UpcomingEventsResponse eventsResponse =
            UpcomingEventsResponse.fromJson(json.decode(response.data));
        return eventsResponse.upcomingevents;
      }
    } catch (exception) {}
    return <UpcomingEvents>[];
  }
}
