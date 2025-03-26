import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MiniSplashh extends StatelessWidget {
  MiniSplashh({
    super.key,
    this.color,
    required this.hero,
    required this.text,
    required this.D1,
    required this.D2,
    required this.D3,
    required this.onPressed,
  });

  String hero;
  Color? color = Colors.white;
  final VoidCallback onPressed;
  String text;
  bool D1 = false, D2 = false, D3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image
          Image.asset(
            hero,
            height: 400,
            width: 400,
            fit: BoxFit.cover,
          ),

          SizedBox(height: 20),

          // Text
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ),

          SizedBox(height: 20),

          // Dots Indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildDot(isActive: D1),
              _buildDot(isActive: D2),
              _buildDot(isActive: D3),
            ],
          ),

          SizedBox(height: 40),

          // Next Button
          ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(
              "Next",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Function to build a dot indicator
  Widget _buildDot({required bool isActive}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: isActive ? 20 : 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.yellow : Colors.grey.shade400,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
