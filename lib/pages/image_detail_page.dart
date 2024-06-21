import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/unsplash_image.dart';

class ImageDetailPage extends StatelessWidget {
  final UnsplashImage image;

  ImageDetailPage({required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              image.imageUrl,
              width: double.infinity, // Make image fill the width of the screen
              height: 300, // Fixed height for the image, adjust as needed
              fit: BoxFit.cover, // Ensure image covers the available space
            ),
            SizedBox(height: 16),
            Text(
              'Headline: ${image.altDescription ?? ''}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Description: ${image.img_description ?? ''}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              'Date: ${DateFormat.yMMMMd().format(DateTime.now())}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                await _saveImageDetailsToLocal(image, context);
              },
              child: Text('Save'),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Future<void> _saveImageDetailsToLocal(UnsplashImage image, BuildContext context) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList(image.id, [
        image.altDescription ?? '',
        image.img_description ?? '',
        image.imageUrl,
      ]);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Saved locally!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save locally!')),
      );
    }
  }
}
