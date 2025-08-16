import 'package:flutter/material.dart';
import 'package:movies_starter/main.dart';
import 'package:movies_starter/widgets/movie_card.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favourites")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: appBrain.favouriteMovies.value.length,
              itemBuilder: (context, index) {
                return ValueListenableBuilder(
                  valueListenable: appBrain.favouriteMovies,
                  builder: (context, value, child) {
                    return MovieCard(model: value[index], isFavourite: true);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
