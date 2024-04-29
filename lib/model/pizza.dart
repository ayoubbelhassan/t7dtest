
import 'dart:convert';

Pizza pizzaFromJson(String str) => Pizza.fromJson(json.decode(str));

String pizzaToJson(Pizza data) => json.encode(data.toJson());

class Pizza {
  int id;
  String name;
  int price;
  String description;
  String img;

  Pizza({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.img,
  });

  factory Pizza.fromJson(Map<String, dynamic> json) => Pizza(
    id: json["id"],
    name: json["name"],
    price: json["price"],
    description: json["description"],
    img: json["img"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "description": description,
    "img": img,
  };
}
