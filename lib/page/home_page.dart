// ignore_for_file: use_super_parameters, library_private_types_in_public_api

import 'package:atomic_notes/page/notes_editor_page.dart';
import 'package:atomic_notes/utility/component/my_floating_button.dart';
import 'package:atomic_notes/utility/component/my_snackbar.dart';
import 'package:atomic_notes/utility/component/note_skeliton.dart';
import 'package:flutter/material.dart';
import 'package:atomic_notes/database/database.dart';
import 'package:atomic_notes/utility/component/notes_builder.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NotesDataBase db = NotesDataBase();

  bool _isLoading = false;
  bool _mounted = true;

  @override
  initState() {
    _loadNotes();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff29283A),
    );
  }

  // functions used in homepage

  void _loadNotes() {
    if (!_mounted) return;

    setState(() {
      _isLoading = true;
    });
    db.loadLocalData();
    setState(() {
      _isLoading = false;
    });
  }

  void _saveNewNote() {
    if (_notesController.text.trimLeft() == "" &&
        _titleController.text.trimLeft() == "") {
      const MySnackBar(
        text: "Empty Note Discarded",
        sec: 200,
      ).showMySnackBar(context);
      _titleController.clear();
      _notesController.clear();
    } else {}
  }

  void _goToCreateNote() {}

  void _deleteFunction(BuildContext context, int index) {}

  void _editFunction(BuildContext context, int index) {}

  void _editNote(BuildContext context, int index) {}

  void _copy() {}

  void _showNotesCreaterPage({required VoidCallback onSave}) {
    showDialog(
      context: context,
      builder: (context) {
        return;
      },
    );
  }
}
