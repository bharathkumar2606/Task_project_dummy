import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/unsplash_image.dart';

class UnsplashService {
  final String accessKey = 'OegGmv8LJdJUzKtvYygv-VgPleUFDdnEnBfUuZBeUE8';

  Future<List<UnsplashImage>> fetchImages() async {
    final response = await http.get(
      Uri.parse('https://api.unsplash.com/photos?client_id=$accessKey'),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => UnsplashImage.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load images');
    }
  }
}
