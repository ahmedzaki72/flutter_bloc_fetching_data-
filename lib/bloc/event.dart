import 'package:equatable/equatable.dart';

class PostEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FetchingDataEvent extends PostEvent {}

///anther way to write event

// abstract class PostEvents extends Equatable {}
//
// class FetchingDataEvents extends PostEvents {
//   @override
//   // TODO: implement props
//   List<Object?> get props => [];
// }
