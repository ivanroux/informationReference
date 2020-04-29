import 'package:temp/models/original_model.dart';

class User {
  String name;
  String image;
  List<Original> original;
  int number;
  String season;

  User({this.name, this.image, this.original, this.number, this.season});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    if (json['original'] != null) {
      original = List<Original>();
      json['original'].forEach((v) {
        original.add(Original.fromJson(v));
      });
    }
    number = json['number'];
    season = json['season'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    if (this.original != null) {
      data['original'] = this.original.map((v) => v.toJson()).toList();
    }
    data['number'] = this.number;
    data['season'] = this.season;
    return data;
  }
}