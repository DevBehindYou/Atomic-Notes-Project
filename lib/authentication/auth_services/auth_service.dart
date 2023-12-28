// ignore_for_file: unnecessary_null_comparison

import 'package:supabase_flutter/supabase_flutter.dart';

class AuthServices {
  late SupabaseClient supabase;
  late String userId = supabase.auth.currentUser!.id;
  AuthServices() {
    supabase = Supabase.instance.client;
  }

  // update user info
  Future<String?> updateUserInfo({
    required String username,
  }) async {}

  // fetch user info from supabase
  Future<String> getUserInfo() async {
    try {} catch (error) {
      return "@ensyncuser";
    }
  }
}
