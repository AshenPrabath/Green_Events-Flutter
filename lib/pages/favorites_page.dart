import 'package:green_events_2/models/event_model.dart';
import 'package:green_events_2/models/favorites_model.dart';
import 'package:green_events_2/services/favorites_service.dart';
import 'package:green_events_2/widgets/event_card.dart';
import 'package:flutter/material.dart';

import '../Services/event_service.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        title: Text(
          "Favorites",
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: StreamBuilder(
          stream: FavoritesService.listenGetAllFavoriteEvents(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List<Favorites> favorites = snapshot.data!;

              return ListView.builder(
                  itemCount: favorites.length,
                  itemBuilder: (context, index) {
                    if (snapshot.hasData) {
                      return FutureBuilder<Event>(
                          future: EventService.getEventById(
                              snapshot.data![index].eventID),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return EventCard(event: snapshot.data!);
                            }
                            return const Text("Loading...");
                          });
                    }
                    return null;
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
