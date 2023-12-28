// ignore_for_file: use_build_context_synchronously, deprecated_member_use

import 'package:atomic_notes/database/database.dart';
import 'package:atomic_notes/utility/component/danger_tiles.dart';
import 'package:atomic_notes/utility/component/my_snackbar.dart';

import 'package:atomic_notes/utility/component/my_appbar.dart';
import 'package:flutter/material.dart';

class DevPage extends StatelessWidget {
  const DevPage({super.key});

  @override
  Widget build(BuildContext context) {
    final NotesDataBase db = NotesDataBase();
    bool mounted = true;

    // dev options function
    Future<void> forceFetchNotes() async {}

    // dev options function
    Future<void> deleteLocalData() async {}

    // dev options function
    Future<void> deleteCloudData() async {}

    return Scaffold(
      appBar: const MyAppBar(text: "Developer Options"),
      backgroundColor: const Color(0xff29283A),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(7.0),
            margin: const EdgeInsets.all(11.0),
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(width: 1.0, color: const Color(0xffff2b00))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // fetch data
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: DangerTile(
                    func: forceFetchNotes,
                    text: "FORCE TO FETCH CLOUD DATA",
                    txt:
                        "Are you sure you want to fetch notes from the cloud?\nWarning: By doing so, it will double or create duplicates of your notes.",
                  ),
                ),
                // delete data
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: DangerTile(
                    func: deleteCloudData,
                    text: "FORCE TO DELETE CLOUD DATA",
                    txt:
                        "Are you sure you want to delete your notes stored in the cloud?\nWarning: By doing so, it will empty your notes data in the cloud",
                  ),
                ),

                // destroy local data
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: DangerTile(
                    func: deleteLocalData,
                    text: "FORCE TO DESTROY LOCAL DATA",
                    txt:
                        "Are you sure you want to delete notes from local storage?\nWarning: By doing so, it will delete all notes stored in the local data storage.",
                  ),
                )
              ],
            ),
          ),
          // show tutorial again section
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, "/onboardingscreen");
            },
            child: Container(
              margin: const EdgeInsets.all(10.0),
              height: 60,
              decoration: BoxDecoration(
                color: const Color(0xff5F5EF7),
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Show Tutorial Again",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(width: 7),
                  Icon(
                    Icons.phone_android_outlined,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
