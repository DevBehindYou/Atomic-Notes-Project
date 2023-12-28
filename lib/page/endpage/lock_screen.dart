// ignore_for_file: use_build_context_synchronously, deprecated_member_use

import 'package:atomic_notes/utility/component/my_snackbar.dart';
import 'package:atomic_notes/utility/component/progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:local_auth/local_auth.dart';

class LockScreen extends StatefulWidget {
  const LockScreen({super.key});

  @override
  State<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  late final LocalAuthentication auth;

  bool _mounted = true;
  bool _supportState = false;
  bool _isLoading = false;

  @override
  void initState() {
    auth = LocalAuthentication();
    auth.isDeviceSupported().then(
          (bool isSupported) => setState(() {
            _supportState = isSupported;
          }),
        );
    super.initState();
  }

  @override
  void dispose() {
    _mounted = false;
    _isLoading = false;
    super.dispose();
  }

  Future<void> _auth() async {
    if (!_mounted) return;

    setState(() {
      _isLoading = true;
    });
    try {} on PlatformException catch (e) {
      MySnackBar(
        text: e.toString(),
        sec: 1000,
      ).showMySnackBar(context);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff323130),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 200),
            Center(
              child: GestureDetector(
                  onTap: _auth,
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: const Color(0xff855ef7),
                        borderRadius: BorderRadius.circular(16)),
                    child: _supportState
                        ? _isLoading
                            ? const circularProgress()
                            : const Icon(
                                Icons.fingerprint_rounded,
                                color: Colors.white,
                                size: 70,
                              )
                        : _isLoading
                            ? const circularProgress()
                            : SizedBox(
                                height: 40,
                                width: 40,
                                child: Center(
                                  child: SvgPicture.asset(
                                    'assets/dots.svg',
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
