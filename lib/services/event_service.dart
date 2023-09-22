import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/event_model.dart';
import '../services/user_service.dart';
import '../sources/fake_events.dart';

class EventService {
  static Future<List<Event>> getAll() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      final List<dynamic> res = json.decode(eventRes);
      final List<Event> events =
          res.map((e) => Event.fromMap(e as Map<String, dynamic>)).toList();
      return events;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<String> addEvent(
    String userId,
    String title,
    String image,
    int timeStamp,
    String venue,
    String desc,
    bool isFree,
    String? link,
  ) async {
    try {
      final doc = FirebaseFirestore.instance.collection('event').doc();
      await doc.set({
        'id': doc.id,
        'userId': userId,
        'title': title,
        'image': image,
        'time': timeStamp,
        'venue': venue,
        'desc': desc,
        'isFree': isFree,
        'link': link,
      });
      return doc.id;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<List<Event>> getAllEvents() async {
    final eventsCollection = FirebaseFirestore.instance.collection('event');

    try {
      final querySnapshot = await eventsCollection.get();
      final List<Event> events =
          querySnapshot.docs.map((doc) => Event.fromMap(doc.data())).toList();
      return events;
    } catch (e) {
      throw e.toString();
    }
  }

  static Stream<List<Event>> listenGetAllEvents() async* {
    final eventsCollection = FirebaseFirestore.instance.collection('event');

    try {
      yield* eventsCollection.snapshots().map((snapshot) {
        return snapshot.docs.map((e) => Event.fromMap(e.data())).toList();
      });
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<Event> getEventById(String id) async {
    try {
      final DocumentSnapshot userSnapshot =
          await FirebaseFirestore.instance.collection('event').doc(id).get();

      if (userSnapshot.exists) {
        final Map<String, dynamic> eventData =
            userSnapshot.data() as Map<String, dynamic>;

        final Event event = Event.fromMap(eventData);

        return event;
      } else {
        throw AuthFailure(message: 'User not found');
      }
    } catch (e) {
      throw AuthFailure(message: e.toString());
    }
  }
}
