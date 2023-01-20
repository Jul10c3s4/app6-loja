import 'package:app_6/models/items.dart';
import 'package:app_6/models/product.dart';
import 'package:app_6/tile/category_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProductsTab extends StatefulWidget {
  const ProductsTab({super.key});

  @override
  State<ProductsTab> createState() => _ProductsTabState();
}

class _ProductsTabState extends State<ProductsTab> {
  @override
  Widget build(BuildContext context) {
    /* Future<List<Product>> getproducts() async {
      var produtos =
          await FirebaseFirestore.instance.collection('products').get();

      /*var itens = await FirebaseFirestore.instance
          .collection('products')
          .doc('blusas')
          .collection('itens')
          .get();

      List<Itens> listaItens = [];
      for (var iten in itens.docs) {
        print('oi');
        Itens item = Itens.fromJson(iten.data());
        listaItens.add(item);
        print('tchau');
      }
      print(listaItens);
      print(listaItens[0]);
*/
      List<Product> products = [];
      for (var produto in produtos.docs) {
        Product product = Product.fromJson(produto.data());
        products.add(product);
      }
      return products;
    }*/

    return FutureBuilder(
        //Para Chamar o firebase usa-se o objeto FirebaseFirestore.instance.collection('<nome da collection>').get(), onde na collection
        //passa-se o nome da collection e caso queira um dado específico usa-se .doc('<id do documento>').get()
        future: FirebaseFirestore.instance.collection('products').get(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.lightGreen,
              ),
            );
          } else {
            var dividerTile = ListTile.divideTiles(
                    tiles: snapshot.data!.docs.map((doc) {
                      return CategoryTile(snapshot: doc);
                    }).toList(),
                    color: Colors.grey.shade700)
                .toList();
            return ListView(
              children: dividerTile,
            );
            /*return ListView.builder(
              //o docs indica que é uma lista
                itemCount: snapshot.data!.docs.length,
                itemBuilder: ((context, index) {
                  return Column(
                    children: [
                      CategoryTile(snapshot: (snapshot as dynamic).data()[index]),
                      Divider(
                        color: Colors.grey,
                      ),
                    ],
                  );
                }));*/
          }
        });
  }
}
