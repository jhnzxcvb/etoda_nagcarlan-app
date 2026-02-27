
import 'package:flutter/material.dart';
import 'package:etoda_nagcarlan/main.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: nagcarlanGradient,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "eTODA",
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w900,
                color: nagcarlanGreen,
              ),
            ),
            const Text(
              "NAGCARLAN",
              style: TextStyle(
                fontSize: 18,
                letterSpacing: 4,
                fontWeight: FontWeight.bold,
                color: nagcarlanGreen,
              ),
            ),
            const SizedBox(height: 60),
            Text("Continue as:", style: TextStyle(color: Colors.grey[700], fontSize: 16)),
            const SizedBox(height: 24),

            // Passenger Button
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: nagcarlanGreen,
                minimumSize: const Size(280, 60),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () => Navigator.pushNamed(context, '/passenger_home'),
              icon: const Icon(Icons.person, color: Colors.white),
              label: const Text("PASSENGER", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),

            const SizedBox(height: 16),

            // Driver Button
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: nagcarlanGreen, width: 2),
                minimumSize: const Size(280, 60),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () => Navigator.pushNamed(context, '/driver_home'),
              icon: const Icon(Icons.directions_car, color: nagcarlanGreen),
              label: const Text("DRIVER", style: TextStyle(color: nagcarlanGreen, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
