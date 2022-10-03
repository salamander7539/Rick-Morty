import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_api/core/error/failure.dart';
import 'package:rick_and_morty_api/core/usecases/usecase.dart';
import 'package:rick_and_morty_api/future/domain/entities/person_entity.dart';
import 'package:rick_and_morty_api/future/domain/repositories/person_repository.dart';
import 'package:equatable/equatable.dart';
class GetAllPersons extends UseCase<List<PersonEntity>, PagePersonParams>{
  final PersonRepository personRepository;

  GetAllPersons(this.personRepository);

  Future <Either<Failure, List<PersonEntity>>> call (PagePersonParams params) async{
    return await personRepository.getAllPersons(params.page);
  }
}

class PagePersonParams extends Equatable {
  final int page;

  PagePersonParams({required this.page});

  @override
  List<Object?> get props => [page];
}
