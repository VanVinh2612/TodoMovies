class PersonDetail {
  bool? adult;
  List<String>? alsoKnownAs;
  String? biography;
  String? birthday;
  String? deathday;
  int? gender;
  String? homepage;
  int? id;
  String? imdbId;
  String? knownForDepartment;
  String? name;
  String? placeOfBirth;
  double? popularity;
  String? profilePath;
  Credits? credits;

  PersonDetail(
      {this.adult,
      this.alsoKnownAs,
      this.biography,
      this.birthday,
      this.deathday,
      this.gender,
      this.homepage,
      this.id,
      this.imdbId,
      this.knownForDepartment,
      this.name,
      this.placeOfBirth,
      this.popularity,
      this.profilePath,
      this.credits});

  PersonDetail.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    alsoKnownAs = json['also_known_as'].cast<String>();
    biography = json['biography'];
    birthday = json['birthday'];
    deathday = json['deathday'];
    gender = json['gender'];
    homepage = json['homepage'];
    id = json['id'];
    imdbId = json['imdb_id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    placeOfBirth = json['place_of_birth'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
    credits =
        json['credits'] != null ? Credits.fromJson(json['credits']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = adult;
    data['also_known_as'] = alsoKnownAs;
    data['biography'] = biography;
    data['birthday'] = birthday;
    data['deathday'] = deathday;
    data['gender'] = gender;
    data['homepage'] = homepage;
    data['id'] = id;
    data['imdb_id'] = imdbId;
    data['known_for_department'] = knownForDepartment;
    data['name'] = name;
    data['place_of_birth'] = placeOfBirth;
    data['popularity'] = popularity;
    data['profile_path'] = profilePath;
    if (credits != null) {
      data['credits'] = credits!.toJson();
    }
    return data;
  }
}

class Credits {
  List<Cast>? cast;
  List<Cast>? crew;

  Credits({this.cast, this.crew});

  Credits.fromJson(Map<String, dynamic> json) {
    if (json['cast'] != null) {
      cast = <Cast>[];
      json['cast'].forEach((v) {
        cast!.add(Cast.fromJson(v));
      });
    }
    if (json['crew'] != null) {
      crew = <Cast>[];
      json['crew'].forEach((v) {
        crew!.add(Cast.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cast != null) {
      data['cast'] = cast!.map((v) => v.toJson()).toList();
    }
    if (crew != null) {
      data['crew'] = crew!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cast {
  List<int>? genreIds;
  String? originalLanguage;
  String? originalTitle;
  String? posterPath;
  double? voteAverage;
  String? title;
  String? overview;
  String? releaseDate;
  int? voteCount;
  bool? video;
  bool? adult;
  String? backdropPath;
  int? id;
  double? popularity;
  String? character;
  String? creditId;
  int? order;

  Cast(
      {this.genreIds,
      this.originalLanguage,
      this.originalTitle,
      this.posterPath,
      this.voteAverage,
      this.title,
      this.overview,
      this.releaseDate,
      this.voteCount,
      this.video,
      this.adult,
      this.backdropPath,
      this.id,
      this.popularity,
      this.character,
      this.creditId,
      this.order});

  Cast.fromJson(Map<String, dynamic> json) {
    genreIds = json['genre_ids'].cast<int>();
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    posterPath = json['poster_path'];
    voteAverage = json['vote_average'];
    title = json['title'];
    overview = json['overview'];
    releaseDate = json['release_date'];
    voteCount = json['vote_count'];
    video = json['video'];
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    id = json['id'];
    popularity = json['popularity'];
    character = json['character'];
    creditId = json['credit_id'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['genre_ids'] = genreIds;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['poster_path'] = posterPath;
    data['vote_average'] = voteAverage;
    data['title'] = title;
    data['overview'] = overview;
    data['release_date'] = releaseDate;
    data['vote_count'] = voteCount;
    data['video'] = video;
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    data['id'] = id;
    data['popularity'] = popularity;
    data['character'] = character;
    data['credit_id'] = creditId;
    data['order'] = order;
    return data;
  }
}

