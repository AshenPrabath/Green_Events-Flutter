import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/event_model.dart';
import '../source/fake_events.dart';

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

  static Future<void> addEvent(
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

  static Future<Event> getEvent() async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      final event = await firestore.collection('event').doc().get();
      return Event.fromMap(event.data() as Map<String, dynamic>);
    } catch (e) {
      throw e.toString();
    }
  }
}