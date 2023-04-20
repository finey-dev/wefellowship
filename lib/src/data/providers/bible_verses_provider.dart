import 'package:wefellowship/src/data/models/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wefellowship/src/data/providers/providers.dart';

String verseID = '';

final bibleVersesProvider =
    FutureProvider.autoDispose<List<Verse>>((ref) async {
  ref.maintainState = true;

  bool bookIDIsEmpty = ['', null].contains(verseID);

  final bibleService = ref.watch(bibleServiceProvider);
  final verses =
      bibleService.getVerses(bookID, chapterID, bookIDIsEmpty ? null : verseID);

  return verses;
});
