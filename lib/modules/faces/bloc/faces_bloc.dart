import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

import 'package:openfacevault_mobile/repositories/persons_repository.dart';

class FacesBloc extends Bloc<FacesEvent, FacesState> {

  final _repository = PersonsRepository();

  @override
  FacesState get initialState => InitialFacesState();

  @override
  Stream<FacesState> mapEventToState(
    FacesEvent event,
  ) async* {
    if(event is FacesFetch){
      try {
        final persons = await _repository.getPersons();
        yield FacesLoaded(persons: persons);
      } catch(e) {
        yield FacesError(e);
      }
    }
  }
}
