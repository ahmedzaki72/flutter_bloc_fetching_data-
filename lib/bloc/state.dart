import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_fetching_data/modals/post_modals.dart';

class PostStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class PostInitialStates extends PostStates {}

class PostLoadingStates extends PostStates {}

class PostSuccessStates extends PostStates {
  final List<PostModals>? posts;
  PostSuccessStates({this.posts});

  @override
  List<Object?> get props => [posts];
}

class PostErrorStates extends PostStates {
 final  String? message;
  PostErrorStates({this.message});
}

///write state another way

// abstract class PostsStates extends Equatable {}
//
// class PostsInitialStates extends PostsStates {
//   @override
//   // TODO: implement props
//   List<Object?> get props => [];
// }
//
// class PostsLoadingStates extends PostsStates {
//   @override
//   // TODO: implement props
//   List<Object?> get props => [];
// }
//
// class PostsSuccessStates extends PostsStates {
//   PostModals? postModals;
//   PostsSuccessStates({this.postModals});
//   @override
//   // TODO: implement props
//   List<Object?> get props => [postModals];
// }
//
// class PostsErrorStates extends PostsStates {
//   String? message;
//   PostsErrorStates({this.message});
//   @override
//   // TODO: implement props
//   List<Object?> get props => [message];
// }
