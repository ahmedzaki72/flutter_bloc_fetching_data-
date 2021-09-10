import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_fetching_data/bloc/bloc.dart';
import 'package:flutter_bloc_fetching_data/bloc/event.dart';
import 'package:flutter_bloc_fetching_data/bloc/state.dart';
import 'package:flutter_bloc_fetching_data/repository/dio_helper.dart';
import 'package:flutter_offline/flutter_offline.dart';

void main() {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter bloc fetching ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (BuildContext context) => PostBloc(
          PostInitialStates(),
        ),
        child: const MyHomePage(title: 'flutterBlocFetching'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PostBloc? bloc;

  @override
  void initState() {
    // TODO: implement initState
    bloc = BlocProvider.of<PostBloc>(context);
    bloc!.add(FetchingDataEvent());
    super.initState();
  }

  @override
  void dispose() {
    bloc!.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;
          if (connected) {
            return BlocConsumer<PostBloc, PostStates>(
              listener: (context, states) {
                if (states is PostSuccessStates) {
                  print('working');
                }
              },
              builder: (context, states) {
                if (states is PostInitialStates) {
                  return CircularProgressIndicator(
                    color: Colors.green,
                  );
                } else if (states is PostLoadingStates) {
                  return CircularProgressIndicator(
                    color: Colors.green,
                  );
                } else if (states is PostSuccessStates) {
                  print('states is success $states');
                  return ListView.builder(
                      itemCount: states.posts!.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(states.posts![index].title!),
                          subtitle: Text(states.posts![index].body!),
                        );
                      });
                } else if (states is PostErrorStates) {
                  return Center(
                    child: Text(states.message.toString()),
                  );
                }
                return CircularProgressIndicator(color: Colors.green,);
              },
            );
          } else {
            return offlineInternet(context);
          }
        },
        child: Text('working data'),
      ),
    );
  }

  Widget offlineInternet(BuildContext context) {
    return Center(
      child: Container(
        child: Text('No Internet connection'),
      ),
    );
  }
}
