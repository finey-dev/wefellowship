import 'package:wefellowship/src/data/models/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wefellowship/src/data/providers/providers.dart';

String chapterID = '';
String translationAbb = '';

final bibleChaptersProvider = FutureProvider.autoDispose<Chapter>((ref) {
  ref.maintainState = true;

  final bibleService = ref.watch(bibleServiceProvider);
  final chapters = bibleService.getChapter(bookID, chapterID, translationAbb);

  return chapters;
});
