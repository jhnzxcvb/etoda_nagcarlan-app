
import 'package:flutter/material.dart';
import 'package:etoda_nagcarlan/main.dart';
import 'package:etoda_nagcarlan/widgets/branding_footer.dart';
import 'package:etoda_nagcarlan/screens/passenger_home.dart';

class DriverHomeScreen extends StatelessWidget {
  const DriverHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.logout, color: nagcarlanGreen),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, color: nagcarlanGreen),
            onPressed: () => Navigator.pushNamed(context, '/driver_profile'),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        decoration: nagcarlanGradient,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 80),
            const Text("eTODA", style: TextStyle(fontSize: 42, fontWeight: FontWeight.w900, color: nagcarlanGreen)),
            const Text("NAGCARLAN", style: TextStyle(fontSize: 16, letterSpacing: 3, fontWeight: FontWeight.bold, color: nagcarlanGreen)),
            const Text("Driver Mode", style: TextStyle(fontSize: 18, color: nagcarlanGreen)),
            const Spacer(),
            MenuCard(
              title: "MY PROFILE",
              subtitle: "Trips, vehicle info & earnings",
              icon: Icons.account_circle,
              color: nagcarlanGreen,
              textColor: Colors.white,
              onTap: () => Navigator.pushNamed(context, '/driver_profile'),
            ),
            const SizedBox(height: 20),
            MenuCard(
              title: "TRIP HISTORY",
              subtitle: "See your past rides",
              icon: Icons.list_alt,
              color: Colors.white,
              textColor: nagcarlanGreen,
              onTap: () {},
            ),
            const Spacer(),
            const BrandingFooter(),
          ],
        ),
      ),
    );
  }
}
