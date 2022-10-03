import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_api/core/error/failure.dart';
import 'package:rick_and_morty_api/future/domain/usecases/search_person.dart';
import 'package:rick_and_morty_api/future/presentation/bloc/search_bloc/search_event.dart';
import 'package:rick_and_morty_api/future/presentation/bloc/search_bloc/search_state.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

class PersonSearchBloc extends Bloc<PersonSearchEvent, PersonSearchState> {
  final SearchPerson searchPerson;
  PersonSearchBloc({required this.searchPerson}) : super(PersonEmpty()){
    on<SearchPersons>((event, emit) async{
      emit(PersonSearchLoading());
      final failureOrPerson = await searchPerson(SearchPersonParams(query: event.personQuery));
      emit(failureOrPerson.fold(
        (failure) => PersonSearchError(
          message: _mapFailureToMessage(failure)),
      (person) => PersonSearchLoaded(persons: person)));
    });
  }

//  @override
//  Stream<PersonSearchState> mapEventToState(PersonSearchEvent event) async* {
//    if (event is SearchPersons) {
//      yield* _mapFetchPersonsToState(event.personQuery);
//    }
//  }
//
//  Stream<PersonSearchState> _mapFetchPersonsToState(String personQuery) async* {
//    yield PersonSearchLoading();
//    final failureOrPerson = await searchPersons(   //(!) - error
//        SearchPersonParams(query: personQuery));
//    yield* failureOrPerson.fold(
//        (failure) => PersonSearchError(
//            message: _mapFailureToMessage(failure)), //(*) - error
//        (person) => PersonSearchLoaded(persons: person));
//  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      /*  case ServerFailure:
      return 'Server Failure';
    case CacheFailure:
      return 'Cache Failure';*/
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHED_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}
