// ignore_for_file: use_build_context_synchronously

import 'package:atomic_notes/utility/component/logo_container.dart';
import 'package:atomic_notes/utility/component/my_snackbar.dart';
import 'package:atomic_notes/utility/component/my_textfield.dart';
import 'package:atomic_notes/utility/component/progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final supabase = Supabase.instance.client;
  final _emailController = TextEditingController();
  bool _isLoading = false;

  Future<void> _resetPassword() async {
    try {
      // Show loading indicator if needed
      setState(() {
        _isLoading = true;
      });

      // Call Supabase API to send a password reset email
      await supabase.auth.resetPasswordForEmail(
        _emailController.text.trim(),
      );

      // Show a success message or navigate to a reset success page
      const MySnackBar(
        text: 'Password reset email sent. Check your inbox.',
        sec: 3000,
      ).showMySnackBar(context);
    } on AuthException catch (error) {
      // Handle specific authentication exceptions
      MySnackBar(
        text: error.message,
        sec: 2000,
      ).showMySnackBar(context);
    } catch (error) {
      // Handle other errors
      const MySnackBar(
        text: 'Unknown error occurred',
        sec: 2000,
      ).showMySnackBar(context);
    } finally {
      // Hide loading indicator if needed
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff29283A),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 120),
              const LogoContainer(),
              const SizedBox(height: 40),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  "Enter you email to reset your password",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // email recovery textfield
              MyTextField(
                ico: const Icon(Icons.email),
                hintText: "Enter Email",
                controller: _emailController,
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed('/loginpage');
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25)),
                      child: const Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: _resetPassword,
                    child: Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                          color: const Color(0xff5F5EF7),
                          borderRadius: BorderRadius.circular(10)),
                      child: _isLoading
                          ? const circularProgress()
                          : const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 25,
                                  width: 25,
                                  child: Icon(
                                    Icons.mail,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Reset",
                                  style: TextStyle(
                                      color: Colors.white,
                                      letterSpacing: 1.0,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
