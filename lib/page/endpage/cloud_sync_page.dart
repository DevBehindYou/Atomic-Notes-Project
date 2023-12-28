// ignore_for_file: use_build_context_synchronously

import 'package:atomic_notes/database/sync_status.dart';
import 'package:atomic_notes/utility/component/my_snackbar.dart';
import 'package:atomic_notes/utility/component/my_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CloudSyncPage extends StatefulWidget {
  const CloudSyncPage({super.key});

  @override
  State<CloudSyncPage> createState() => _CloudSyncPageState();
}

class _CloudSyncPageState extends State<CloudSyncPage> {
  @override
  void initState() {
    super.initState();
    isSyncOn = SyncStatusHelper.isSyncOn;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff29283A),
      appBar: const MyAppBar(text: "Cloud Sync"),
      body: Column(
        children: [
          const SizedBox(height: 20),
          // cloud sync switch + tittle
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 250,
                child: RichText(
                  text: TextSpan(
                    text: 'Cloud Synchronization',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        overflow: TextOverflow.ellipsis),
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              "\nIf you disable this, notes won't be stored in the cloud database.",
                          style: TextStyle(
                              color: Colors.grey.shade300,
                              fontSize: 10,
                              overflow: TextOverflow.ellipsis)),
                    ],
                  ),
                ),
              ),
              // switch
              CupertinoSwitch(
                value: isSyncOn,
                activeColor: const Color(0xff9f5ef7),
                onChanged: (bool value) async {
                  setState(() {
                    isSyncOn = value;
                  });
                  // Save sync status using the helper class
                  await SyncStatusHelper.setSyncStatus(isSyncOn);
                  if (isSyncOn) {
                    const MySnackBar(
                      text: "Cloud Synchronization On",
                      sec: 2000,
                    ).showMySnackBar(context);
                  } else {
                    const MySnackBar(
                      text: "Cloud Synchronization Off",
                      sec: 2000,
                    ).showMySnackBar(context);
                  }
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Text(
              "Notes data will be stored in the Atomic cloud database.\nRestart the application to see the changes.",
              style: TextStyle(
                color: Colors.grey.shade200,
                fontSize: 13,
              ),
            ),
          )
        ],
      ),
    );
  }
}
