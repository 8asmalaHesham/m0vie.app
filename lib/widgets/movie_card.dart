import 'package:flutter/material.dart';
import 'package:movies_starter/models/movie_model.dart';
import 'package:movies_starter/widgets/category_capsule.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key,required this.model});

  final MovieModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      padding: EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              width: 90,
              height: 130,
              child: Image.network("https://image.tmdb.org/t/p/w500${model.posterPath}",fit: BoxFit.cover,),
            ),
          ),
          const SizedBox(width: 12,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                 model.originalTitle ?? "Placeholder",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600
                  ),
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.star,
                    color: Colors.yellow,
                    ),
                    const SizedBox(width: 4,),
                    Text("${model.voteAverage?.toStringAsFixed(1) ?? "N/A"}/10")
                  ], 
                ),
                const SizedBox(height: 12,),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    CategoryCapsule(title: "Drama"),
                    CategoryCapsule(title:  "Thriller"),
                    CategoryCapsule(title:  "Action"),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    Icon(Icons.schedule,color: Colors.teal,),
                    const SizedBox(width: 4,),
                    Text(model.releaseDate ?? "N/A",style: TextStyle(color: Colors.white54),),
                    Spacer(),
                    IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border_outlined))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}