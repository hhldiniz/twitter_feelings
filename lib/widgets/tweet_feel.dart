import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class TweetFeel extends StatelessWidget {
  final String message;
  final int feeling;

  TweetFeel(this.message, this.feeling);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(message),
            Wrap(
              direction: Axis.horizontal,
              spacing: 8,
              children: [
                Container(
                  height: 10,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.elliptical(300, 200)),
                      border: Border.all(color: Colors.black, width: 1)),
                ),
                Container(
                  height: 10,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.elliptical(300, 200)),
                      border: Border.all(color: Colors.black, width: 1)),
                ),
                Container(
                  height: 10,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.elliptical(300, 200)),
                      border: Border.all(color: Colors.black, width: 1)),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
