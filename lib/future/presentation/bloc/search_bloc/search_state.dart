import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_api/future/domain/entities/person_entity.dart';
abstract class PersonSearchState extends Equatable{
  const PersonSearchState();
  @override
  List<Object?> get props => [];
}
class PersonEmpty extends PersonSearchState{}

class PersonSearchLoading extends PersonSearchState{}

class PersonSearchLoaded extends PersonSearchState{
  final List<PersonEntity> persons;

  PersonSearchLoaded({required this.persons});       //(required)? - error
  @override
  List<Object?> get props => [persons];
}
class PersonSearchError extends PersonSearchState{
final String message;

PersonSearchError({required this.message});
@override
  // TODO: implement props
  List<Object?> get props => [message];
}

