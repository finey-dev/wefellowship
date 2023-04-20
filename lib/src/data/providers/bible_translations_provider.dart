import 'package:wefellowship/src/data/models/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wefellowship/src/data/providers/providers.dart';

String translationID = '';

final bibleTranslationsProvider = Provider<List<Translation>>((ref) {
  final bibleService = ref.watch(bibleRepositoryProvider);
  final versions = bibleService.translations;

  return versions;
});
