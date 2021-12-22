class MediaDetail {
  String homePage;
  String tagline;
  int runtime;
  List<dynamic> genres = [];

  MediaDetail({this.homePage = "", this.tagline = "", this.runtime = 0});

  void fromJson(Map<String, dynamic> json) {
      this.homePage = json['homepage'];
      this.tagline = json['tagline'];
      this.runtime = json['runtime'];
      this.genres = json['genres'];
  }
}
