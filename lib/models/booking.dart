class Booking {
  final String id;
  final String roomId;
  final String userId;
  final DateTime startDate;
  final DateTime endDate;
  final int status;

  Booking({
    required this.id,
    required this.roomId,
    required this.userId,
    required this.startDate,
    required this.endDate,
    this.status = 0, // Default status is 0 (not approved)
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'roomId': roomId,
      'userId': userId,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'status': status,
    };
  }

  factory Booking.fromMap(Map<String, dynamic> map) {
    return Booking(
      id: map['id'],
      roomId: map['roomId'],
      userId: map['userId'],
      startDate: DateTime.parse(map['startDate']),
      endDate: DateTime.parse(map['endDate']),
      status: map['status'],
    );
  }
}
