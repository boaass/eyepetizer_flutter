import 'package:eyepetizer/ui/pages/main/initiallize_items.dart';
import 'package:eyepetizer/ui/widgets/animation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:eyepetizer/core/extention/num_extention.dart';


class ZCLMainPage extends StatefulWidget {

  static const String routeName = "/";

  const ZCLMainPage ({Key? key}) : super(key: key);

  @override
  _ZCLMainPageState createState() => _ZCLMainPageState();
}

class _ZCLMainPageState extends State<ZCLMainPage> {

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("eyepetizer", style: Theme.of(context).textTheme.headline3,),
      // ),
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: _buildBottomAppBar()
    );
  }

  _buildBottomAppBar() {
    return BottomAppBar(
      child: Container(
        height: 70.px,
        padding: EdgeInsets.fromLTRB(5.px, 10.px, 5.px, 10.px),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildBottomAppBarItem(0, "首页", Icon(Icons.home_outlined, size: 30.px,)),
            _buildBottomAppBarItem(1, "社区", Icon(Icons.mode_comment_outlined, size: 30.px)),
            GestureDetector(
              onTap: () {
                // todo
              },
              child: Container(
                height: 40.px,
                width: 40.px,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20.px)
                ),
                child: Icon(Icons.add, color: Colors.white,)
              ),
            ),
            _buildBottomAppBarItem(2, "发现", Icon(Icons.search_outlined, size: 30.px)),
            _buildBottomAppBarItem(3, "我的", Icon(Icons.tag_faces_outlined, size: 30.px)),
          ],
        ),
      ),
    );
  }

  _buildBottomAppBarItem(int index, String title, Icon icon) {
    return GestureDetector(
        onTap: () {
          setState(() {
            _currentIndex = index;
          });
        },
        child: AnimationBarItem(
          duration: Duration(milliseconds: 600),
          text: Container(
            key: UniqueKey(),
            width: 70.px,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: Theme.of(context).textTheme.headline3),
                Icon(Icons.circle, size: 10.px,)
              ],
            ),
          ),
          icon: Container(
            width: 70.px,
            child: icon
          ),
          isSelected: _currentIndex == index,
        )
    );
  }
}
