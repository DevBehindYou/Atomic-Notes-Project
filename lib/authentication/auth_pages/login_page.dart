// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'dart:async';
import 'package:atomic_notes/utility/component/login_button.dart';
import 'package:atomic_notes/utility/component/logo_container.dart';
import 'package:atomic_notes/utility/component/my_snackbar.dart';
import 'package:atomic_notes/utility/component/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final supabase = Supabase.instance.client;
  bool _isLoading = false;
  bool _redirecting = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  late final StreamSubscription<AuthState> _authStateSubscription;
  bool _isSwitch = false;

  @override
  void initState() {
    _authStateSubscription = supabase.auth.onAuthStateChange.listen((data) {
      if (_redirecting) return;
    });
    super.initState();
  }

  @override
  void dispose() {
    _authStateSubscription
        .cancel(); // Cancel the subscription to avoid memory leaks
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _isSwitch = false;
    _isLoading = false;
    _redirecting = false;
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: toggleSwitch,
                      child: SizedBox(
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                              color: _isSwitch ? Colors.grey : Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: toggleSwitch,
                      child: SizedBox(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              color: _isSwitch ? Colors.white : Colors.grey,
                              fontSize: 25,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
                const SizedBox(height: 30),
                _isSwitch
                    ? Column(
                        children: [
                          // sign up textfield section
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 40),
                                child: RichText(
                                  text: const TextSpan(
                                    text: 'Hi there',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        overflow: TextOverflow.ellipsis),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: "\nSign up with your details",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13,
                                              overflow: TextOverflow.ellipsis)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                          // textfields + signup button
                          Container(
                            margin: const EdgeInsets.all(10),
                            height: 280,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                MyTextField(
                                  ico: const Icon(Icons.email),
                                  hintText: "Enter Email",
                                  controller: _emailController,
                                ),
                                MyTextField(
                                  ico: const Icon(Icons.password),
                                  hintText: "Enter Password",
                                  controller: _passwordController,
                                ),
                                MyTextField(
                                  ico: const Icon(Icons.password),
                                  hintText: "Confirm Password ",
                                  controller: _confirmPasswordController,
                                ),
                                const SizedBox(height: 10),
                                // sign up gesture section
                                LoginButton(
                                  ico: "assets/login.svg",
                                  isLoading: _isLoading,
                                  signIn: _signUp,
                                  text: "Sign Up",
                                ),
                              ],
                            ),
                          ),

                          GestureDetector(
                            onTap: () =>
                                Navigator.pushNamed(context, '/tcpage'),
                            child: const Center(
                              child: Column(
                                children: [
                                  Text(
                                    "By signing up you will agree",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                  Text(" with Atomic's Terms and Conditions",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12))
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    : Column(
                        children: [
                          // sign in textfield section
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 40),
                                child: RichText(
                                  text: const TextSpan(
                                    text: 'Welcome back',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        overflow: TextOverflow.ellipsis),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text:
                                              "\nSign in with your email and password",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13,
                                              overflow: TextOverflow.ellipsis)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Container(
                            margin: const EdgeInsets.all(10),
                            height: 230,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // email textfield section
                                MyTextField(
                                  ico: const Icon(Icons.email),
                                  hintText: "Enter Email",
                                  controller: _emailController,
                                ),

                                // password textfield section
                                MyTextField(
                                  ico: const Icon(Icons.password),
                                  hintText: "Enter Password",
                                  controller: _passwordController,
                                ),
                                const SizedBox(height: 2),

                                // forget password gesture section
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context)
                                            .pushReplacementNamed('/resetpage');
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: Text("Forgot Password?",
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                  ],
                                ),

                                const SizedBox(height: 20),

                                // sign in button gesture section
                                LoginButton(
                                  ico: "assets/login.svg",
                                  isLoading: _isLoading,
                                  signIn: _signIn,
                                  text: "Sign In",
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
              ],
            ),
          ),
        ));
  }

  Future<void> _signIn() async {
    if (_isFilled()) {
    } else {
      const MySnackBar(
        text: "Please fill up all sections",
        sec: 2000,
      ).showMySnackBar(context);
    }
  }

  toggleSwitch() {
    setState(() {
      _isSwitch = !_isSwitch;
    });
  }

  Future<void> _signUp() async {
    if (_isFilled()) {
      if (_passwordConfirmed()) {
        try {
          setState(() {
            _isLoading = true;
          });
        } on AuthException catch (error) {
          MySnackBar(
            text: error.message,
            sec: 2000,
          ).showMySnackBar(context);
        } catch (error) {
          const MySnackBar(
            sec: 2000,
            text: "Unknown error occurred!",
          ).showMySnackBar(context);
        } finally {
          if (mounted) {
            setState(() {
              _isLoading = false;
            });
          }
        }
      } else {
        const MySnackBar(
          text: "Passwords didn't match",
          sec: 2000,
        ).showMySnackBar(context);
      }
    } else {
      const MySnackBar(
        text: "Please fill up all sections",
        sec: 2000,
      ).showMySnackBar(context);
    }
  }

  bool _isFilled() {
    if (_emailController.text.trim() == '' ||
        _passwordController.text.trim() == '') {
      return false;
    }
    return true;
  }

  bool _passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }
}
