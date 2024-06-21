class UnsplashImage {
  final String id;
  final String img_description;
  final String altDescription;
  final String imageUrl;

  UnsplashImage({
    required this.id,
    required this.img_description,
    required this.altDescription,
    required this.imageUrl,
  });

  factory UnsplashImage.fromJson(Map<String, dynamic> json) {
    return UnsplashImage(
      id: json['id'],
      img_description: json['description'] ?? '',
      altDescription: json['alt_description'] ?? '',
      imageUrl: json['urls']['small'],
    );
  }
}
