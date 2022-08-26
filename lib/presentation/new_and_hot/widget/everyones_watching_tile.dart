import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/presentation/new_and_hot/widget/coming_soon_tile.dart';
import 'package:netflix_clone/presentation/new_and_hot/widget/new_and_hot_film_list_item.dart';
import 'package:netflix_clone/presentation/widget/custom_icon_button.dart';

import '../../../core/constants.dart';

class EveryonesWatchingTile extends StatelessWidget {
  const EveryonesWatchingTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NewAndHotFilmListItem(
      imageHeight: 0.55,
      filmTitle: "Tall Girl 2", 
      iconButtons: EveryonesWhatchingIconButtons());
  }
}





class EveryonesWhatchingIconButtons extends StatelessWidget {
  const EveryonesWhatchingIconButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIconButton(
          icon: Icons.share,
          label: "Share",
          fontSize: 12,
        ),
        CustomIconButton(
          icon: Icons.add, 
          label: "My List",
          fontSize: 12,
        ),
        CustomIconButton(
          icon: Icons.play_arrow,
          label: "Play",
          fontSize: 12,
        )
      ],
    );
  }
}