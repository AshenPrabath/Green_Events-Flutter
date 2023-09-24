import 'package:flutter/material.dart';

import 'package:application8/models/favorites_model.dart';

class Favoritecard extends StatefulWidget {
  Favorites favorites;
  Favoritecard({
    Key? key,
    required this.favorites,
  }) : super(key: key);

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
