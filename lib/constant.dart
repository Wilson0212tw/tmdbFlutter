const String baseUrl = 'https://api.themoviedb.org/3';

const String apiKey = '2d3ba1739ddd02df39fd121790f45b71';

const String imageBaseUrl = 'https://image.tmdb.org/t/p/';

enum BackdropImageURL {
  w300("w300"),
  w780("w780"),
  w1280("w1280"),
  ori("original");

  final String size;
  const BackdropImageURL(this.size);

  get partialUrl => imageBaseUrl + size + '/';
}

enum LogoImageURL {
  w45("w45"),
  w92("w92"),
  w154("w154"),
  w185("w185"),
  w300("w300"),
  w500("w500"),
  ori("original");

  final String size;
  const LogoImageURL(this.size);

  get partialUrl => imageBaseUrl + size + '/';
}

enum PosterImageURL {
  w342("w342"),
  w92("w92"),
  w154("w154"),
  w185("w185"),
  w300("w300"),
  w500("w500"),
  w780("w780"),
  ori("original");

  final String size;
  const PosterImageURL(this.size);

  get partialUrl => imageBaseUrl + size;
}

// images":{
// "base_url": "http://image.tmdb.org/t/p/",
// "secure_base_url": "https://image.tmdb.org/t/p/",
// "backdrop_sizes":["w300", "w780", "w1280", "original"],
// "logo_sizes":["w45", "w92", "w154", "w185", "w300", "w500", "original"],
// "poster_sizes":["w92", "w154", "w185", "w342", "w500", "w780", "original"],
// "profile_sizes":["w45", "w185", "h632", "original"],
// "still_sizes":["w92", "w185", "w300", "original"]
// },
