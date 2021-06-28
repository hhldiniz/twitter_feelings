import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:twitter_feeling/bloc/home_bloc.dart';
import 'package:twitter_feeling/bloc_providers/home_bloc_provider.dart';
import 'package:twitter_feeling/states/tweets_state.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc? _bloc;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _bloc = HomeBlocProvider.of(context).bloc;

    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: screenSize.width,
                height: screenSize.height * 0.8,
                child: StreamBuilder<TweetsState>(
                    stream: _bloc!.tweetsControllerStream,
                    builder: (BuildContext context,
                        AsyncSnapshot<TweetsState> snapshot) {
                      return ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          return snapshot.data?.tweetFeels[index] ??
                              Text("Error");
                        },
                        itemCount: snapshot.data?.tweetFeels.length ?? 0,
                      );
                    }),
              )
            ],
          ),
          Row(
            children: [
              ElevatedButton(
                child: Text("Retrieve Tweets"),
                onPressed: () {
                  _bloc?.retrieveTweets();
                },
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _bloc?.dispose();
  }
}
