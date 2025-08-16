import 'package:flutter/cupertino.dart';
import 'package:movies_starter/models/movie_model.dart';

class AppBrain {
  ValueNotifier<List<MovieModel>> movies = ValueNotifier([]);
  ValueNotifier<bool> isDark = ValueNotifier(true);
  ValueNotifier<List<MovieModel>> favouriteMovies = ValueNotifier([]);

 void addToFavourite(MovieModel movie) {

    favouriteMovies.value.add(movie);
     favouriteMovies.value = [...favouriteMovies.value, movie]; //spread opearators
  }

  void removeFromFavourite(MovieModel movie) {
      favouriteMovies.value.remove(movie);



    }
  }



