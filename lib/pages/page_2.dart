import 'package:flutter/material.dart';
import 'package:lab3/theme/colors.dart';
import 'package:lab3/models/story_model.dart';
import 'package:provider/provider.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Page 2",
              style: TextStyle(fontSize: 20, color: white),
            ),
            Consumer<StoryModel>(builder: (context, story, child) {
              return Text(
                'Total stories: ${story.counter}',
                style: TextStyle(color: white),
              );
            })
          ]),
    );
  }
}
