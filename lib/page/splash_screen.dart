// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:atomic_notes/database/database.dart';
import 'package:atomic_notes/utility/component/logo_container_2.dart';
import 'package:atomic_notes/utility/component/my_snackbar.dart';
import 'package:atomic_notes/utility/component/progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final NotesDataBase db = NotesDataBase();

  late bool isAuthOn;

  @override
  void initState() {
    super.initState();
    _initAuthHive();
    _redirect();
  }

  void _initAuthHive() async {
    await Hive.openBox<bool>('authBox').then((box) {
      _authBox = box;
      setState(() {
        isAuthOn = _authBox!.get('isAuthOn', defaultValue: false) ?? false;
      });
    });
  }

  Future<void> _redirect() async {
    if (!mounted) {
      return;
    }
    try {
     
      } else {
        await Future.delayed(const Duration(seconds: 1), () {
          
        });
      }
    } catch (error) {
      // force to go on login page
    
    }
  }

  @override
  void dispose() {
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff29283A),
      body: Center(
        child: SizedBox(
          height: 140,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LogoContainer2(),
              circularProgress(),
            ],
          ),
        ),
      ),
    );
  }
}
