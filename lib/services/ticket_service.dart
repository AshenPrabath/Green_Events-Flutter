import '../models/ticket_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'user_service.dart';

class TicketService {
  static Future<void> addTicket(
    String eventId,
    String ticketName,
    double ticketPrice,
    int ticketCount,
  ) async {
    try {
      final doc = FirebaseFirestore.instance.collection('ticket').doc();
      await doc.set({
        'id': doc.id,
        'eventId': eventId,
        'ticketName': ticketName,
        'ticketPrice': ticketPrice,
        'ticketCount': ticketCount,
      });
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<Ticket> getEvent() async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      final ticket = await firestore.collection('ticket').doc().get();
      return Ticket.fromMap(ticket.data() as Map<String, dynamic>);
    } catch (e) {
      throw e.toString();
    }
  }

  static Stream<List<Ticket>> getAllTickets() async* {
    final ticketsCollection = FirebaseFirestore.instance.collection('ticket');

    try {
 yield* ticketsCollection.snapshots().map((snapshot) {

       return  snapshot.docs.map((e) => Ticket.fromMap(e.data())).toList();
      });
  
    } catch (e) {
      throw e.toString();
    }
  }

  static Stream<List<Ticket>> getTicketsByEventId({required String eventId}) async* {
    final ticketsCollection = FirebaseFirestore.instance.collection('ticket').where("eventId",isEqualTo: eventId);

    try {
 yield* ticketsCollection.snapshots().map((snapshot) {

       return  snapshot.docs.map((e) => Ticket.fromMap(e.data())).toList();
      });
  
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<Ticket> getTicketById(id) async {
    try {
      final DocumentSnapshot userSnapshot =
          await FirebaseFirestore.instance.collection('ticket').doc(id).get();

      if (userSnapshot.exists) {
        final Map<String, dynamic> ticketData =
            userSnapshot.data() as Map<String, dynamic>;

        final Ticket ticket = Ticket.fromMap(ticketData);

        return ticket;
      } else {
        throw AuthFailure(message: 'User not found');
      }
    } catch (e) {
      throw AuthFailure(message: e.toString());
    }
  }

  static Future<List<Ticket>> getAllTicketsByEventID(String id) async {
    final ticketsCollection = FirebaseFirestore.instance.collection('ticket');

    try {
      final querySnapshot = await ticketsCollection.where("eventId", isEqualTo: id).get();
      final List<Ticket> tickets =
          querySnapshot.docs.map((doc) => Ticket.fromMap(doc.data())).toList();
      return tickets;
    } catch (e) {
      throw e.toString();
    }
  }
}
