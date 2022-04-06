import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  const Tile({
    this.child,
    required this.index,
    this.isFlagged = false,
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final int index;
  final bool isFlagged;
  final void Function() onTap;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    // String flagImage =
    //     'https://cdn-icons-png.flaticon.com/512/2164/2164733.png';

    return InkWell(
      onTap: onTap,
      child: Container(
        child: child,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Color(0xff808080), width: 5.0),
            right: BorderSide(color: Color(0xff808080), width: 5.0),
            top: BorderSide(color: Colors.white, width: 5.0),
            left: BorderSide(color: Colors.white, width: 5.0),
          ),
          color: Color(0xffC6C6C6),
        ),
      ),
    );
  }
}
