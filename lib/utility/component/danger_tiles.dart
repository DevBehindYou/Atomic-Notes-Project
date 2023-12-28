import 'package:atomic_notes/utility/component/dialog_box.dart';
import 'package:flutter/material.dart';

class DangerTile extends StatelessWidget {
  final Function func;
  final String txt;
  final String text;
  const DangerTile({
    required this.func,
    required this.txt,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    showPopUp({required String txt, required Function func}) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return DialogBox(
            action: func,
            text: txt,
          );
        },
      );
    }

    return Container(
      height: 60,
      decoration: BoxDecoration(
          color: const Color(0xff323130),
          borderRadius: BorderRadius.circular(25)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            text,
            maxLines: 1,
            style: const TextStyle(color: Colors.white, fontSize: 13),
          ),
          GestureDetector(
            onTap: () => showPopUp(txt: txt, func: func),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              decoration: BoxDecoration(
                  color: const Color(0xff232427),
                  borderRadius: BorderRadius.circular(16)),
              child: const Text(
                "EXECUTE",
                style: TextStyle(color: Color(0xffff2b00), fontSize: 11),
              ),
            ),
          )
        ],
      ),
    );
  }
}
