import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
    int timeStamp,
    String venue,
    String desc,
    bool isFree,
    String link,
    String imageUrl,
  ) async {
    try {
      final doc = FirebaseFirestore.instance.collection('event').doc();
      final storageRef = FirebaseStorage.instance.ref().child('event_media/$doc.id');
      final uploadTask = storageRef.putFile(File(imageUrl));
      await uploadTask.whenComplete(() async {
        final imageUrl = await storageRef.getDownloadURL();
        // Store the image URL in the Firestore document
        await doc.set({
          'id': doc.id,
          'userId': userId,
          'title': title,
          'image': doc.id, // Use the document ID as the image identifier
          'time': timeStamp,
          'venue': venue,
          'desc': desc,
          'isFree': isFree,
          'link': link,
          'imageUrl': imageUrl, // Store the image URL
          // Use server timestamp for createdAt
        });
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
      print(id);
      final DocumentSnapshot userSnapshot =
          await FirebaseFirestore.instance.collection('event').doc(id).get();

      final Map<String, dynamic> eventData =
            userSnapshot.data() as Map<String, dynamic>;

        final Event event = Event.fromMap(eventData);

        return event;
    } catch (e) {
      print(e);
      throw AuthFailure(message: e.toString());
    }
  }
}
