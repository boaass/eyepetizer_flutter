import 'package:eyepetizer/ui/shared/size_fit.dart';
import 'package:flutter/material.dart';


class ZCLSliderAppBar extends StatefulWidget {
  ZCLSliderAppBar({Key? key, @required this.pageController, @required this.appBarTitles, this.titleWidth = 120, this.titleItemWidth = 40}) : super(key: key);

  final PageController? pageController;
  final List<String>? appBarTitles;
  final double? titleWidth;
  final double? titleItemWidth;

  @override
  _ZCLSliderAppBarState createState() => _ZCLSliderAppBarState();
}

class _ZCLSliderAppBarState extends State<ZCLSliderAppBar> {
  late double _percent = (widget.pageController!.hasClients ? widget.pageController!.page!.toInt() : widget.pageController!.initialPage) / (widget.appBarTitles!.length - 1);

  @override
  void initState() {
    widget.pageController!.addListener(_updatePage);
    super.initState();
  }

  @override
  void dispose() {

    widget.pageController?.removeListener(_updatePage);

    super.dispose();
  }

  _updatePage() {
    final offset = widget.pageController?.offset;
    _percent = offset!/(ZCLSizeFit.screenWidth! * (widget.appBarTitles!.length-1));
    setState(() {
      if (_percent < 0) {
        _percent = 0;
      } else if (_percent > 1) {
        _percent = 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        width: widget.titleWidth!,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: widget.titleWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: _buildAppBarTitle(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: _percent*(widget.titleWidth!-widget.titleItemWidth!), top: 8),
                  child: Container(
                    width: widget.titleItemWidth! - 2,
                    height: 1,
                    color: Colors.black,
                  ),
                )
              ]
            ),
          ],
        )
      )
    );
  }

  _buildAppBarTitle() {
    return widget.appBarTitles!.asMap().keys.map<Widget>((index) => _buildAppBarTitleItem(widget.appBarTitles![index], (widget.pageController!.hasClients ? widget.pageController!.page!.toInt() : widget.pageController?.initialPage) == index, (){
      widget.pageController?.animateToPage(index, duration: Duration(milliseconds: 400), curve: Curves.linear);
    })).toList();
  }

  _buildAppBarTitleItem(String title, bool isSelected, Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: widget.titleItemWidth,
        child: Text(title, style: TextStyle(color: isSelected ? Colors.black : Colors.black54, fontSize:  widget.titleItemWidth!/2), textWidthBasis: TextWidthBasis.parent,)
      ),
    );
  }
}
