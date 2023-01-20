  import 'package:app_6/models/items.dart';

class Product {
  String? icon;
  String? title;
  List<Itens>? itens;

  Product({required this.icon, required this.title, required this.itens});

  Product.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    title = json['title'];
    if (json['itens'] != null) {
      List<Itens> itens = [];
      json['itens'].forEach((item) {
        itens.add(Itens.fromJson(item));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['title'] = this.title;
    if (this.itens != null) {
      data['itens'] = this.itens!.map((item) => item.toJson()).toList();
    }
    return data;
  }
}
