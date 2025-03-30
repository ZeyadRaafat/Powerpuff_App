import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MiniSplashh extends StatelessWidget {
  MiniSplashh({
    super.key,
    this.color = Colors.white, // Default value
    required this.buttext,
    required this.hero,
    required this.text,
    this.D1 = false,
    this.D2 = false,
    this.D3 = false,
    required this.onPressed,
  });

  final String hero;
  final String buttext;
  final Color color;
  final VoidCallback onPressed;
  final String text;
  final bool D1, D2, D3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            hero,
            height: 400,
            width: 400,
            fit: BoxFit.contain,
          ),

          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
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

          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildDot(isActive: D1),
              _buildDot(isActive: D2),
              _buildDot(isActive: D3),
            ],
          ),

          const SizedBox(height: 40),

          ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(
              buttext,
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

  Widget _buildDot({required bool isActive}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: isActive ? 20 : 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.yellow : Colors.grey.shade400,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
