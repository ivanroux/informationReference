import 'dart:convert';

Albums jsonDecode(String str) => Albums.fromJson(json.decode(str));

String albumsToJson(Albums data) => json.encode(data.toJson());

class Albums {
    List<User> user;

    Albums({
        this.user,
    });

    factory Albums.fromJson(Map<String, dynamic> json) => Albums(
        user: List<User>.from(json["user"].map((x) => User.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "user": List<dynamic>.from(user.map((x) => x.toJson())),
    };
}

class User {
    String name;
    String image;
    List<Original> original;
    int number;
    String season;

    User({
        this.name,
        this.image,
        this.original,
        this.number,
        this.season,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        image: json["image"],
        original: List<Original>.from(json["original"].map((x) => Original.fromJson(x))),
        number: json["number"],
        season: json["season"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "original": List<dynamic>.from(original.map((x) => x.toJson())),
        "number": number,
        "season": season,
    };
}

class Original {
    int guidlineId;
    String guidlineName;
    String guidelinePicture;
    String guidelineText;
    String guidelineCompliance;
    String pictureId1;
    String pictureUrl1;
    String pictureName1;
    String pictureCompliance1;
    String pictureComment1;
    String pictureGuideline1;
    String pictureAlignemnt1;

    Original({
        this.guidlineId,
        this.guidlineName,
        this.guidelinePicture,
        this.guidelineText,
        this.guidelineCompliance,
        this.pictureId1,
        this.pictureUrl1,
        this.pictureName1,
        this.pictureCompliance1,
        this.pictureComment1,
        this.pictureGuideline1,
        this.pictureAlignemnt1,
    });

    factory Original.fromJson(Map<String, dynamic> json) => Original(
        guidlineId: json["guidlineID"],
        guidlineName: json["guidlineName"],
        guidelinePicture: json["guidelinePicture"],
        guidelineText: json["guidelineText"],
        guidelineCompliance: json["guidelineCompliance"],
        pictureId1: json["pictureID1"],
        pictureUrl1: json["pictureURL1"],
        pictureName1: json["pictureName1"],
        pictureCompliance1: json["pictureCompliance1"],
        pictureComment1: json["pictureComment1"],
        pictureGuideline1: json["pictureGuideline1"],
        pictureAlignemnt1: json["pictureAlignemnt1"],
    );

    Map<String, dynamic> toJson() => {
        "guidlineID": guidlineId,
        "guidlineName": guidlineName,
        "guidelinePicture": guidelinePicture,
        "guidelineText": guidelineText,
        "guidelineCompliance": guidelineCompliance,
        "pictureID1": pictureId1,
        "pictureURL1": pictureUrl1,
        "pictureName1": pictureName1,
        "pictureCompliance1": pictureCompliance1,
        "pictureComment1": pictureComment1,
        "pictureGuideline1": pictureGuideline1,
        "pictureAlignemnt1": pictureAlignemnt1,
    };
}
