import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/widget/title.dart';

const image =
    "https://tse2.mm.bing.net/th?id=OIP.pBtvvAGh8Je5H5f4eKaIrQHaLB&pid=Api&P=0";

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: "Movies & TV"),
        kHeight,
        Expanded(
          child: GridView.count(
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1/1.5,
            children: 
              List.generate(20, (index) => SearchResultCard())
            
          ),
        )
      ],
    );
  }
}

class SearchResultCard extends StatelessWidget {
  const SearchResultCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: const DecorationImage(
        image: NetworkImage(image),
        
        fit: BoxFit.fill,
        
      ),
      borderRadius: BorderRadius.circular(5)
      ),
    );
  }
}
