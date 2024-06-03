import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:flutter_application_1/services/auth_services.dart';
import 'package:flutter_application_1/services/booking_services.dart';
import 'package:flutter_application_1/models/booking.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}) ;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
         StreamProvider<User?>.value(
      value: AuthService().user,
      initialData: null,
         ),
         StreamProvider<List<Booking>>.value(
          value: BookingService().getBookings(),
          initialData: const [],
         ),
      ],
      child: MaterialApp(
        title: 'Guest Room Booking',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
