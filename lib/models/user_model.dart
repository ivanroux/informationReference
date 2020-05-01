import 'package:hive/hive.dart';
import 'package:temp/models/original_model.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  String name;

  @HiveField(1)
  String image;

  List<Original> original;

  @HiveField(2)
  int number;

  @HiveField(3)
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
