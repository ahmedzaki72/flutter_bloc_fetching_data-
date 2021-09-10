import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_fetching_data/bloc/event.dart';
import 'package:flutter_bloc_fetching_data/bloc/state.dart';
import 'package:flutter_bloc_fetching_data/modals/post_modals.dart';
import 'package:flutter_bloc_fetching_data/repository/dio_helper.dart';

class PostBloc extends Bloc<PostEvent, PostStates> {
  PostBloc(PostStates initialState) : super(PostInitialStates());

  static PostBloc get(context) => BlocProvider.of(context);

  @override
  Stream<PostStates> mapEventToState(PostEvent event) async* {
    if (event is FetchingDataEvent) {
      print('working2');
      yield PostLoadingStates();
      print('working3');
      try {
        List<PostModals> posts = [];
        await DioHelper.getData(url: 'posts').then((value) {
          var data = value.data;
          data.forEach(
            (e) => posts.add(
              PostModals.fromJson(e),
            ),
          );
          print(" this is posts $posts");
        });
        print('working4');
        yield PostSuccessStates(posts: posts);
      } catch (error) {
        yield PostErrorStates(message: error.toString());
      }
    }
  }

  @override
  void onTransition(Transition<PostEvent, PostStates> transition) {
    // TODO: implement onTransition
    super.onTransition(transition);
    print(transition);
  }

  @override
  void onEvent(PostEvent event) {
    // TODO: implement onEvent
    super.onEvent(event);
    print(event);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(error, stackTrace);
    print(error);
  }
}
