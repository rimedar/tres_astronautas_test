// To parse this JSON data, do
//
//     final gifModel = gifModelFromJson(jsonString);

import 'dart:convert';

GifModel gifModelFromJson(String str) => GifModel.fromJson(json.decode(str));

String gifModelToJson(GifModel data) => json.encode(data.toJson());

class GifModel {
  GifModel({
    required this.data,
  });

  List<Gif> data;

  factory GifModel.fromJson(Map<String, dynamic> json) => GifModel(
        data: List<Gif>.from(json["data"].map((x) => Gif.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Gif {
  Gif({
    required this.title,
    required this.images,
  });

  String title;

  Images images;

  factory Gif.fromJson(Map<String, dynamic> json) => Gif(
        title: json["title"],
        images: Images.fromJson(json["images"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "images": images.toJson(),
      };
}

class Images {
  Images({
    required this.original,
  });

  FixedHeight original;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        original: FixedHeight.fromJson(json["original"]),
      );

  Map<String, dynamic> toJson() => {
        "original": original.toJson(),
      };
}

class FixedHeight {
  FixedHeight({
    required this.url,
  });

  String url;

  factory FixedHeight.fromJson(Map<String, dynamic> json) => FixedHeight(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}
