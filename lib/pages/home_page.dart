import 'package:flutter/material.dart';
import 'package:lab3/mocks/posts.dart';
import 'package:lab3/mocks/stories.dart';
import 'package:lab3/theme/colors.dart';
import 'package:lab3/widgets/story.dart';

import '../widgets/post.dart';

class HomePage extends StatelessWidget {
  final stateCallback;
  const HomePage({Key key, this.stateCallback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              padding: EdgeInsets.only(top: 15),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 20, left: 15, bottom: 10),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 65,
                          height: 65,
                          child: Stack(
                            children: <Widget>[
                              Container(
                                width: 65,
                                height: 65,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.green),
                              ),
                              Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    width: 19,
                                    height: 19,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle, color: white),
                                    child: Icon(
                                      Icons.add_circle,
                                      color: buttonFollowColor,
                                      size: 19,
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          width: 70,
                          child: Text(
                            name,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: white),
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                      children: List.generate(stories.length, (index) {
                    return Story(
                      name: stories[index]['name'],
                    );
                  })),
                ],
              ),
            ),
          ),
          Divider(
            color: white.withOpacity(0.3),
          ),
          Column(
            children: List.generate(posts.length, (index) {
              return Post(
                name: posts[index]['name'],
                description: posts[index]['description'],
                isLiked: posts[index]['isLiked'],
                viewCount: posts[index]['commentCount'],
                likedBy: posts[index]['likedBy'],
                dayAgo: posts[index]['dayAgo'],
                stateCallback: this.stateCallback,
              );
            }),
          )
        ],
      ),
    );
  }
}
