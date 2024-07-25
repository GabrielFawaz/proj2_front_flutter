import '../rooms/roomclass.dart';

class Hotel {
  final String name;
  final String imageUrl;
  final String des;
  final double price;
  final int id;
  bool isLiked;
  int? reviews;
  double? rating; // Define rating property
  String floor;
  String status;
  String roomNumber;
  String view;
  RoomClass roomClass;


  Hotel({
    required this.name,
    required this.imageUrl,
    required this.des,
    this.reviews=0,
    required this.price,
    this.rating=0.0,
    this.isLiked=false,
    required this.id,
    required this.floor,
    required this.status,
    required this.roomNumber,
    required this.view,
    required this.roomClass,


  });


  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      name: json['name'] ,
      imageUrl: json['imageUrl'],
      des: json['des']?? '',
      reviews: json['reviews'] ?? 0,
      price: json['price'].toDouble()?? 0.0,
      rating: json['rating']?.toDouble() ?? 0.0, // Provide default value if null
      isLiked: json['isLiked'] ?? false,
      id: json['id'],
      floor: json['floor'] ?? '',
      status: json['status'] ?? '',
      roomNumber: json['room_number'] ?? '',
      view: json['view'] ?? '',
      roomClass: RoomClass.fromJson(json['room_class'] ?? {}),

    );
  }
}

