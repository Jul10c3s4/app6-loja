import 'package:app_6/tile/drawer_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomDrawer extends StatefulWidget {
  final PageController pageController;
  const CustomDrawer({super.key, required this.pageController});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    Widget buildDrawerBack() {
      return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlue, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          )
        ),
      );
    }

    return Stack(
      children: [
        buildDrawerBack(),
        ListView(
          padding: EdgeInsets.only(left: 32, top: 16),
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 8),
              padding: EdgeInsets.fromLTRB(0, 16, 16, 8),
              height: 170,
              child: Stack(
                children: [
                  Positioned(
                    top: 8,
                    left: 0,
                    child: Text("Loja\nFlutter",
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold
                    ),)),
                    Positioned(
                      left: 0,
                      bottom: 0,
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('olá', style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600,
                          ),),
                          GestureDetector(
                            child: Text(
                              'Entre ou Cadastre-se',
                              style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          )
                        ],
                      ))
                ],
              ),
            ),
            const Divider(),
            DrawerTile(icon: Icons.home,text: "Início", pageController: widget.pageController, page: 0),
            DrawerTile(icon: Icons.list, text: "Produtos", pageController: widget.pageController, page: 1)
          ],
        )
      ],
    );
  }
}
