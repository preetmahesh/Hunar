// lib/screens/signup_screen.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _cnicController = TextEditingController();
  int _accountType = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F1EC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF062355),
        toolbarHeight: 90,
        title: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              child: Image.asset('assets/logo.png', width: 42),
            ),
            const SizedBox(width: 14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('HUNAR', style: GoogleFonts.getFont('Abril Fatface', fontSize: 30, color: Colors.white)),
                const Text('Your Job, Our Hunar', style: TextStyle(fontSize: 13, color: Colors.white70)),
              ],
            ),
          ],
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),

                Text(
                  'Create Your Account',
                  style: GoogleFonts.getFont(
                    'Abril Fatface',
                    fontSize: 36,
                    color: const Color(0xFF78350F),
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 40),

                _buildTextField(controller: _nameController, hint: 'Enter your full name', icon: Icons.person_outline),
                const SizedBox(height: 20),
                _buildTextField(controller: _emailController, hint: 'Enter your email', icon: Icons.mail_outline, keyboardType: TextInputType.emailAddress),
                const SizedBox(height: 20),
                _buildTextField(controller: _phoneController, hint: '0123 123456', icon: Icons.phone_outlined, keyboardType: TextInputType.phone),
                const SizedBox(height: 20),
                _buildTextField(controller: _passwordController, hint: '••••••••', icon: Icons.lock_outline, isPassword: true),
                const SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.people, size: 22, color: Color(0xFF78350F)),
                    const SizedBox(width: 10),
                    Text('Account Type', style: TextStyle(color: Color(0xFF78350F), fontSize: 17)),
                  ],
                ),
                const SizedBox(height: 16),
                ToggleButtons(
                  borderRadius: BorderRadius.circular(30),
                  selectedColor: Colors.white,
                  fillColor: const Color(0xFF78350F),
                  color: const Color(0xFF78350F),
                  constraints: const BoxConstraints(minHeight: 48, minWidth: 130),
                  isSelected: [_accountType == 0, _accountType == 1],
                  onPressed: (i) => setState(() => _accountType = i),
                  children: const [
                    Padding(padding: EdgeInsets.symmetric(horizontal: 24), child: Text('User', style: TextStyle(fontSize: 16))),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 24), child: Text('Service Provider', style: TextStyle(fontSize: 16))),
                  ],
                ),
                const SizedBox(height: 30),

                _buildTextField(controller: _cnicController, hint: 'Enter your CNIC number', icon: Icons.credit_card),
                const SizedBox(height: 50),

                SizedBox(
                  width: double.infinity,
                  height: 58,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF78350F),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                    child: const Text('Sign Up', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                ),
                const SizedBox(height: 36),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account? ', style: TextStyle(color: Colors.black54, fontSize: 16)),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Text('Log in', style: TextStyle(color: Color(0xFF062355), fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                  ],
                ),
                const SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool isPassword = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: keyboardType,
      style: const TextStyle(color: Color(0xFF78350F), fontSize: 16),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Color(0xFFAAA29D)),
        prefixIcon: Icon(icon, color: const Color(0xFF78350F)),
        filled: true,
        fillColor: const Color(0xFFF5F0E6),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
        contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      ),
    );
  }
}