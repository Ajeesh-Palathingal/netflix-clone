import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';

class NewAndHotFilmListItem extends StatelessWidget {
  const NewAndHotFilmListItem({
    Key? key,
    this.imageHeight = 0.45,
    required this.filmTitle,
    required this.iconButtons,
    this.comingOn = const SizedBox()
  }) : super(key: key);

  final double imageHeight;
  final String filmTitle;
  final Widget iconButtons;
  final Widget comingOn;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            SizedBox(
              height: screenWidth * imageHeight,
              child: Image(image: NetworkImage("https://tse2.mm.bing.net/th?id=OIP.r4FrmHWVyG5t7jsSbMj1igHaEK&pid=Api&P=0"),),
              // width: screenWidth - 60,
              
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: CircleAvatar(
                  radius: 20,
                  backgroundColor: kBlackColor.withOpacity(0.5),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.volume_off,
                        color: kWhiteColor,
                        size: 20,
                      ))),
            ),
          ],
        ),
        kHeight,
        Row(
          children: [
            Text(
              filmTitle,
              style: TextStyle(fontSize: 30),
              // overflow: TextOverflow.ellipsis,
            ),
            Spacer(),
            iconButtons,
          ],
        ),
        comingOn,
        
        kHeight,
        Row(
          children: [
            SizedBox(
              height: 22,
              width: 22,
              child: Image(image: AssetImage("lib/core/assets/logo.jpg")),
            ),
            Text(
              "FILM",
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            )
          ],
        ),
        Text(
          filmTitle,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        kHeight,
        Text(
          "Jksdjfh  ur fdskjfs df uyhrewuhf sjsh kjsdfhw urfh sdjhf swp jfnlknv sdifowi ujf;alskdndfsjdfhoweiuh  df f.  hrewoir sdsf skfh sdrifweo iurds.",
          style: TextStyle(color: kGreyColor),
        ),
        kHeight
      ],
    );
  }
  
}