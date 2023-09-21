import 'package:flutter/material.dart';
import '../widgets/ticket_minicard.dart';
import '../models/event_model.dart';

class BookingsPage extends StatelessWidget {
  final List<Event> events;
  const BookingsPage({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        title: Text(
          "Bookings",
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: ListView.builder(
          itemCount: events.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 13),
              child: TicketMiniCard(event: events[index]),
            );
          },
        ),
      ),
    );
  }
}