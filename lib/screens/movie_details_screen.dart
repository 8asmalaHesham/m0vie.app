import 'package:flutter/material.dart';
import 'package:movies_starter/models/movie_model.dart';
import 'package:movies_starter/widgets/category_capsule.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key, required this.movieModel});

  final MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Hero(
              tag: '${movieModel.id}',
              child: SizedBox(
                height: size.height * 0.45,
                width: double.infinity,
                child: Image.network(
                  "https://image.tmdb.org/t/p/w500${movieModel.posterPath}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.4),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Material(
                      borderRadius: BorderRadius.circular(20),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 25),
                            Text(
                              movieModel.title?.isNotEmpty == true
                                  ? movieModel.title!
                                  : (movieModel.originalTitle ?? 'No title'),
                              maxLines: 2,
                              style: const TextStyle(
                                fontSize: 28.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 20,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  "${movieModel.voteAverage?.toStringAsFixed(1) ?? "N/A"}/10",
                                ),
                                const Spacer(),
                                Text(
                                  movieModel.releaseDate ?? 'Release Date',
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: const [
                                CategoryCapsule(title: "Drama"),
                                CategoryCapsule(title: "Thriller"),
                                CategoryCapsule(title: "Action"),
                                CategoryCapsule(title: "Fight"),
                                CategoryCapsule(title: "Black Comedy"),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Text(
                              movieModel.title == "Fight Club"
                                  ? "A depressed man (Edward Norton) suffering from insomnia meets a strange soap salesman named Tyler Durden (Brad Pitt) and soon finds himself living in his squalid house after his perfect apartment is destroyed. The two bored men form an underground club with strict rules and fight other men who are fed up with their mundane lives. Their perfect partnership frays when Marla (Helena Bonham Carter), a fellow support group crasher, attracts Tyler's attention."
                                  : (movieModel.overview ??
                                      'No Description found'),
                              textAlign: TextAlign.justify,
                              style: const TextStyle(fontSize: 18.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 5,
              left: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const BackButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
