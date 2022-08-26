import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';

import '../../widget/title.dart';

const String image =
    "https://tse3.mm.bing.net/th?id=OIP.dQqhbTIZRbyncab04A69JAHaFj&pid=Api&P=0";

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: "Top Searches",),
        kHeight,
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) => _TopSearchItemTile(),
              separatorBuilder: (context, index) => kHeight,
              itemCount: 20),
        )
      ],
    );
  }
}



class _TopSearchItemTile extends StatelessWidget {
  const _TopSearchItemTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      
      children: [
        Container(
          
          width: screenWidth * 0.35,
          height: screenWidth * 0.2,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image(
              fit: BoxFit.cover, 
              image: NetworkImage(image, )
            )),

        ),
        kWidth,
        Expanded(
          child: Text("Name of film",style: TextStyle(
            fontSize: 18  ,
            fontWeight: FontWeight.bold
          ),
          ),
        ),
        Icon(
          Icons.play_circle_outline_sharp,
          color: kWhiteColor,
          size: 50,
          
        )
        
      ],
    );
  }
}
