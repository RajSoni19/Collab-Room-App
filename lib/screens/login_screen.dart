
import 'package:colab_room/resources/auth_methods.dart';
import 'package:colab_room/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethods = AuthMethods();
  bool _isLoading = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Collab Room',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 38.0),
                  child: Image.asset('assets/images/onboarding.jpg'),
                ),
                CustomButton(
                  text: 'Sign with Google',
                  onPressed: () async {
                    setState(() {
                      _isLoading = true;
                    });
                    try {
                      await _authMethods.signInWithGoogle(context);
                    } catch (e) {
                      print('Error signing in: $e');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error: $e')),
                      );
                    } finally {
                      if (mounted) {
                        setState(() {
                          _isLoading = false;
                        });
                      }
                    }
                  },
                ),
              ],
            ),
    );
  }
}