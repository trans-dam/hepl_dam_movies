class MediaDetail {
  String homePage;
  String tagline;
  int runtime;
  List<dynamic> genres = [];

  MediaDetail({this.homePage = "", this.tagline = "", this.runtime = 0});

  void fromJson(Map<String, dynamic> json) {
    homePage = json['homepage'];
    tagline = json['tagline'];
    runtime = json['runtime'];
    genres = json['genres'];
  }
}
