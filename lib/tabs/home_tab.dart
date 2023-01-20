import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    //Esse widget foi criado com o intuito de ter um gradiente de cor de fundo, na qual é usado como primeiro filho no widget stack para que os widget seguintes tenham um gradinete.
    Widget BuildBodyBack() {
      return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.green, Colors.lightGreenAccent],
                begin: Alignment.topLeft,
                end: Alignment.topRight)),
      );
    }

    return Stack(
      children: [
        BuildBodyBack(),
        //ela tem uma animação diferente do ListView
        CustomScrollView(
          //é onde os widgets devem ser inseridos.
          slivers: [
            SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.orange,
              elevation: 0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  'Novidades',
                ),
                centerTitle: true,
              ),
            ),
            FutureBuilder<QuerySnapshot>(
                //caso queira um dado específico usa-se após o nome da da collection o .doc("<id da colection>").get()
                future: FirebaseFirestore.instance.collection('home').get(),
                builder: ((context, snapshot) {
                  if (snapshot.hasError) {
                    return SnackBar(
                      content: Text('Erro ao carregar dados: ' +
                          snapshot.error.toString()),
                      duration: Duration(seconds: 8),
                    );
                  } else if (snapshot.hasData) {
                    return SliverGrid.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 1,
                      crossAxisSpacing: 1,
                      //o children não sabe quanto filhos terá então nesse caso o children retorna uma função
                      //que retorna várias documentos, docs, que retorna várias imagens uma embaixo da outra
                      children: snapshot.data!.docs.map((doc) {
                        return Image.network(
                          (doc as dynamic).data()['image'],
                          fit: BoxFit.cover,
                        );
                      }).toList(),
                    );
                  }
                  return SliverToBoxAdapter(
                    child: Container(
                      height: 500,
                      child: Center(
                        child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.orange.shade300),
                      ),) 
                    ),
                  );
                }))
          ],
        )
      ],
    );
  }
}
