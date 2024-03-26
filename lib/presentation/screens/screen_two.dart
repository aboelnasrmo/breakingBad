// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:approutertrial/business_logic/cubit/cubit/character_cubit.dart';
import 'package:flutter/material.dart';

import 'package:approutertrial/data/model/character_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({
    super.key,
    required this.character,
  });
  final Character character;

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: Colors.grey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          character.nickname,
          style: const TextStyle(color: Colors.white),
        ),
        background: Hero(
          tag: character.charId,
          child: Image.network(character.img, fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
              text: title,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
          TextSpan(
              text: value,
              style: const TextStyle(color: Colors.white, fontSize: 16)),
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      color: Colors.yellow,
      height: 30,
      endIndent: endIndent,
      thickness: 2,
    );
  }

  Widget checkIfQoutesAreLoaded(CharacterState state) {
    if (state is QoutesLoaded) {
      return displayRandomQouteOrEmptySpace(state);
    } else {
      return showProgressIndicator();
    }
  }

  Widget displayRandomQouteOrEmptySpace(state) {
    var qoutes = (state).qoutes;
    if (qoutes.length != 0) {
      int randomQouteIndex = Random().nextInt(qoutes.length - 1);
      return Center(
        child: DefaultTextStyle(
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20, color: Colors.white, shadows: [
            Shadow(
              blurRadius: 7,
              color: Colors.yellow,
              offset: Offset(0, 0),
            ),
          ]),
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              FlickerAnimatedText(qoutes[randomQouteIndex].qoute),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget showProgressIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.yellow,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CharacterCubit>(context).getCharacterQoutes(character.name);

    return Scaffold(
      backgroundColor: Colors.grey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
              delegate: SliverChildListDelegate(
            [
              Container(
                margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    characterInfo(
                      'Job : ',
                      character.occupation.join(' / '),
                    ),
                    buildDivider(315),
                    characterInfo(
                      'Appeared in : ',
                      character.category,
                    ),
                    buildDivider(250),
                    characterInfo(
                      'Seasons : ',
                      character.appearance.join(' / '),
                    ),
                    buildDivider(280),
                    characterInfo(
                      'Status : ',
                      character.status,
                    ),
                    buildDivider(300),
                    character.betterCallSaulAppearance.isEmpty
                        ? Container()
                        : characterInfo(
                            'Better Call Saul seasons : ',
                            character.betterCallSaulAppearance.join(' / '),
                          ),
                    character.betterCallSaulAppearance.isEmpty
                        ? Container()
                        : buildDivider(150),
                    characterInfo(
                      'Actor / Actress : ',
                      character.name,
                    ),
                    buildDivider(315),
                    const SizedBox(
                      height: 20,
                    ),
                    BlocBuilder<CharacterCubit, CharacterState>(
                      builder: (context, state) {
                        return checkIfQoutesAreLoaded(state);
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 500,
              ),
            ],
          ))
        ],
      ),
    );
  }
}
