import 'package:flutter/material.dart';


class ImageWithDescriptionModel with ChangeNotifier {
  final String imagePath;
  String description;

  ImageWithDescriptionModel({
    required this.imagePath,
    this.description = '',
  });

  Map<String, dynamic> toJson() => {
        'imagePath': imagePath,
        'description': description,
      };

  factory ImageWithDescriptionModel.fromJson(Map<String, dynamic> json) {
    return ImageWithDescriptionModel(
      imagePath: json['imagePath'] as String,
      description: json['description'] as String? ?? '',
    );
  }
}
