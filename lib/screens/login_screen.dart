import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _autoFillLogin() {
    _emailController.text = "user@example.com";
    _passwordController.text = "password123";
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF000000), Color(0xFF434343)], // Latar belakang dengan gradasi hitam
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 50),
                // Ikon atau Ilustrasi
                const Icon(
                  Icons.lock_outlined,
                  size: 100,
                  color: Colors.white, // Warna ikon menjadi putih untuk kontras
                ),
                const SizedBox(height: 30),
                // Welcome Text
                const Text(
                  'Welcome Back!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Teks putih agar kontras dengan latar belakang
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Sign in to continue',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 50),
                // Form Fields
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    prefixIcon: const Icon(Icons.email_outlined, color: Colors.black), // Ikon email hitam
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white, // Latar input putih
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear, color: Colors.black), // Ikon clear hitam
                      onPressed: () => _emailController.clear(),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: const Icon(Icons.lock_outline, color: Colors.black), // Ikon kunci hitam
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white, // Latar input putih
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear, color: Colors.black), // Ikon clear hitam
                      onPressed: () => _passwordController.clear(),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Tombol Auto-fill
                TextButton(
                  onPressed: _autoFillLogin,
                  child: const Text(
                    'Auto Fill Login',
                    style: TextStyle(
                      color: Colors.white, // Teks putih untuk tombol auto-fill
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Tombol Login
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, // Warna latar tombol login hitam
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    if (_emailController.text.isNotEmpty && 
                        _passwordController.text.isNotEmpty) {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/home',
                        (route) => false,
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please fill in all fields'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 16, color: Colors.white), // Teks tombol login putih
                  ),
                ),
                const SizedBox(height: 16),
                // Link Register
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account? ',
                      style: TextStyle(color: Colors.white70), // Warna teks register abu-abu terang
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
