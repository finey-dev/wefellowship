import 'package:wefellowship/src/data/models/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wefellowship/src/data/repositories/repositories.dart';

final localRepositoryProvider = StateNotifierProvider<
    LastTranslationBookChapterRepository, TranslationBookChapter>((ref) {
  return LastTranslationBookChapterRepository();
});
