import 'package:approutertrial/business_logic/cubit/cubit/character_cubit.dart';
import 'package:approutertrial/data/model/character_model.dart';
import 'package:approutertrial/data/repository/character_repo.dart';
import 'package:approutertrial/data/web_services/web_services.dart';
import 'package:approutertrial/presentation/screens/screen_one.dart';
import 'package:approutertrial/presentation/screens/screen_two.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants/strings.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharacterCubit characterCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(WebServices());
    characterCubit = CharacterCubit(charactersRepository);
  }
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => CharacterCubit(charactersRepository),
            child: const ScreenOne(),
          ),
        );
      case secondScreen:
        final character = settings.arguments as Character;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => CharacterCubit(charactersRepository),
                  child: ScreenTwo(
                    character: character,
                  ),
                ));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
