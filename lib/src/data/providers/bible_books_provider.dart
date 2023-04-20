import 'package:wefellowship/src/data/models/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wefellowship/src/data/providers/providers.dart';

String bookID = '';

final bibleBooksProvider = FutureProvider.autoDispose<List<Book>>(
  (ref) async {
    ref.maintainState = true;

    final bibleService = ref.watch(bibleServiceProvider);
    final books = bibleService.getBooks(bookID);

    return books;
  },
);
