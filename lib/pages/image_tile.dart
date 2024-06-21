import 'package:dummy/models/unsplash_image.dart';
import 'package:flutter/material.dart';
import '../models/unsplash_image.dart';

class ImageTile extends StatelessWidget {
  final UnsplashImage image;

  const ImageTile({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      
      padding: const EdgeInsets.only(bottom: 20), 
      child: Container(
        width: 150,
        height: 200, 
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          color: const Color.fromARGB(255, 39, 117, 253),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(17),
          child: Image.network(
            image.imageUrl,
            fit: BoxFit.cover, 
          ),
        ),
      ),
    );
  }
}
