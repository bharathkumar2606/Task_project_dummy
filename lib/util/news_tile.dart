import 'package:flutter/material.dart';
import 'package:dummy/models/unsplash_image.dart';
import 'package:dummy/pages/image_detail_page.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsTile extends StatelessWidget {
  final UnsplashImage news;

  const NewsTile({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ImageDetailPage(image: news),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20), // Adjust bottom padding as needed
        child: Container(
          width: double.infinity, // Use full width available
          height: 200, // Fixed height for uniformity, adjust as needed
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            color: const Color.fromARGB(255, 39, 117, 253),
            image: DecorationImage(
              image: NetworkImage(news.imageUrl),
              fit: BoxFit.cover, // Ensure all images are uniformly sized
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.7),
                  Colors.transparent,
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    news.altDescription ?? '', // To Ensure altDescription is not null
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    news.img_description ?? '', // To Ensure description is not null
                    style: GoogleFonts.rubik(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
