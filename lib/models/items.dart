import 'dart:js_util';
import 'package:js/js.dart';

class Itens {
  String? description;
  List<String>? images;
  double? price;
  List<String>? sizes;
  String? title;

  Itens(
      {required this.description,
      required this.images,
      required this.price,
      required this.sizes,
      required this.title});

  Itens.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    images = json['images'].cast<String>();
    price = json['price'];
    sizes = json['sizes'].cast<String>();
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['images'] = this.images;
    data['price'] = this.price;
    data['sizes'] = this.sizes;
    data['title'] = this.title;
    return data;
  }

  /*Map<String, dynamic> toJsonList() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['images'] = this.images;
    return data;
  }*/
}
