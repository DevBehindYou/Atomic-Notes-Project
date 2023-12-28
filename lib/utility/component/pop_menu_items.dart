// ignore_for_file: deprecated_member_use, use_build_context_synchronously, no_leading_underscores_for_local_identifiers

import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:atomic_notes/database/database.dart';
import 'package:atomic_notes/utility/component/my_snackbar.dart';
import 'package:atomic_notes/utility/component/progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';

class PopMenuItems extends StatefulWidget {
  const PopMenuItems({super.key});

  @override
  State<PopMenuItems> createState() => _PopMenuItemsState();
}

class _PopMenuItemsState extends State<PopMenuItems> {
  @override
  Widget build(BuildContext context) {
    final NotesDataBase db = NotesDataBase();
    final _myBox = Hive.box('myBox');
    bool _isLoading = false;

    // sync notes to cloud
    Future<void> _syncData() async {
      setState(() {
        _isLoading = true;
      });
      final connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        const MySnackBar(
          text: "No Internet Connection!",
          sec: 2000,
        ).showMySnackBar(context);
      } else {
        if (_myBox.get("NOTESLIST").toString() == "[]") {
          const MySnackBar(
            text: "Database is empty!",
            sec: 1000,
          ).showMySnackBar(context);
        } else {
          await db.syncDataToSupabase();
          const MySnackBar(
            text: "Notes Synchronized No need to tap again",
            sec: 2000,
          ).showMySnackBar(context);
        }
      }
      setState(() {
        _isLoading = false;
      });
    }

    Future<void> _exit() async {
      setState(() {
        _isLoading = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      exit(0);
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                height: 40,
                width: 80,
                child: GestureDetector(
                  onTap: _syncData,
                  child: Container(
                    padding: const EdgeInsets.all(7),
                    height: 50,
                    width: 75,
                    decoration: BoxDecoration(
                      color: const Color(0xff5F5EF7),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade900,
                          offset: const Offset(2, 2),
                          blurRadius: 2,
                          spreadRadius: 1,
                        )
                      ],
                    ),
                    child: _isLoading
                        ? const circularProgress()
                        : SvgPicture.asset(
                            "assets/sync.svg",
                            color: Colors.white,
                          ),
                  ),
                )),
            const SizedBox(
              width: 135,
              child: Text(
                "Sync Notes to Cloud",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
        Divider(
          height: 5,
          indent: 25,
          endIndent: 25,
          color: Colors.grey.shade600,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                height: 40,
                width: 80,
                child: GestureDetector(
                  onTap: _exit,
                  child: Container(
                    padding: const EdgeInsets.all(7),
                    height: 50,
                    width: 75,
                    decoration: BoxDecoration(
                      color: const Color(0xff5F5EF7),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade900,
                          offset: const Offset(2, 2),
                          blurRadius: 2,
                          spreadRadius: 1,
                        )
                      ],
                    ),
                    child: _isLoading
                        ? const circularProgress()
                        : SvgPicture.asset(
                            "assets/sync.svg",
                            color: Colors.white,
                          ),
                  ),
                )),
            const SizedBox(
              width: 135,
              child: Text(
                "Exit the App",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
