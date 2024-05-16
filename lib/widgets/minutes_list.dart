import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
import 'package:flutter/material.dart';

class MinutesList extends StatelessWidget {
  MinutesList({super.key, required this.setMinutes});
  final _scrollController = FixedExtentScrollController();
  static const double _itemHeight = 40;
  static const int _itemCount = 100;
  void Function(int?) setMinutes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0),
      body: ClickableListWheelScrollView(
        scrollController: _scrollController,
        itemHeight: _itemHeight,
        itemCount: _itemCount,
        listHeight: 40,
        onItemTapCallback: setMinutes,
        child: ListWheelScrollView.useDelegate(
          controller: _scrollController,
          itemExtent: _itemHeight,
          physics: FixedExtentScrollPhysics(),
          overAndUnderCenterOpacity: 0.7,
          perspective: 0.002,
          useMagnifier: true,
          diameterRatio: 2,
          magnification: 1.1,
          squeeze: 1,
          childDelegate: ListWheelChildBuilderDelegate(
            builder: (context, index) => _child(index),
            childCount: _itemCount,
          ),
        ),
      ),
    );
  }

  Widget _child(index) {
    return Container(
      height: 400,
      width: 400,
      child: ListTile(
        title: Center(
            child: Text(
          index.toString() + 'm',
          style: const TextStyle(
              fontSize: 20, color: Colors.black54, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
