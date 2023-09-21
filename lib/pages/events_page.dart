import 'package:flutter/material.dart';
import '../models/event_model.dart';
import '../services/event_service.dart';
import '../widgets/event_card.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        title: Text(
          "Events",
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        // child: EventCard(event: EventService.getEvent()),
        child: StreamBuilder(
          stream: EventService.listenGetAllEvents(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List<Event> events = snapshot.data!;

              return ListView.builder(
                  itemCount: events.length,
                  itemBuilder: (context, index) {
                    return EventCard(event: events[index]);
                  });
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
