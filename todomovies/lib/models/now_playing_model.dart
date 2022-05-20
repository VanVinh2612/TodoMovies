import 'package:todomovies/common/number_common.dart';

class NowPlaying {
  Dates? dates;
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

  NowPlaying(
      {Dates? dates,
      int? page,
      List<Results>? results,
      int? totalPages,
      int? totalResults}) {
    if (dates != null) {
      this.dates = dates;
    }
    if (page != null) {
      this.page = page;
    }
    if (results != null) {
      this.results = results;
    }
    if (totalPages != null) {
      this.totalPages = totalPages;
    }
    if (totalResults != null) {
      this.totalResults = totalResults;
    }
  }

  NowPlaying.fromJson(Map<String, dynamic> json) {
    dates = json['dates'] != null ? Dates.fromJson(json['dates']) : null;
    page = json['page'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (dates != null) {
      data['dates'] = dates!.toJson();
    }
    data['page'] = page;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}

class Dates {
  String? maximum;
  String? minimum;

  Dates({String? maximum, String? minimum}) {
    if (maximum != null) {
      this.maximum = maximum;
    }
    if (minimum != null) {
      this.minimum = minimum;
    }
  }

  Dates.fromJson(Map<String, dynamic> json) {
    maximum = json['maximum'];
    minimum = json['minimum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['maximum'] = maximum;
    data['minimum'] = minimum;
    return data;
  }
}

class Results {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  Results(
      {bool? adult,
      String? backdropPath,
      List<int>? genreIds,
      int? id,
      String? originalLanguage,
      String? originalTitle,
      String? overview,
      double? popularity,
      String? posterPath,
      String? releaseDate,
      String? title,
      bool? video,
      double? voteAverage,
      int? voteCount}) {
    if (adult != null) {
      this.adult = adult;
    }
    if (backdropPath != null) {
      this.backdropPath = backdropPath;
    }
    if (genreIds != null) {
      this.genreIds = genreIds;
    }
    if (id != null) {
      this.id = id;
    }
    if (originalLanguage != null) {
      this.originalLanguage = originalLanguage;
    }
    if (originalTitle != null) {
      this.originalTitle = originalTitle;
    }
    if (overview != null) {
      this.overview = overview;
    }
    if (popularity != null) {
      this.popularity = popularity;
    }
    if (posterPath != null) {
      this.posterPath = posterPath;
    }
    if (releaseDate != null) {
      this.releaseDate = releaseDate;
    }
    if (title != null) {
      this.title = title;
    }
    if (video != null) {
      this.video = video;
    }
    if (voteAverage != null) {
      this.voteAverage = voteAverage;
    }
    if (voteCount != null) {
      this.voteCount = voteCount;
    }
  }

  Results.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = NumberCommon.checkDouble(['popularity']);
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = NumberCommon.checkDouble(json['vote_average'])  ;
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    data['genre_ids'] = genreIds;
    data['id'] = id;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['popularity'] = popularity;
    data['poster_path'] = posterPath;
    data['release_date'] = releaseDate;
    data['title'] = title;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    return data;
  }
}
