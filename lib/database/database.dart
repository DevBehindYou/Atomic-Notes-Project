// ignore_for_file: deprecated_member_use

import 'package:atomic_notes/database/sync_status.dart';
import 'package:hive/hive.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NotesDataBase {
  final _myBox = Hive.box('myBox');
  late final Box<bool>? _authBox;

  // Load the data from the local Hive database
  Future<void> loadLocalData() async {}

  // Update the local Hive database
  Future<void> updateLocalData() async {}

  // Function to clear Hive data and notesList
  Future<void> clearDataOnLogout() async {
    // Clear data in Hive
  }

  // Destroy local data storage
  Future<void> destroyLocalDataStorage() async {
    notesList.clear();
    await updateLocalData();
  }

  // Sync data from local Hive to Supabase
  Future<void> syncDataToSupabase() async {
    try {} catch (error) {
      // return snackbar
    }
  }

  // Load data from Supabase and update the local Hive database
  Future<void> loadAndSyncSupabaseData() async {
    try {
      // Fetch data from Supabase based on the user ID
      final response =
          await notesTable.select('tittle, note, created_at').select();

      // Extract notes from the response
      final List<dynamic> supabaseNotes = response;

      if (supabaseNotes == []) {
      } else {
        // Update local Hive database with notes from Supabase
      }

      updateLocalData();
    } catch (error) {
      // return snackbar
    }
  }

  // count ht e number ot note user have in the database
  Future<String> countNotesNumFromCloud() async {
    try {} catch (e) {
      return "-";
    }
  }

  // Load data from Supabase and update the local Hive database
  Future<void> forceLoadAndSyncSupabaseData() async {
    try {
      if (supabaseNotes == []) {
        loadLocalData();
      } else {
        // Update local Hive database with notes from Supabase
      }

      updateLocalData();
    } catch (error) {
      // return snackbar
    }
  }

  Future<void> deleteSupabaseData() async {
    try {} catch (e) {
      //return error
    }
  }
}
