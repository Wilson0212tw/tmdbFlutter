import 'dart:ui';
import 'package:gi_tg/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gi_tg/network/model/index.dart';

class HomeItem extends StatelessWidget {
  final ArtWork? movie;

  const HomeItem({required this.movie, super.key});

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        height: 200,
        child: Stack(alignment: Alignment.center, children: [
          ColorFiltered(
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.xor),
            child: Image.network(movie!.backdropPath!.getBackDropURL()),
          ),
          Row(
            children: [
              Image.network(movie!.posterPath!.getPosterURL()),
              Expanded(
                  child: Column(
                children: [
                  Text(movie!.title!,
                      overflow: TextOverflow.clip,
                      maxLines: 2,
                      softWrap: false,
                      style: TextStyle(fontSize: 30, color: Colors.white)),
                  Text(
                    movie!.overview!,
                    overflow: TextOverflow.clip,
                    maxLines: 5,
                    softWrap: true,
                  )
                ],
              ))
            ],
          )
        ]),
      );
}


// {"adult":false,
// "backdrop_path":"/7ucaMpXAmlIM24qZZ8uI9hCY0hm.jpg",
// "genre_ids":[14,12,28],
// "id":338953,
// "original_language":"en",
// "original_title":"Fantastic Beasts: The Secrets of Dumbledore",
// "overview":"Professor Albus Dumbledore knows the powerful, dark wizard Gellert Grindelwald is moving to seize control of the wizarding world. Unable to stop him alone, he entrusts magizoologist Newt Scamander to lead an intrepid team of wizards and witches. They soon encounter an array of old and new beasts as they clash with Grindelwald's growing legion of followers.",
// "popularity":9783.591,"poster_path":"/jrgifaYeUtTnaH7NF5Drkgjg2MB.jpg","release_date":"2022-04-06",
// "title":"Fantastic Beasts: The Secrets of Dumbledore","video":false,
// "vote_average":6.8,"vote_count":1302}