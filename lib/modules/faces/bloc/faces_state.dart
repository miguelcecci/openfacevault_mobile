import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class FacesState extends Equatable {
  FacesState([List props = const <dynamic>[]]) : super(props);
}

class InitialFacesState extends FacesState {}
