
import 'package:etoda_nagcarlan/screens/fare_matrix_screen.dart';
import 'package:etoda_nagcarlan/screens/passenger_edit_profile_screen.dart';
import 'package:etoda_nagcarlan/screens/passenger_trip_details_screen.dart';
import 'package:etoda_nagcarlan/screens/passenger_trip_history_screen.dart';
import 'package:etoda_nagcarlan/screens/trip_ended_screen.dart';
import 'package:etoda_nagcarlan/screens/trip_started_screen.dart';
import 'package:flutter/material.dart';
import 'package:etoda_nagcarlan/screens/landing_screen.dart';
import 'package:etoda_nagcarlan/screens/passenger_home.dart';
import 'package:etoda_nagcarlan/screens/driver_home.dart';
import 'package:etoda_nagcarlan/screens/driver_profile.dart';
import 'package:etoda_nagcarlan/screens/scan_qr_screen.dart';
import 'package:etoda_nagcarlan/screens/scanned_driver_profile_screen.dart';

// --- GLOBAL BRANDING & CONSTANTS ---
const Color nagcarlanGreen = Color(0xFF1B5E20);
const Color nagcarlanGold = Color(0xFFFFD700);

const nagcarlanGradient = BoxDecoration(
  gradient: LinearGradient(
    colors: [nagcarlanGold, Colors.white],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  ),
);

void main() {
  runApp(const EtodaApp());
}

// --- MAIN APP ENTRY ---
class EtodaApp extends StatelessWidget {
  const EtodaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'eTODA Nagcarlan',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: nagcarlanGreen),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: nagcarlanGreen,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      // Define Routes for easy navigation
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingScreen(),
        '/passenger_home': (context) => const PassengerHomeScreen(),
        '/driver_home': (context) => const DriverHomeScreen(),
        '/driver_profile': (context) => const DriverProfileScreen(),
        '/scan_qr': (context) => const ScanQRScreen(),
        '/driver_profile_scanned': (context) => const ScannedDriverProfileScreen(),
        '/trip_started': (context) => const TripStartedScreen(),
        '/trip_ended': (context) => const TripEndedScreen(),
        '/fare_matrix': (context) => const FareMatrixScreen(),
        '/passenger_edit_profile': (context) => const PassengerEditProfileScreen(),
        '/passenger_trip_history': (context) => const PassengerTripHistoryScreen(),
        '/passenger_trip_details': (context) => const PassengerTripDetailsScreen(),
      },
    );
  }
}
