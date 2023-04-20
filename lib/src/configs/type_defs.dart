import 'package:fpdart/fpdart.dart';
import 'package:wefellowship/src/configs/configs.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef FutureVoid = FutureEither<void>;
