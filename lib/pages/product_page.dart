import 'dart:html';

import 'package:app_6/models/items.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:infinite_carousel/infinite_carousel.dart';

class ProductPage extends StatefulWidget {
  final Itens item;
  const ProductPage({super.key, required this.item});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  //variáveis na qual se altera o estado devem ser criadas antes do método build
  String size = "";
  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.item.title.toString(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          //esse widget serve para fazer com que o widget filho fique proporcional a tela
           CarouselSlider(
                options: CarouselOptions(
                  initialPage: 2,
                  height: 500, 
                  autoPlay: true,
                  aspectRatio: 16/9,
                  //deixa a imagem principal maior
                  //enlargeCenterPage: true,
                  //controla o tipo de scrol
                  //scrollDirection: Axis.vertical
                  ),
                items: (widget.item.images! as List).map((image) {
                  return Image.network(image, fit: BoxFit.cover);
                }).toList(),
              ),
              //carrossel de imagens que mostra mais de uma imagem ao mesmo tempo
              /*InfiniteCarousel.builder(
                itemCount: 10,
                itemExtent: 120,
                center: true,
                anchor: 0.0,
                velocityFactor: 0.2,
                onIndexChanged: (index) {},
                axisDirection: Axis.horizontal,
                loop: true,
                itemBuilder: (context, itemIndex, realIndex) {
                  
                },
),*/
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  widget.item.title.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'R\$ ${(widget.item.price as double).toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: primaryColor,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Tamanho',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 34,
                  child: GridView(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 8,
                      childAspectRatio: 0.5,
                    ),
                    children: ((widget.item.sizes) as List).map((s) {
                      return GestureDetector(
                        onTap: (() {
                          setState(() {
                            size = s.toString();
                          });
                        }),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              border: Border.all(
                                color: s.toString() == size.toString()
                                    ? Colors.green
                                    : Colors.grey,
                                width: 3,
                              )),
                          width: 3,
                          alignment: Alignment.center,
                          child: Text(s),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 44,
                  child: ElevatedButton(
                      onPressed: () {}, child: Text('Clique Par Comprar')),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Descrição',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '${widget.item.description.toString()}',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
