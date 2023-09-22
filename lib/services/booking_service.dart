import 'package:application8/models/booking_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'user_service.dart';

class BookingService{

  static Future<void> addBooking(
    String ticketID,
    int quantity,
  ) async {
    try {
      final userId = UserService.getUserId();
      final doc = FirebaseFirestore.instance.collection('booking').doc();
      await doc.set({
        'id': doc.id,
        'userID': userId ,
        'ticketID': ticketID,
        'quantity': quantity,
      });
    } catch (e) {
      throw e.toString();
    }
  }
  static Future<Booking> getBooking() async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      final booking = await firestore.collection('booking').doc().get();
      return Booking.fromMap(booking.data() as Map<String, dynamic>);
    } catch (e) {
      throw e.toString();
    }
  }
  static Stream<List<Booking>> getAllTickets() async* {
    final bookingCollection = FirebaseFirestore.instance.collection('ticket');

    try {
 yield* bookingCollection.snapshots().map((snapshot) {

       return  snapshot.docs.map((e) => Booking.fromMap(e.data())).toList();
      });
  
    } catch (e) {
      throw e.toString();
    }
  }

  static Stream<List<Booking>> getBookingsByUserID({required String userID}) async* {
    final bookingsCollection = FirebaseFirestore.instance.collection('booking').where("userID",isEqualTo: userID);

    try {
 yield* bookingsCollection.snapshots().map((snapshot) {

       return  snapshot.docs.map((e) => Booking.fromMap(e.data())).toList();
      });
  
    } catch (e) {
      throw e.toString();
    }
  }
  static Future<Booking> getBookingByID(id) async {
    try {
      final DocumentSnapshot userSnapshot =
          await FirebaseFirestore.instance.collection('booking').doc(id).get();

      if (userSnapshot.exists) {
        final Map<String, dynamic> bookingData =
            userSnapshot.data() as Map<String, dynamic>;

        final Booking booking = Booking.fromMap(bookingData);

        return booking;
      } else {
        throw AuthFailure(message: 'User not found');
      }
    } catch (e) {
      throw AuthFailure(message: e.toString());
    }
  }
  static Future<List<Booking>> getAllbookingByUserID(String id) async {
    final bookkingsCollection = FirebaseFirestore.instance.collection('ticket');

    try {
      final querySnapshot = await bookkingsCollection.where("UserID", isEqualTo: id).get();
      final List<Booking> bookings =
          querySnapshot.docs.map((doc) => Booking.fromMap(doc.data())).toList();
      return bookings;
    } catch (e) {
      throw e.toString();
    }
  }


}