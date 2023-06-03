import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';

const _kSupabaseUrl = 'https://hoclroizwxfzmpdsgrms.supabase.co';
const _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhvY2xyb2l6d3hmem1wZHNncm1zIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODUzOTA1ODUsImV4cCI6MjAwMDk2NjU4NX0.gwS0wKA2k5egCiRfuIYOVG96sKNi1Nys7hXsVSvR3Vc';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
      );
}
