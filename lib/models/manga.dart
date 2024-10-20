import 'dart:convert';
import 'package:flutter/foundation.dart';

class Manga {

  Manga({
    required this.name,
    required this.japaneseName,
    required this.image,
    required this.description,
    required this.author,
    required this.genres,
  });

  final String name;
  final String japaneseName;
  final String image;
  final String description;
  final String author;
  final List<String> genres;

  Manga copyWith({
    String? name,
    String? japaneseName,
    String? image,
    String? description,
    String? author,
    List<String>? genres,
  }) {
    return Manga(
      name: name ?? this.name,
      japaneseName: japaneseName ?? this.japaneseName,
      image: image ?? this.image,
      description: description ?? this.description,
      author: author ?? this.author,
      genres: genres ?? this.genres,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'author': author,
      'generes': genres,
    };
  }

  factory Manga.fromMap(Map<String, dynamic> map) {
    return Manga(
      name: map['name'] ?? '',
      japaneseName: map['japaneseName'] ?? '',
      image: map['image'] ?? '',
      description: map['description'] ?? '',
      author: map['author'] ?? '',
      genres: List<String>.from(map['generes']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Manga.fromJson(String source) => Manga.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Manga(name: $name, image: $image, description: $description, author: $author, generes: ${genres.join(', ')})';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Manga &&
      other.name == name &&
      other.japaneseName == japaneseName &&
      other.image == image &&
      other.description == description &&
      other.author == author &&
      listEquals(other.genres, genres);
  }

  @override
  int get hashCode {
    return name.hashCode ^
      japaneseName.hashCode ^
      image.hashCode ^
      description.hashCode ^
      author.hashCode ^
      genres.hashCode;
  }
}
