import 'package:flutter/material.dart';
import 'package:movies_starter/main.dart';
import 'package:movies_starter/models/movie_model.dart';
import 'package:movies_starter/screens/movie_details_screen.dart';
import 'package:movies_starter/widgets/category_capsule.dart';

class MovieCard extends StatefulWidget {
  const MovieCard({super.key, required this.model, required this.isFavourite});

  final MovieModel model;
  final bool isFavourite;

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () => Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => MovieDetailsScreen(movieModel: widget.model),
            ),
          ),
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: SizedBox(
                width: 90,
                height: 130,
                child: Hero(
                  tag: 'MOVIE_${widget.model.id}',
                  child: Image.network(
                    "https://image.tmdb.org/t/p/w500${widget.model.posterPath}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.model.originalTitle ?? "Placeholder",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.yellow),
                      const SizedBox(width: 4),
                      Text(
                        "${widget.model.voteAverage?.toStringAsFixed(1) ?? "N/A"}/10",
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      CategoryCapsule(title: "Drama"),
                      CategoryCapsule(title: "Thriller"),
                      CategoryCapsule(title: "Action"),
                      CategoryCapsule(title: "Fight"),
                      CategoryCapsule(title: "Black Comedy"),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.schedule, color: Colors.teal),
                      const SizedBox(width: 4),
                      Text(
                        widget.model.releaseDate ?? "N/A",
                        style: TextStyle(
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withOpacity(0.6),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (appBrain.favouriteMovies.value.contains(
                              widget.model,
                            )) {
                              appBrain.removeFromFavourite(widget.model);
                            } else {
                              appBrain.addToFavourite(widget.model);
                            }
                          });
                        },
                        icon: Icon(
                          appBrain.favouriteMovies.value.contains(widget.model)
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                        ),
                        color:
                            appBrain.favouriteMovies.value.contains(
                                  widget.model,
                                )
                                ? Colors.red
                                : null,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
