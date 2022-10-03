import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_api/core/error/failure.dart';

abstract class UseCase<Type, Params>{
  Future<Either<Failure, Type>> call (Params params);
}