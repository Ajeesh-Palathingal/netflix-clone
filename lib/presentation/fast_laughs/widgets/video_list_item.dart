import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_clone/core/colors/colors.dart';

class VideoListItem extends StatelessWidget {
  const VideoListItem({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // left side audio button
                CircleAvatar(
                    radius: 30,
                    backgroundColor: kBlackColor.withOpacity(0.5),
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.volume_off,
                          color: kWhiteColor,
                          size: 30,
                        )
                      )
                        
                    ),

                // right side option buttons
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        
                        radius: 30,
                        backgroundImage: NetworkImage("https://tse2.mm.bing.net/th?id=OIP.pBtvvAGh8Je5H5f4eKaIrQHaLB&pid=Api&P=0"),
                      ),
                    ),
                    VideoOptions(icon: Icons.emoji_emotions, title: "LOL"),
                    VideoOptions(icon: Icons.add, title: "My List"),
                    VideoOptions(icon: Icons.share, title: "Share"),
                    VideoOptions(icon: Icons.play_arrow, title: "Play"),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class VideoOptions extends StatelessWidget {
  const VideoOptions({Key? key, required this.icon, required this.title})
      : super(key: key);

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: kWhiteColor,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}
