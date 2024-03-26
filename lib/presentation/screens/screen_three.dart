import 'package:approutertrial/data/model/death.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/cubit/cubit/character_cubit.dart';
import '../../data/model/character_model.dart';

class ScreenThree extends StatelessWidget {
  final Death? death;
  final Character? character;
  const ScreenThree({this.death, this.character, super.key});
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CharacterCubit>(context).getDeath;
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<CharacterCubit, CharacterState>(
        builder: (context, state) {
          if (state is DeathLoaded) {
            return Text(death!.season.toString());
          } else {
            return const Text('Nothing');
          }
        },
      ),
    );
  }
}
