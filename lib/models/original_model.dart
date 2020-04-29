class Original {
  int guidlineID;
  String guidlineName;
  String guidelinePicture;
  String guidelineText;
  String guidelineCompliance;
  String pictureID1;
  String pictureURL1;
  String pictureName1;
  String pictureCompliance1;
  String pictureComment1;
  String pictureGuideline1;
  String pictureAlignemnt1;

  Original(
      {this.guidlineID,
      this.guidlineName,
      this.guidelinePicture,
      this.guidelineText,
      this.guidelineCompliance,
      this.pictureID1,
      this.pictureURL1,
      this.pictureName1,
      this.pictureCompliance1,
      this.pictureComment1,
      this.pictureGuideline1,
      this.pictureAlignemnt1});

  Original.fromJson(Map<String, dynamic> json) {
    guidlineID = json['guidlineID'];
    guidlineName = json['guidlineName'];
    guidelinePicture = json['guidelinePicture'];
    guidelineText = json['guidelineText'];
    guidelineCompliance = json['guidelineCompliance'];
    pictureID1 = json['pictureID1'];
    pictureURL1 = json['pictureURL1'];
    pictureName1 = json['pictureName1'];
    pictureCompliance1 = json['pictureCompliance1'];
    pictureComment1 = json['pictureComment1'];
    pictureGuideline1 = json['pictureGuideline1'];
    pictureAlignemnt1 = json['pictureAlignemnt1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['guidlineID'] = this.guidlineID;
    data['guidlineName'] = this.guidlineName;
    data['guidelinePicture'] = this.guidelinePicture;
    data['guidelineText'] = this.guidelineText;
    data['guidelineCompliance'] = this.guidelineCompliance;
    data['pictureID1'] = this.pictureID1;
    data['pictureURL1'] = this.pictureURL1;
    data['pictureName1'] = this.pictureName1;
    data['pictureCompliance1'] = this.pictureCompliance1;
    data['pictureComment1'] = this.pictureComment1;
    data['pictureGuideline1'] = this.pictureGuideline1;
    data['pictureAlignemnt1'] = this.pictureAlignemnt1;
    return data;
  }
}