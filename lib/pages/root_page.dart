import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lab3/pages/home_page.dart';
import 'package:lab3/pages/page_2.dart';
import 'package:lab3/theme/colors.dart';

class RootPage extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootPage> {
  int page = 0;
  int liftedCounter = 0;

  void _incrementCounter() {
    setState(() {
      liftedCounter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      backgroundColor: black,
      body: getBody(),
      bottomNavigationBar: getBottomNavigationBar(),
    );
  }

  Widget getBody() {
    List<Widget> pages = [
      HomePage(stateCallback: _incrementCounter),
      Center(
        child: Text(
          "Page 1, lifted state = $liftedCounter",
          style: TextStyle(fontSize: 20, color: white),
        ),
      ),
      Page2(),
      Center(
        child: Text(
          "Page 3",
          style: TextStyle(fontSize: 20, color: white),
        ),
      ),
      Center(
        child: Text(
          "Page 4",
          style: TextStyle(fontSize: 20, color: white),
        ),
      )
    ];
    return IndexedStack(
      index: page,
      children: pages,
    );
  }

  Widget getAppBar() {
    return AppBar(
      backgroundColor: appBarColor,
      title: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SvgPicture.asset(
              "public/images/camera_icon.svg",
              width: 30,
            ),
            Text(
              "Instagram",
              style: TextStyle(fontSize: 25),
            ),
            SvgPicture.asset(
              "public/images/message_icon.svg",
              width: 30,
            ),
          ],
        ),
      ),
    );
  }

  Widget getBottomNavigationBar() {
    List bottomItems = [
      "public/images/home_active_icon.svg",
      "public/images/search_icon.svg",
      "public/images/upload_icon.svg",
      "public/images/love_icon.svg",
      "public/images/account_icon.svg",
    ];
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(color: appFooterColor),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(bottomItems.length, (index) {
            return InkWell(
                onTap: () {
                  setState(() {
                    page = index;
                  });
                },
                child: SvgPicture.asset(
                  bottomItems[index],
                  width: 27,
                ));
          }),
        ),
      ),
    );
  }
}
