import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';

const _kSupabaseUrl = 'https://iqzyqvsceylauvvnlwwi.supabase.co';
const _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlxenlxdnNjZXlsYXV2dm5sd3dpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTIyMDAzMjksImV4cCI6MjAyNzc3NjMyOX0.xLdzMcEj0lmS1kMmu4ERB0-e5_xbWotmlnPsDxExi6I';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        debug: false,
      );
}
