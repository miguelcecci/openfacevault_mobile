import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:openfacevault_mobile/models/person.dart';

@immutable
abstract class FacesState extends Equatable {
  FacesState([List props = const <dynamic>[]]) : super(props);
}

class InitialFacesState extends FacesState {}

class FacesLoaded extends FacesState {
  final List<Person> persons;
  final String endpoint;

  FacesLoaded({this.persons, this.endpoint});

  @override
  String toString() => 'FacesLoaded';
}

class FacesError extends FacesState {
  final Exception e;

  FacesError(this.e);

  @override
  String toString() => 'FacesError';
}