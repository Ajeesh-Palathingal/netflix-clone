import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/downloads/widgets/downloads_image_card.dart';

import 'package:netflix_clone/presentation/widget/app_bar_widget.dart';
import 'package:netflix_clone/presentation/widget/main_image_card.dart';
import 'package:netflix_clone/presentation/widget/title.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({Key? key}) : super(key: key);

  List _listOfSections = [
    _SmartDownloadsSection(),
    _CenterSection(),
    _BottomButtonsSection()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:const PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: AppBarWidget(mainWidget: Text("Downloads",        
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
        ),)),
        body: ListView.separated(
            padding:const EdgeInsets.all(10),
            itemBuilder: (context, index) => _listOfSections[index],
            separatorBuilder: (context, index) =>const SizedBox(
                  height: 20,
                ),
            itemCount: _listOfSections.length));
  }
}

class _SmartDownloadsSection extends StatelessWidget {
  const _SmartDownloadsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        kWidth,
        Icon(
          Icons.settings,
          color: kWhiteColor,
        ),
        kWidth,
        Text(
          "Smart Downloads",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class _CenterSection extends StatelessWidget {
  _CenterSection({Key? key}) : super(key: key);

  final images = [
    "https://tse2.mm.bing.net/th?id=OIP.pBtvvAGh8Je5H5f4eKaIrQHaLB&pid=Api&P=0",
    "https://tse4.mm.bing.net/th?id=OIP.zp-KPweosXIUdpjMxBDbqgHaKr&pid=Api&P=0",
    "https://tse4.mm.bing.net/th?id=OIP.5nZeYDeMoTY3t6vcB5RQywHaKX&pid=Api&P=0"
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        const MainTitle(
          title: "Introducing Downloads for you"
        ),
        kHeight,
        const Text(
          "We'll download a personalised selection of\nmovies and shows for you, so there's\nalways something to watch on your\ndevice.",
          style: TextStyle(fontSize: 16, color: kGreyColor),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: screenSize.width * 0.8,
          width: screenSize.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                backgroundColor: kGreyColor.withOpacity(.3),
                radius: screenSize.width * 0.30,
              ),
              DownloadsImageCard(
                height: 0.4,
                width: 0.3,
                angle: -18,
                margin: EdgeInsets.only(
                  right: screenSize.width * 0.38,
                  top: screenSize.width * 0.1,
                ),
                image: images[0],
              ),
              DownloadsImageCard(
                height: 0.4,
                width: 0.3,
                angle: 18,
                margin: EdgeInsets.only(
                  left: screenSize.width * 0.38,
                  top: screenSize.width * 0.1,
                ),
                image: images[1],
              ),
              DownloadsImageCard(
                height: 0.46,
                width: 0.32,
                margin: EdgeInsets.only(
                  top: screenSize.width * 0.05,
                ),
                image: images[2],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _BottomButtonsSection extends StatelessWidget {
  const _BottomButtonsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          width: screenSize.width * 0.85,
          height: 40,
          child: MaterialButton(
            color: kButtonColorBlue,
            onPressed: () {},
            child: const Text(
              "Set Up",
              style: TextStyle(
                  color: kWhiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ),
        ),
        kHeight,
        SizedBox(
          height: 40,
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            color: kButtonColorWhite,
            onPressed: () {},
            child: const Text(
              "See What You Can Download",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
        )
      ],
    );
  }
}
