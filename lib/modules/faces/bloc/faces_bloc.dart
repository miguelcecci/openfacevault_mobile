import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

import 'package:openfacevault_mobile/repositories/persons_repository.dart';
import 'package:openfacevault_mobile/repositories/endpoint_repository.dart';

class FacesBloc extends Bloc<FacesEvent, FacesState> {

  final _repository = PersonsRepository();
  final _endpoint = EndpointRepository();

  @override
  FacesState get initialState => InitialFacesState();

  @override
  Stream<FacesState> mapEventToState(
    FacesEvent event,
  ) async* {
    if(event is FacesFetch){
      try {
        final persons = await _repository.getPersons();
        final endpoint = await _endpoint.getRepository();
        yield FacesLoaded(persons: persons, endpoint: endpoint);
      } catch(e) {
        yield FacesError(e);
      }
    }
  }
}
