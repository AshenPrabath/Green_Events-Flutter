import 'package:flutter/material.dart';

import 'package:green_events_2/models/favorites_model.dart';

class Favoritecard extends StatefulWidget {
  Favorites favorites;
  Favoritecard({
    super.key,
    required this.favorites,
  });

  @override
  State<Favoritecard> createState() => _FavoritecardState();
}

class _FavoritecardState extends State<Favoritecard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Text(widget.favorites.eventID)],
      ),
    );
  }
}
