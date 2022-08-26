import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/video_list_item.dart';

class ScreenFastLaughs extends StatelessWidget {
  const ScreenFastLaughs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          scrollDirection: Axis.vertical,
          children: List.generate(10, (index) {
              return VideoListItem(index: index);
            })
            
          
        ),
      ),
    );
  }
}
