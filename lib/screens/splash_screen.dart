// lib/screens/splash_screen.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F1EC),
      body: Stack(
        children: [
          _buildAbstractBackground(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTapDown: (_) => setState(() => _isTapped = true),
                          onTapUp: (_) {
                            setState(() => _isTapped = false);
                            Navigator.pushReplacementNamed(context, '/login');
                          },
                          onTapCancel: () => setState(() => _isTapped = false),
                          child: AnimatedDefaultTextStyle(
                            duration: const Duration(milliseconds: 200),
                            style: GoogleFonts.getFont(
                              'Abril Fatface',
                              fontSize: 80,
                              letterSpacing: -3,
                              height: 0.85,
                              color: _isTapped
                                  ? const Color(0xFF5C9CE6)
                                  : const Color(0xFF062355),
                            ),
                            child: const Text('HUNAR'),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Your Job, Our Hunar',
                          style: GoogleFonts.getFont(
                            'Abril Fatface',
                            fontSize: 20,
                            color: const Color(0xFF78350F),
                            letterSpacing: 1.8,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 60,
                    right: 16,
                    child: Text(
                      'IBAD\nPREET\nSAKINA',
                      textAlign: TextAlign.right,
                      style: GoogleFonts.getFont(
                        'Abril Fatface',
                        fontSize: 36,
                        height: 0.9,
                        color: const Color(0xFF78350F),
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAbstractBackground() {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.center,
              radius: 1.2,
              colors: [Color(0xFFF4F1EC), Color(0xFFE8E0D8)],
            ),
          ),
        ),
        _blob(top: -120, left: -100, size: 380, color: const Color(0x448A6FF0), blur: 100),
        _blob(top: -80, right: -120, size: 320, color: const Color(0x444A90E2), blur: 90),
        _blob(bottom: -140, left: -80, size: 400, color: const Color(0x4478350F), blur: 110),
        _blob(top: 200, right: -100, size: 280, color: const Color(0x33F4F1EC), blur: 80),
        _blob(top: 300, left: -60, size: 240, color: const Color(0x3380B7FF), blur: 70),
        _blob(bottom: 100, right: -60, size: 300, color: const Color(0x3378350F), blur: 85),
      ],
    );
  }

  Widget _blob({double? top, double? bottom, double? left, double? right, required double size, required Color color, required double blur}) {
    return Positioned(
      top: top, bottom: bottom, left: left, right: right,
      child: Container(
        width: size, height: size,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          boxShadow: [BoxShadow(color: color.withOpacity(0.4), blurRadius: blur, spreadRadius: blur / 2)],
        ),
      ),
    );
  }
}