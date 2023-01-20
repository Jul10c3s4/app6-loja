import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DrawerTile extends StatefulWidget {
  final IconData icon;
  final String text;
  final PageController pageController;
  final int page;

  const DrawerTile(
      {super.key,
      required this.icon,
      required this.text,
      required this.pageController,
      required this.page});

  @override
  State<DrawerTile> createState() => _DrawerTileState();
}

class _DrawerTileState extends State<DrawerTile> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop();
          widget.pageController.jumpToPage(widget.page);
        },
        child: SizedBox(
          height: 60,
          child: Row(
            children: [
              Icon(widget.icon, size: 32, color: widget.pageController == widget.page.round() ? Theme.of(context).primaryColor:Colors.grey.shade700,)
            ],
          ),
        ),
      ),
      
    );
  }
}
