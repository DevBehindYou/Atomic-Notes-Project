// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class NotesBulder extends StatelessWidget {
  final String tittle;
  final String note;
  final String when;
  VoidCallback editFunction;
  final Function(BuildContext)? deleteFunction;

  NotesBulder({
    required this.tittle,
    required this.note,
    required this.when,
    required this.editFunction,
    required this.deleteFunction,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const BehindMotion(),
        children: [],
      ),
      child: GestureDetector(
        child: Container(
          margin: const EdgeInsets.only(left: 10, right: 5, top: 7),
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // tittle section

              Padding(
                padding: const EdgeInsets.only(left: 10, top: 5),
                child: Text(
                  note,
                  maxLines: 3,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Divider(
                height: 10,
                indent: 10,
                endIndent: 10,
                color: Colors.grey.shade400,
              ),

              // date + time
            ],
          ),
        ),
      ),
    );
  }
}
