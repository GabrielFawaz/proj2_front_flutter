class Booking {
  final int id;
  final int userId;
  final int roomId;
  final String checkInDate;
  final String checkOutDate;
  final int numAdults;
  final int numChildren;
  final String paymentStatus;
  final String paymentMethod;

  Booking({
    required this.id,
    required this.userId,
    required this.roomId,
    required this.checkInDate,
    required this.checkOutDate,
    required this.numAdults,
    required this.numChildren,
    required this.paymentStatus,
    required this.paymentMethod,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'],
      userId: json['user_id'],
      roomId: json['room_id'],
      checkInDate: json['check_in_date'],
      checkOutDate: json['check_out_date'],
      numAdults: json['num_adults'],
      numChildren: json['num_children'],
      paymentStatus: json['payment_status'],
      paymentMethod: json['payment_method'],
    );
  }
}

