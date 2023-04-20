import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wefellowship/src/data/repositories/repositories.dart';

final bibleRepositoryProvider = Provider<BibleRepository>((ref) {
  return BibleRepository();
});
