import 'dart:html';

import 'package:app_6/models/items.dart';
import 'package:app_6/pages/product_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProductTile extends StatelessWidget {
  final String type;
  final Itens item;

  const ProductTile({super.key, required this.type, required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        Navigator.of(context).push(MaterialPageRoute(
            builder: ((context) => ProductPage(item: item))));
      }),
      child: Card(
        child: type == "grid"
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 0.8,
                    child: Image.network(
                      item.images![0].toString(),
                      /*(snapshot as dynamic).data!()['images'][0]*/
                      fit: BoxFit.fill,
                    ),
                  ),
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Text(
                          item.title.toString(),
                          /*(snapshot as dynamic).data()['title'].toString()*/
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          'R\$ ${(item.price as double).toStringAsFixed(2) /*((snapshot as dynamic).data()['price']as double).toStringAsFixed(2)*/}',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ))
                ],
              )
            : Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Image.network(
                      item.images![0]
                          .toString() /*(snapshot as dynamic).data()['images'][0]*/,
                    ),
                  ),
                  Flexible(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.title
                                  .toString(), /*(snapshot as dynamic).data()['title'].toString()*/
                            )
                          ],
                        ),
                      ))
                ],
              ),
      ),
    );
  }
}
