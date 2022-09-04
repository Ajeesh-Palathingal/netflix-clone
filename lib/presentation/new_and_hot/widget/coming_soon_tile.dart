import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/presentation/new_and_hot/widget/new_and_hot_film_list_item.dart';
import 'package:netflix_clone/presentation/widget/custom_icon_button.dart';

import '../../../core/constants.dart';

class ComingSoonTile extends StatelessWidget {
  const ComingSoonTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            width: 50,
            child: Column(
              children: const [
                Text(
                  "FEB",
                  style: TextStyle(fontSize: 15, color: kGreyColor),
                ),
                Text(
                  "11",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )
              ],
            )),
        const Expanded(
          child: NewAndHotFilmListItem(
            filmTitle: "Spider Man", 
            iconButtons: ComingSoonIconButtons(),
            comingOn: Text(
          "Coming on Friday",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
          ),
            
        )
      ],
    );
  }
}






class ComingSoonIconButtons extends StatelessWidget {
  const ComingSoonIconButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIconButton(
          icon: Icons.add_alert,
          label: "Remind Me",
          fontSize: 12,
        ),
        CustomIconButton(
          icon: Icons.info_outline,
          label: "Info",
          fontSize: 12,
        ),
        
      ],
    );
  }
}
