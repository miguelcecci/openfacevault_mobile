import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class FacesEvent extends Equatable {
  FacesEvent([List props = const <dynamic>[]]) : super(props);
}
