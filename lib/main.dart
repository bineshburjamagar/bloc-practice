import 'package:counter_app/bloc/favourite_app/favorite_app_bloc.dart';
import 'package:counter_app/repository/favorite_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc/counter_bloc.dart';
import 'bloc/switch_bloc/switch_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CounterBloc()),
          BlocProvider(create: (context) => SwitchBloc()),
          BlocProvider(
            create: (context) => FavoriteAppBloc(FavoriteRepository()),
          ),
        ],
        child: const MaterialApp(
          home: Text('data'),
        ));
  }
}
