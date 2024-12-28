class HouseModels {
  String? name;
  int? price;
  String? description;
  String? tags;
  String? kamar;
  String? wc;
  bool? available;
  String? quantity; // Keeping quantity as String
  int? userId;
  String? updatedAt;
  String? createdAt;
  int? id;

  HouseModels(
      {this.name,
      this.price,
      this.description,
      this.tags,
      this.kamar,
      this.wc,
      this.available,
      this.quantity,
      this.userId,
      this.updatedAt,
      this.createdAt,
      this.id});

  HouseModels.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    description = json['description'];
    tags = json['tags'];
    kamar = json['kamar'];
    wc = json['wc'];
    available = json['available'] == 1;
    quantity = json['quantity']; // Direct assignment as String
    userId = json['user_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'tags': tags,
      'kamar': kamar.toString(),
      'wc': wc.toString(),
      'available': available == true ? 1 : 0,
      'quantity': quantity, // Keeping quantity as String
      'userId': userId,
      'created_at': createdAt.toString(), // Convert to string if needed
      'updated_at': updatedAt.toString(), // Convert to string if needed
    };
  }
}
