import 'package:app_6/constants.dart';
import 'package:app_6/tabs/home_tab.dart';
import 'package:app_6/tabs/products_tab.dart';
import 'package:app_6/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool cor = false;

  @override
  Widget build(BuildContext context) {
    final PageController _pageController = PageController();
    Constants consta = Constants();

    return PageView(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        //usar o scafold aqui faz com que todas as homepages possuam o scafold
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(
            pageController: _pageController,
          ),
        ),

        Scaffold(
          appBar: AppBar(
            title: Text("Produtos"),
            centerTitle: true,
            actions: [
              Switch(
                  value: cor,
                  onChanged: ((value) {
                      cor = value;
                      if (value == true) {
                        setState(() {
                          consta.setCorAppBar = Colors.pink;
                        });
                        
                      }
                  }))
            ],
          ),
          body: ProductsTab(),
          drawer: CustomDrawer(
            pageController: _pageController,
          ),
        )
      ],
    );
  }
}
