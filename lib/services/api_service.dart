// import 'dart:convert' as json;
// import 'dart:nativewrappers/_internal/vm/lib/convert_patch.dart';
// import 'package:http/http.dart' as http;
// import 'package:movies_starter/constants/api_constants.dart';
// import 'package:movies_starter/main.dart';
// import 'package:movies_starter/models/movie_model.dart';

// class ApiService {
//   static Future<void> sendRequest() async {
//     final url = Uri.parse(ApiConstants.popularMoviesUrl);

//     final response = await http.get(
//       url,
//       headers: {"Authorization": "Bearer ${ApiConstants.apiKey}"},
//     );
//     if (response.statusCode == 200) {
      

//       //json
//       //json --> Map<String,dynamic> (deserialization)
//       //Map --> List<MovieModel>

//       final moviesMap = jsonDecode(response.body) as Map<String, dynamic>;
//       final moviesList = moviesMap['results'] as List;

//       final List<MovieModel> movieModels =
//           moviesList.map((movie) => MovieModel.fromJson(movie)).toList();

//       appBrain.movies.value = movieModels;
//       print("movies: $moviesList");
//     }
//   }
// }