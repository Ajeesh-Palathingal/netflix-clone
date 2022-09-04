import 'package:netflix_clone/core/urls.dart';
import 'package:netflix_clone/infrastructure/api_key.dart';

class ApiEndPoints {
  static const downloads = "$baseUrl/trending/all/day?api_key=$apiKey";
}
