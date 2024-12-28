// models/house_image_model.dart

class HouseImageModel {
  final int id;
  final String url;
  final int houseId;

  HouseImageModel({
    required this.id,
    required this.url,
    required this.houseId,
  });

  factory HouseImageModel.fromJson(Map<String, dynamic> json) {
    return HouseImageModel(
      id: json['id'],
      url: json['url'],
      houseId: json['house_id'],
    );
  }
}