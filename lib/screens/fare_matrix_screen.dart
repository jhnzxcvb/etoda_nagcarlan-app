
import 'package:flutter/material.dart';
import 'package:etoda_nagcarlan/main.dart';

class FareMatrixScreen extends StatefulWidget {
  const FareMatrixScreen({super.key});

  @override
  State<FareMatrixScreen> createState() => _FareMatrixScreenState();
}

class _FareMatrixScreenState extends State<FareMatrixScreen> {
  final List<String> locations = ["Select Location", "Poblacion", "Talangan", "Oobi", "Malinao"];
  final List<String> passengerTypes = ["Normal", "Senior", "PWD", "Student"];
  final List<String> tripTypes = ["Regular", "Special Trip"];

  String fromLocation = "Select Location";
  String toLocation = "Select Location";
  String passengerType = "Normal";
  String tripType = "Regular";
  String fare = "₱0.00";

  @override
  void initState() {
    super.initState();
    // Set initial values
    fromLocation = locations.first;
    toLocation = locations.first;
    passengerType = passengerTypes.first;
    tripType = tripTypes.first;
  }

  void _calculateFare() {
    if (fromLocation == "Select Location" || toLocation == "Select Location") {
      setState(() => fare = "₱0.00");
      return;
    }

    double baseFare = (tripType == "Special Trip") ? 50.0 : 30.0;
    if (passengerType != "Normal") {
      baseFare *= 0.80; // 20% discount
    }
    setState(() => fare = "₱${baseFare.toStringAsFixed(2)}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fare Calculator"),
        backgroundColor: nagcarlanGreen,
        foregroundColor: Colors.white,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: nagcarlanGradient,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Plan Your Trip",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: nagcarlanGreen,
                ),
              ),
              Text(
                "Select your route and passenger type to see the estimated fare.",
                style: TextStyle(color: Colors.grey[700]),
              ),
              const SizedBox(height: 24),

              _buildSectionCard(
                icon: Icons.map,
                title: "Route",
                children: [
                  _buildDropdown("From", locations, fromLocation, (val) {
                    setState(() => fromLocation = val!);_calculateFare();
                  }),
                  const SizedBox(height: 16),
                  _buildDropdown("To", locations, toLocation, (val) {
                    setState(() => toLocation = val!);_calculateFare();
                  }),
                ],
              ),
              const SizedBox(height: 20),

              _buildSectionCard(
                icon: Icons.person_outline,
                title: "Details",
                children: [
                  _buildDropdown("Passenger Type", passengerTypes, passengerType, (val) {
                    setState(() => passengerType = val!);_calculateFare();
                  }),
                  const SizedBox(height: 16),
                  _buildDropdown("Trip Type", tripTypes, tripType, (val) {
                    setState(() => tripType = val!);_calculateFare();
                  }),
                ],
              ),
              const SizedBox(height: 30),

              // Total Fare Display
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: nagcarlanGreen,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    )
                  ]
                ),
                child: Column(
                  children: [
                    Text("ESTIMATED FARE", style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 14, letterSpacing: 1)),
                    const SizedBox(height: 8),
                    Text(
                      fare,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (passengerType != "Normal") ...[
                        const SizedBox(height: 8),
                        Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                                color: nagcarlanGold.withOpacity(0.9),
                                borderRadius: BorderRadius.circular(8)
                            ),
                            child: const Text("20% Discount Applied", style: TextStyle(color: nagcarlanGreen, fontWeight: FontWeight.bold, fontSize: 12))
                        )
                    ]
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionCard({required IconData icon, required String title, required List<Widget> children}) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: nagcarlanGreen),
                const SizedBox(width: 8),
                Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: nagcarlanGreen)),
              ],
            ),
            const Divider(height: 24),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, List<String> items, String selectedValue, ValueChanged<String?> onChanged) {
    return DropdownButtonFormField<String>(
      value: selectedValue,
      items: items.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Colors.grey[50],
      ),
    );
  }
}
