// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, no_leading_underscores_for_local_identifiers

import 'package:atomic_notes/utility/component/my_floating_button.dart';
import 'package:flutter/material.dart';

class NotesCreaterPage extends StatelessWidget {
  final tittleContoller;
  final notesController;

  VoidCallback onCopy;
  VoidCallback onSave;
  VoidCallback onCancel;

  NotesCreaterPage({
    required this.tittleContoller,
    required this.notesController,
    required this.onCopy,
    required this.onSave,
    required this.onCancel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ScrollController _controller = ScrollController();
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              
                  color: const Color(0xff29283A),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  // tittle textfield section
                 
                  // notes textfield section
                  Expanded(
                    child: Scrollbar(
                      controller: _controller,
                      child: TextField(
                        controller: notesController,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        autofocus: true,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Note",
                            hintStyle: TextStyle(color: Colors.grey)),
                        cursorColor: Colors.deepPurple.shade300,
                        style:
                            const TextStyle(fontSize: 17, color: Colors.white),
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 3,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 5),
                  // buttons section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyFloatingButton(
                        ico: "assets/copy_home.svg",
                        action: onCopy,
                        colorValue: 0xff9f5ef7,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // save button

                          MyFloatingButton(
                            ico: "assets/save.svg",
                            action: onSave,
                            colorValue: 0xff855ef7,
                          ),
                          const VerticalDivider(
                            width: 20,
                          ),

                          // cancel button
                          MyFloatingButton(
                            ico: "assets/cross_circle.svg",
                            action: onCancel,
                            colorValue: 0xffa60000,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
