import 'package:flutter/cupertino.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/search/widget/search_idle.dart';
import 'package:netflix_clone/presentation/search/widget/search_result.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: const [
        CupertinoSearchTextField(
          prefixIcon: Icon(
            CupertinoIcons.search,
            color: kGreyColor,
          ),
          suffixIcon: Icon(
            CupertinoIcons.xmark_circle_fill,
            color: kGreyColor,
          ),
          style: TextStyle(color: kWhiteColor, fontSize: 16),
        ),
        kHeight,
        Expanded(child: SearchIdleWidget())
      ],
    );
  }
}
