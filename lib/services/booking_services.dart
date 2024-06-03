import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/models/booking.dart';

class BookingService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<Booking>> getBookings() {
    return _firestore.collection('bookings').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data as Map<String, dynamic>;
        return Booking.fromMap(data);
      }).toList();
    });
  }
}
