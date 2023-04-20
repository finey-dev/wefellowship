import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wefellowship/src/data/repositories/repositories.dart';

final readerSettingsRepositoryProvider =
    ChangeNotifierProvider<ReaderSettingsRepository>((ref) {
  return ReaderSettingsRepository();
});
