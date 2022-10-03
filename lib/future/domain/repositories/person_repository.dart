import 'package:rick_and_morty_api/core/error/failure.dart';
import 'package:rick_and_morty_api/future/domain/entities/person_entity.dart';
import 'package:dartz/dartz.dart';
abstract class PersonRepository{
  Future <Either<Failure, List<PersonEntity>>> getAllPersons(int page);
  Future <Either<Failure, List<PersonEntity>>> searchPerson(String query);

}
