import 'package:app_6/models/product.dart';
import 'package:app_6/pages/category_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CategoryTile extends StatelessWidget {
  final DocumentSnapshot snapshot;
  const CategoryTile({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.transparent,
        //snapshot é um valor do tipo map, logo em tem que ser convertido para um valor suportado pelo widget NetworkImagw
        backgroundImage: NetworkImage((snapshot as dynamic).data!()['icon']),
      ),
      title: Text(
        (snapshot as dynamic).data!()['title'],
      ),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CategoryPage(snapshot: snapshot)
        ));
      },
    );
  }
}
