
import 'package:flutter/material.dart';
import 'package:etoda_nagcarlan/main.dart';
import 'package:etoda_nagcarlan/widgets/info_cards.dart';
import 'package:etoda_nagcarlan/widgets/branding_footer.dart';

class DriverProfileScreen extends StatelessWidget {
  const DriverProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Driver Profile")),
      body: Container(
        decoration: nagcarlanGradient,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
              const CircleAvatar(
                radius: 65,
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 70, color: Color(0xFFA5D6A7)),
              ),
              const SizedBox(height: 8),
              const Text(
                "JUAN A. DELA CRUZ",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: nagcarlanGreen),
              ),
              const Text(
                "ID: DRV-2026-0042",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(height: 24),
              InfoSectionCard(
                title: "Vehicle Info",
                icon: Icons.directions_car,
                items: const {
                  "Plate": "NA 12345",
                  "Body": "01",
                  "Model": "Kawasaki Barako 175",
                },
              ),
              const SizedBox(height: 12),
              InfoSectionCard(
                title: "Legal & License",
                icon: Icons.badge,
                items: const {
                  "Franchise #": "NVC-001A",
                  "License Exp.": "12/20/2028",
                },
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: nagcarlanGreen,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                  onPressed: () {},
                  child: const Text(
                    "START SHIFT",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const BrandingFooter(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
