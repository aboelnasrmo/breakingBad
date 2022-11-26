// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:approutertrial/data/model/character_model.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({
    Key? key,
    required this.character,
  }) : super(key: key);
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

  @override
  Widget build(BuildContext context) {
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
