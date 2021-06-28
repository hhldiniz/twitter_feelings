import 'package:twitter_feeling/widgets/tweet_feel.dart';

class TweetsState {
  List<TweetFeel> _tweetFeels;

  TweetsState(this._tweetFeels);

  List<TweetFeel> get tweetFeels => _tweetFeels;
}
