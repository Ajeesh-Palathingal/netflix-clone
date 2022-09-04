import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/new_and_hot/widget/coming_soon_tile.dart';
import 'package:netflix_clone/presentation/new_and_hot/widget/everyones_watching_tile.dart';

import 'package:netflix_clone/presentation/widget/custom_icon_button.dart';

import '../widget/app_bar_widget.dart';
import 'widget/new_and_hot_appbar.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: NewAndHotAppBarWidget(
            mainWidget: Text(
              "New & Hot",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListView.separated(
                itemBuilder: (context, index) => ComingSoonTile(),
                separatorBuilder: (context, index) => kHeight30,
                itemCount: 5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListView.separated(
                itemBuilder: (context, index) => EveryonesWatchingTile(),
                separatorBuilder: (context, index) => kHeight30,
                itemCount: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
