// ignore_for_file: use_build_context_synchronously, unrelated_type_equality_checks, prefer_final_fields, deprecated_member_use

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:atomic_notes/authentication/auth_services/auth_service.dart';
import 'package:atomic_notes/database/database.dart';
import 'package:atomic_notes/utility/component/logo_container.dart';
import 'package:atomic_notes/utility/component/logout_dialogbox.dart';
import 'package:atomic_notes/utility/component/my_snackbar.dart';
import 'package:atomic_notes/utility/component/my_textfield.dart';
import 'package:atomic_notes/utility/component/profile_container.dart';
import 'package:atomic_notes/utility/component/settings_tiles.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late String? userId = supabase.auth.currentUser!.email;
  final supabase = Supabase.instance.client;
  final AuthServices serve = AuthServices();
  final NotesDataBase db = NotesDataBase();
  bool _isLoading = false;
  String? username = "@atomicuser";
  final _usernameController = TextEditingController();
  bool _isMounted = true;
  bool _isSwitch = false;

  @override
  void initState() {
    _getUserName();
    super.initState();
  }

  bool isFilled() {
    if (_usernameController.text.trim() == "") {
      return false;
    } else {
      return true;
    }
  }

  Future<void> _sendData() async {
    if (!mounted) return;

    if (connectivityResult == ConnectivityResult.none) {
      const MySnackBar(
        text: "No Internet Connection!",
        sec: 2000,
      ).showMySnackBar(context);
    } else {}

    setState(() {
      _isSwitch = false;
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _isMounted = false;
    _isLoading = false;
    _isSwitch = false;
    _usernameController.dispose();
    super.dispose();
  }

  void _toggelSwitch() {
    setState(() {
      _isSwitch = !_isSwitch;
    });
  }

  _showPopUp({required String txt, required Function func}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return DialogBoxLogout(
          action: func,
          text: txt,
        );
      },
    );
  }

  // get the user name
  Future<void> _getUserName() async {
    if (!_isMounted) return;

    try {} catch (e) {
      // error
    }
  }

  //logout function
  Future<void> _logOut() async {
    if (!_isMounted) return;

    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectionState.none) {
      const MySnackBar(
        sec: 2000,
        text: "No internet connection!",
      ).showMySnackBar(context);
    } else {
      try {
        await db.clearDataOnLogout();
        await supabase.auth.signOut();
      } catch (error) {
        const MySnackBar(
          text: "Unable to logout",
          sec: 2000,
        ).showMySnackBar(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff29283A),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              decoration: BoxDecoration(
                color: const Color(0xff3f3e3c),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Logged in as",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    userId!,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // logout button section

            SizedBox(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 55,
                    width: 250,
                    decoration: BoxDecoration(
                        color: const Color(0xff3f3e3c),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: _isSwitch
                          ? MyTextField(
                              ico: const Icon(Icons.person),
                              hintText: "Enter user name",
                              controller: _usernameController)
                          : Text(
                              "User Name: $username",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 15),
                            ),
                    ),
                  ),
                  GestureDetector(
                    onTap: _toggelSwitch,
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          color: const Color(0xff855ef7),
                          borderRadius: BorderRadius.circular(23)),
                      child: const Center(
                          child: Icon(
                        Icons.edit,
                        color: Colors.white,
                      )),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: _sendData,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                height: 50,
                decoration: BoxDecoration(
                    color: const Color(0xff5F5EF7),
                    borderRadius: BorderRadius.circular(23)),
                child: const Center(
                    child: Text(
                  "Update",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )),
              ),
            ),
            const SizedBox(height: 20),

            // notes database section
            SettingsTiles(
              action: () {
                Navigator.pushNamed(context, '/databasepage');
              },
              text: "Notes Database",
            ),
            const SizedBox(height: 10),

            // clous sync switch
            SettingsTiles(
              action: () {
                Navigator.pushNamed(context, '/cloudsyncpage');
              },
              text: "Cloud Synchronization",
            ),
            const SizedBox(height: 10),

            // bio auth switch
            SettingsTiles(
              action: () {
                Navigator.pushNamed(context, '/biompage');
              },
              text: "Security",
            ),
            const SizedBox(height: 10),

            // develpoper option section
            SettingsTiles(
              action: () {
                Navigator.pushNamed(context, '/devoption');
              },
              text: "More Options",
            ),

            //logo section
            const SizedBox(height: 40),
            const LogoContainer(),
            const SizedBox(height: 40),

            // version info
            const Text(
              "Version: 1.11.1 (3)",
              style: TextStyle(color: Colors.white, fontSize: 13),
            ),
            const Text("© 2023 Atomic Notes",
                style: TextStyle(color: Colors.white, fontSize: 13)),

            const SizedBox(height: 40),
            // Divider(
            //   height: 35,
            //   indent: 45,
            //   endIndent: 45,
            //   color: Colors.grey.shade700,
            // ),

            // app info section
            const Text("About Atomic",
                style: TextStyle(color: Colors.white, fontSize: 13)),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/appinfo');
              },
              child: Container(
                height: 60,
                width: 180,
                decoration: BoxDecoration(
                    color: const Color(0xff5F5EF7),
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(
                      Icons.coffee,
                      color: Colors.white,
                    ),
                    Container(
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(
                          color: const Color(0xff323130),
                          borderRadius: BorderRadius.circular(20)),
                      child: const Icon(
                        Icons.info_outline_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
