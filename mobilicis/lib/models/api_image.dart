class ListingImage {
  final String fullImage;

  ListingImage({required this.fullImage});

  factory ListingImage.fromJson(Map<String, dynamic> json) {
    return ListingImage(fullImage: json['fullImage']);
  }
}
