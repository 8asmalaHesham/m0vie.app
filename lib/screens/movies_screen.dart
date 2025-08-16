import 'package:flutter/material.dart';
import 'package:movies_starter/main.dart';
import 'package:movies_starter/screens/favourite_screen.dart';
// import 'package:movies_starter/services/api_service.dart';
import 'package:movies_starter/widgets/movie_card.dart';
import 'package:movies_starter/models/movie_model.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  MovieModel? selectedMovie;

  void loadMovies() async {
    // await ApiService.sendRequest();
    setState(() {});
  }

  @override
  void initState() {
    // loadMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Popular Movies"),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavouriteScreen()),
              );
            },
          ),

          IconButton(
            icon: Icon(
              appBrain.isDark.value ? Icons.dark_mode : Icons.light_mode,
            ),
            onPressed: () {
              appBrain.isDark.value = !appBrain.isDark.value;
            },
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: appBrain.movies,
        builder: (context, value, child) {
          return ListView.builder(
            // itemCount: appBrain.movies.value.length,
            itemCount: 1,
            itemBuilder: (context, index) {
              return MovieCard(
                // model: appBrain.movies.value[index],
                model: MovieModel.fromJson({
                  "adult": false,
                  "backdrop_path":
                      "https://image.tmdb.org/t/p/original/jSziioSwPVrOy9Yow3XhWIBDjq1.jpg",
                  "genre_ids": [878, 53],
                  "id": 755898,
                  "original_language": "en",
                  "original_title": "Fight Club",
                  "overview":
                      "A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground "
                      "fight clubs"
                      " forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion",
                  "popularity": 1604.146,
                  "poster_path": "/jSziioSwPVrOy9Yow3XhWIBDjq1.jpg",
                  "release_date": "2000-03-1",
                  "title": "Fight Club",
                  "video": false,
                  "vote_average": 8.43,
                  "vote_count": 287,
                }), isFavourite: true,
              );
              
            },
          );
        },
      ),
    );
  }
}
