import 'apiClient.dart';
import '../models/event.model.dart';

class EventRepository {
  final ApiClient apiClient;

  EventRepository(this.apiClient);

  Future<List<Event>> fetchAllEvents() async {
    final data = await apiClient.fetchData('event');
    final eventJsonList = data['content']['data'] as List<dynamic>;

    List<Event> events = [];

    for (var eventJson in eventJsonList) {
      events.add(Event.fromJson(eventJson));
    }

    return events;
  }

  Future<List<Event>> searchEvents(String query) async {
    final data = await apiClient.fetchData('event?search=$query');
    final eventJsonList = data['content']['data'] as List<dynamic>;

    List<Event> events = [];

    for (var eventJson in eventJsonList) {
      events.add(Event.fromJson(eventJson));
    }

    return events;
  }

  // Future<Event> fetchEventDetails(int eventId) async {
  //   final data = await apiClient.fetchData('event/$eventId');
  // }
}
