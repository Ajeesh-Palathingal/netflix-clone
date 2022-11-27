import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/search/widget/search_result.dart';
import 'package:netflix_clone/presentation/widget/app_bar_widget.dart';
import 'package:netflix_clone/presentation/widget/main_image_card.dart';
import 'package:netflix_clone/presentation/widget/title.dart';
import 'package:outlined_text/outlined_text.dart';

import 'widget/background_image_card.dart';
import 'widget/homeAppbar_widget.dart';
import 'widget/numbered_title_card_list.dart';
import 'widget/title_card_list.dart';
import 'package:flutter/rendering.dart';

ValueNotifier<bool> appBarWidgetVisisbilityListener = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        children: [
          NotificationListener<UserScrollNotification>(
            onNotification: ((notification) {
              final ScrollDirection scrollDirection = notification.direction;
              if (scrollDirection == ScrollDirection.forward) {
                appBarWidgetVisisbilityListener.value = true;
              } else if (scrollDirection == ScrollDirection.reverse) {
                appBarWidgetVisisbilityListener.value = false;
              }

              return true;
            }),
            child: ListView(
              children: const [
                BackgroundImageCard(),
                TitleAndCardList(title: "Released in the past"),
                kHeight20,
                TitleAndCardList(title: "Trending Now"),
                kHeight20,
                NumberedTitleCardList(),
                kHeight20,
                TitleAndCardList(title: "Tense Dramas"),
                kHeight20,
                TitleAndCardList(title: "South Indian Cinima"),
              ],
            ),
          ),

          // App bar

          ValueListenableBuilder(
              valueListenable: appBarWidgetVisisbilityListener,
              builder: (BuildContext context, bool visible, _) {
                const kAppbarOpacity = 0.2;
                if (visible) {
                  return const HomeAppBarWidget(kAppbarOpacity: kAppbarOpacity);
                } else {
                  return const SizedBox();
                }
              }),
        ],
      ),
    ));
  }
}
