import 'package:approutertrial/business_logic/cubit/cubit/character_cubit.dart';
import 'package:approutertrial/data/model/character_model.dart';
import 'package:approutertrial/presentation/widgets/characters_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  List<Character>? allCharacters;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharacterCubit>(context).getAllCharacters();
  }

  Widget buildLoadedWidgets() {
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey,
        child: Column(
          children: [
            buildCharacterList(),
          ],
        ),
      ),
    );
  }

  Widget buildCharacterList() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1),
      shrinkWrap: true,
      itemCount: allCharacters!.length,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return CharacterItem(
          character: allCharacters![index],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Characters',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.yellow,
        centerTitle: false,
      ),
      body: BlocBuilder<CharacterCubit, CharacterState>(
        builder: (context, state) {
          if (state is CharacterIsloaded) {
            allCharacters = (state).characters;
            return buildLoadedWidgets();
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
