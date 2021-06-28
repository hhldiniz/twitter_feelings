import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:twitter_feeling/bloc/base_bloc.dart';
import 'package:twitter_feeling/secrets.dart';
import 'package:twitter_feeling/states/tweets_state.dart';
import 'package:twitter_feeling/widgets/tweet_feel.dart';

class HomeBloc extends BaseBloc {
  String _twitterSampledStreamUrl =
      "https://api.twitter.com/2/tweets/sample/stream";

  Dio _dio = Dio();

  StreamController<TweetsState> _tweetsController = StreamController();

  Stream<TweetsState> get tweetsControllerStream => _tweetsController.stream;

  retrieveTweets() {
    final Map<String, dynamic> _headers = HashMap();
    _headers["Authorization"] = "Bearer ${Secrets.bearer.value}";
    _dio.options.headers = _headers;
    _dio.get(_twitterSampledStreamUrl).then((value) {
      var response = jsonDecode(value.toString()) as Map<String, dynamic>;
      _tweetsController.sink.add(TweetsState(
          (response['data'] as List<Map<String, dynamic>>)
              .map((e) => TweetFeel(e["text"], 1))
              .toList()));
    });
  }

  @override
  void dispose() {
    _tweetsController.close();
  }
}
