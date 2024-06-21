import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dummy/models/unsplash_image.dart';
import '../pages/image_tile.dart';
import 'package:dummy/util/news_tile.dart';
import 'package:dummy/services/unsplash_service.dart'; // Adjust the import path as per your project structure

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<UnsplashImage>> futureImages;

  @override
  void initState() {
    super.initState();
    futureImages = UnsplashService().fetchImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi, Bharath',
                        style: GoogleFonts.rubik(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '19 June, 2024',
                        style: GoogleFonts.rubik(
                          textStyle: TextStyle(color: Colors.blue[200]),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[600],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: const Icon(
                      Icons.notifications_none_outlined,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Expanded(
                child: FutureBuilder<List<UnsplashImage>>(
                  future: futureImages,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('No data available'));
                    } else {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          // Assuming each item in snapshot.data is an image or image URL
                          var image = snapshot.data![index];

                          // Adjust the width according to your spacing preference
                          // Use Container or SizedBox to create the desired spacing
                          return Padding(
                            padding: EdgeInsets.only(
                                left: index == 0 ? 0
                                    : 23), 
                                child: ImageTile(image: image),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Latest Updates for you!",
                style: GoogleFonts.rubik(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: FutureBuilder<List<UnsplashImage>>(
                  future: futureImages,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('No data available'));
                    } else {
                      return ListView(
                        scrollDirection: Axis.vertical,
                        children: snapshot.data!.map((news) {
                          return NewsTile(news: news);
                        }).toList(),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
