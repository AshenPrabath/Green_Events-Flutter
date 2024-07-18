import 'package:green_events_2/models/event_model.dart';
import 'package:green_events_2/models/favorites_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'user_service.dart';

class FavoritesService {
  static Future<void> addFavorite(
    String EventID,
  ) async {
    try {
      final userID = UserService.getUserId();
      final doc = FirebaseFirestore.instance.collection('favorites').doc();
      await doc.set({
        'id': doc.id,
        'userID': userID,
        'eventID': EventID,
      });
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<Favorites> getFavorites() async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      final favorites = await firestore.collection('favorites').doc().get();
      return Favorites.fromMap(favorites.data() as Map<String, dynamic>);
    } catch (e) {
      throw e.toString();
    }
  }

  // static Stream<List<Favorites>> listenFavoritesByUser() async* {
  //   final userId = UserService.getUserId();
  //   final favoritesCollection = FirebaseFirestore.instance
  //       .collection('favorites')
  //       .where("userID", isEqualTo: userId);

  //   try {
  //     yield* favoritesCollection.snapshots().map((snapshot) {
  //       return snapshot.docs.map((e) => Favorites.fromMap(e.data())).toList();
  //     });
  //   } catch (e) {
  //     throw e.toString();
  //   }
  // }

  static Stream<List<Favorites>> listenGetAllFavoriteEvents() async* {
    final userId = UserService.getUserId();
    final eventsCollection = FirebaseFirestore.instance
        .collection('favorites')
        .where("userID", isEqualTo: userId);

    try {
      yield* eventsCollection.snapshots().map((snapshot) {
        return snapshot.docs.map((e) => Favorites.fromMap(e.data())).toList();
      });
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<List<Favorites>> getFavoritesByUser() async {
    try {
      final userId = UserService.getUserId();

      final userSnapshot = await FirebaseFirestore.instance
          .collection('favorites')
          .where("userID", isEqualTo: userId)
          .get();

      return userSnapshot.docs.map((e) => Favorites.fromMap(e.data())).toList();
    } catch (e) {
      print(e);
      throw AuthFailure(message: e.toString());
    }
  }

  static Future<Favorites> getFavoritesByID(id) async {
    try {
      final DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('favorites')
          .doc(id)
          .get();

      if (userSnapshot.exists) {
        final Map<String, dynamic> favoritesData =
            userSnapshot.data() as Map<String, dynamic>;

        final Favorites favorites = Favorites.fromMap(favoritesData);

        return favorites;
      } else {
        throw AuthFailure(message: 'User not found');
      }
    } catch (e) {
      throw AuthFailure(message: e.toString());
    }
  }

  static Future<Event> getEventsByUser(id) async {
    try {
      final DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('favorites')
          .doc(id)
          .get();

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
