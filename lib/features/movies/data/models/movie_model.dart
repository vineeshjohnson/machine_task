class MovieModel {
  final int id;
  final String posterpath;
  final String releasedate;
  final String title;
  final String description;
  final String backdroppath;

  MovieModel(
      {required this.id,
      required this.posterpath,
      required this.releasedate,
      required this.title,
      required this.description,
      required this.backdroppath});
  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
        id: json['id'],
        posterpath: json['poster_path'],
        releasedate: json['release_date'],
        title: json['title'],
        description: json['overview'],
        backdroppath: json['backdrop_path']);
  }
}
