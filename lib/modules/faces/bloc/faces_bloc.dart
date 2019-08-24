import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class FacesBloc extends Bloc<FacesEvent, FacesState> {
  @override
  FacesState get initialState => InitialFacesState();

  @override
  Stream<FacesState> mapEventToState(
    FacesEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
