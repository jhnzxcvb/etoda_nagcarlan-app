
import 'package:flutter/material.dart';
import 'package:etoda_nagcarlan/main.dart';
import 'package:etoda_nagcarlan/widgets/branding_footer.dart';

class PassengerEditProfileScreen extends StatelessWidget {
  const PassengerEditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: nagcarlanGradient,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
                child: Column(
                  children: [
                    // --- Profile Avatar ---
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        const CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.person_outline_rounded, size: 70, color: Color(0xFFA5D6A7)),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: nagcarlanGreen,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(6.0),
                            child: Icon(Icons.camera_alt, color: Colors.white, size: 20),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 32),

                    // --- Profile Fields (Labels Outside) ---
                    _buildTextFieldWithOutsideLabel(label: "Full Name", initialValue: "Maria C. Reyes", icon: Icons.person_outline),
                    const SizedBox(height: 20),
                    _buildTextFieldWithOutsideLabel(label: "Contact Number", initialValue: "0912-345-6789", icon: Icons.phone_outlined),
                    const Divider(height: 48, thickness: 0.5),

                    // --- Edit Password Section (Labels Inside) ---
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "EDIT PASSWORD",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700],
                            fontSize: 12,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'New Password',
                            prefixIcon: const Icon(Icons.lock_outline, color: nagcarlanGreen),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.9),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Confirm New Password',
                            prefixIcon: const Icon(Icons.lock_reset, color: nagcarlanGreen),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.9),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),

                    // --- Save Button ---
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.save_alt_rounded),
                        onPressed: () {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text("Profile updated successfully!"),
                              backgroundColor: Colors.green[600],
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: nagcarlanGreen,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        label: const Text("SAVE CHANGES", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: BrandingFooter(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFieldWithOutsideLabel({required String label, String? initialValue, bool obscureText = false, required IconData icon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey[700],
            fontSize: 12,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          initialValue: initialValue,
          obscureText: obscureText,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: nagcarlanGreen),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            filled: true,
            isDense: true,
            fillColor: Colors.white.withOpacity(0.9),
            contentPadding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 12.0),
          ),
        ),
      ],
    );
  }
}
