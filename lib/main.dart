
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Added HTTP package

// Screen Imports
import 'package:etoda_nagcarlan/screens/fare_matrix_screen.dart';
import 'package:etoda_nagcarlan/screens/passenger_edit_profile_screen.dart';
import 'package:etoda_nagcarlan/screens/passenger_trip_details_screen.dart';
import 'package:etoda_nagcarlan/screens/passenger_trip_history_screen.dart';
import 'package:etoda_nagcarlan/screens/trip_ended_screen.dart';
import 'package:etoda_nagcarlan/screens/trip_started_screen.dart';
import 'package:etoda_nagcarlan/screens/landing_screen.dart';
import 'package:etoda_nagcarlan/screens/passenger_home.dart';
import 'package:etoda_nagcarlan/screens/driver_home.dart';
import 'package:etoda_nagcarlan/screens/driver_profile.dart';
import 'package:etoda_nagcarlan/screens/driver_edit_profile_screen.dart';
import 'package:etoda_nagcarlan/screens/scan_qr_screen.dart';
import 'package:etoda_nagcarlan/screens/scanned_driver_profile_screen.dart';
import 'package:etoda_nagcarlan/screens/login_screen.dart';
import 'package:etoda_nagcarlan/screens/signup_screen.dart';
import 'package:etoda_nagcarlan/screens/forgot_password_screen.dart';

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

// --- CONNECTION TEST FUNCTION ---
// This will print the status to your Debug Console in Android Studio
Future<void> testConnection() async {
  try {
    // 10.0.2.2 is the alias for your computer's localhost in the Android Emulator
    final response = await http.get(Uri.parse('http://10.0.2.2:8080/driver'));

    if (response.statusCode == 200) {
      debugPrint("✅ SUCCESS: Connected to Go Backend!");
      debugPrint("Data from Database: \${response.body}");
    } else {
      debugPrint("❌ ERROR: Server responded with \${response.statusCode}");
    }
  } catch (e) {
    debugPrint("❌ CONNECTION FAILED: \$e");
    debugPrint("💡 Tip: Ensure your Go server is running and you're using the Android Emulator.");
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Trigger the test connection right when the app starts
  testConnection();

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
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/passenger_home': (context) => const PassengerHomeScreen(),
        '/driver_home': (context) => const DriverHomeScreen(),
        '/driver_profile': (context) => const DriverProfileScreen(),
        '/driver_edit_profile': (context) => const DriverEditProfileScreen(),
        '/scan_qr': (context) => const ScanQRScreen(),
        '/driver_profile_scanned': (context) => const ScannedDriverProfileScreen(),
        '/trip_started': (context) => const TripStartedScreen(),
        '/trip_ended': (context) => const TripEndedScreen(),
        '/fare_matrix': (context) => const FareMatrixScreen(),
        '/passenger_edit_profile': (context) => const PassengerEditProfileScreen(),
        '/passenger_trip_history': (context) => const PassengerTripHistoryScreen(),
        '/passenger_trip_details': (context) => const PassengerTripDetailsScreen(),
        '/forgot_password': (context) => const ForgotPasswordScreen(),
      },
    );
  }
}
