class RoomClass {
  final int id;
  final String className;
  final double basePrice;
  final String bedType;
  final int numberOfBeds;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String imageUrl;

  RoomClass({
    required this.id,
    required this.className,
    required this.basePrice,
    required this.bedType,
    required this.numberOfBeds,
    required this.createdAt,
    required this.updatedAt,
    required this.imageUrl,
  });

  factory RoomClass.fromJson(Map<String, dynamic> json) {
    return RoomClass(
      id: json['id']??0,
      className: json['class_name']?? '',
      basePrice: json['base_price'].toDouble()??0.0,
      bedType: json['bed_type']??'',
      numberOfBeds: json['number_of_beds']??0,
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : DateTime.now(),
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : DateTime.now(),
      imageUrl: json['image_url'] ?? '',
    );
  }

  factory RoomClass.empty() {
    return RoomClass(
      id: 0,
      className: '',
      basePrice: 0.0,
      bedType: '',
      numberOfBeds: 0,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      imageUrl: '',
    );
  }
}