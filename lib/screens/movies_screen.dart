import 'package:flutter/material.dart';
import 'package:movies_starter/main.dart';
import 'package:movies_starter/services/api_service.dart';
import 'package:movies_starter/widgets/movie_card.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {

  void loadMovies()async{
    await ApiService.sendRequest();
    setState(() {
      
    });
  }

  @override
  void initState() {
    loadMovies();
    // ApiService.sendRequest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Popular Movies"),
        centerTitle: false,
        actions: [
          IconButton(icon: Icon(Icons.favorite,), onPressed: () {
            
          },),
           IconButton(icon: Icon(Icons.dark_mode,), onPressed: () {
            
          },),
        ],
      ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: appBrain.movies.length,
                itemBuilder:(context, index) {
                  return MovieCard(model: appBrain.movies[index],);
                },
                ),
            )
            
          ],
        ),
      );
  }
}

/*
mightyomar
Mnzalawy@22
*/