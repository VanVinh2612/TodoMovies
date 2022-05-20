import 'package:flutter/material.dart';
import 'package:todomovies/models/movie_video_model.dart';
import 'package:todomovies/network/api_movie_video_network.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoTrailerMovie extends StatefulWidget {
  const VideoTrailerMovie({Key? key, required this.id}) : super(key: key);
  final int? id;
  @override
  State<VideoTrailerMovie> createState() => _VideoTrailerMovieState();
}

class _VideoTrailerMovieState extends State<VideoTrailerMovie> {
  late YoutubePlayerController _playerController;
  late ApiMovieVideoNetwork _apiMovieVideoNetwork;
  // late Future<MovieVideo>? movieVideo;
  late VideoMovieDetail _videoMovie;
  String key = '';

void runYoutubePlayer(String key) {
    _playerController = YoutubePlayerController(
      initialVideoId: key,
      flags: const YoutubePlayerFlags(
          enableCaption: false, isLive: false, autoPlay: true),
    );
  }
  @override
  void initState() {
    super.initState();
    _apiMovieVideoNetwork = ApiMovieVideoNetwork();
    _videoMovie = VideoMovieDetail();
    _movieVideo();
    checkKeyTrailer();
    runYoutubePlayer(key);
  }

  Future<VideoMovieDetail> _movieVideo() async {
    final videoTrailer = await _apiMovieVideoNetwork.getDataMovieVideoDetail(
        'https://api.themoviedb.org/3/movie/${widget.id}/videos?api_key=d79d9f8467a0e6d7b24624c522cb2ab3&append_to_response=credits');
    if (videoTrailer != null) {
      _videoMovie = videoTrailer;

      return _videoMovie;
    } else {
      throw Exception();
    }
  }

  void checkKeyTrailer() async {
    _videoMovie = await _movieVideo();
    int? length = _videoMovie.results?.length;
    if (length != null) {
      for (int i = 0; i < length; i++) {
        if (_videoMovie.results?[i].name?.compareTo('Final Trailer') == 0) {
          key = _videoMovie.results?[i].key ?? "";
        }
      }
    }
    _playerController = YoutubePlayerController(
      initialVideoId: key,
      flags: const YoutubePlayerFlags(
          enableCaption: false, isLive: false, autoPlay: true),
    );
  }

  

  @override
  void deactivate() {
    _playerController.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _playerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<VideoMovieDetail>(
          future: _movieVideo(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                    "Something wrong with message: ${snapshot.error.toString()}"),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              return YoutubePlayerBuilder(
                player: YoutubePlayer(controller: _playerController),
                builder: (context, player) => ListView(
                  children: [player],
                ),
              );
            } else {
              return const Center(
                child: Text("Loading"),
              );
            }
          },
        ),
      ),
    );
  }
}
