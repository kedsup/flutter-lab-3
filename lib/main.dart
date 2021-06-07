import 'package:flutter/material.dart';
import 'package:lab3/pages/root_page.dart';
import 'package:lab3/models/story_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MaterialApp(
    home: ChangeNotifierProvider(
      create: (context) => StoryModel(),
      child: RootPage(),
    ),
  ));
}
