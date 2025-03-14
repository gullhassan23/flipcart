import 'dart:convert';



class Product {
  final String? id;
  
  final String name;
  final String description;
  final double price;
  final double quantity;
  final String category;
  final List<String> images;

  Product(
      {this.id,
      
      required this.name,
      required this.description,
      required this.price,
      required this.quantity,
      required this.category,
      required this.images});



  Map<String, dynamic> toMap() {
    return {
      'id': id,
    
      'name': name,
      'description': description,
      'price': price,
      'quantity': quantity,
      'category': category,
      'images': images,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
     id: map['_id'],
    
     name: map['name'] ?? '',
    description: map['description'] ?? '',
     price: map['price']?.toDouble() ?? 0.0,
    quantity:  map['quantity']?.toDouble() ?? 0.0,
     category: map['category'] ?? '',
    images:  List<String>.from(map['images']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source));
}
