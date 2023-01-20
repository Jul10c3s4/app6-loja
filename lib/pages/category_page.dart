import 'package:app_6/models/items.dart';
import 'package:app_6/models/product.dart';
import 'package:app_6/tile/product_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CategoryPage extends StatefulWidget {
  final DocumentSnapshot snapshot;
  const CategoryPage({super.key, required this.snapshot});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  void initState() {
    super.initState();
    getItens();
  }

  @override
  Widget build(BuildContext context) {
    // List<Itens> item = widget.product.itens!;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            // title: Text((widget.product.title.toString())),
            title: Text((widget.snapshot as dynamic).data()['title']),
            centerTitle: true,
            bottom: TabBar(
              indicatorColor: Colors.grey,
              tabs: [
                Tab(
                  icon: Icon(Icons.grid_on_outlined),
                ),
                Tab(
                  icon: Icon(Icons.list),
                )
              ],
            ),
          ),
          body: FutureBuilder(
              future: getItens()/*FirebaseFirestore.instance
                  .collection('products')
                  .doc(widget.snapshot.id)
                  .collection('itens')
                  .get()*/,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Container(
                      height: 500,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.green,
                        ),
                      ));
                } else {
                  return TabBarView(
                    children: [
                      GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 2,
                          crossAxisSpacing: 2,
                          //serve para multiplicar todos os widget filho por um valor a fim de definir um tamanho
                          childAspectRatio: 0.65,
                        ),
                        //docs indica que é uma lista
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          //List<Itens> list = snapshot.data!.toList();
                          return ProductTile(
                              type: "grid",
                              item: snapshot.data![index]);
                        },
                      ),
                      ListView.builder(
                          padding: EdgeInsets.all(4),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return ProductTile(
                                type: "list",
                                item: snapshot.data![index]);
                          })
                    ],
                  );
                }
              })),
    );
  }

  Future<List<Itens>> getItens() async {
    var listaFirebase = await FirebaseFirestore.instance
        .collection('products')
        .doc(widget.snapshot.id)
        .collection('itens')
        .get();

    print(listaFirebase.docs);
    List<Itens> listaItens = [];
    for (var iten in listaFirebase.docs) {
      Itens item = Itens.fromJson(iten.data!());
      listaItens.add(item);
    }
     return listaItens;
  }
}
