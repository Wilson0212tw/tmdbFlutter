import 'package:gi_tg/constant.dart';
import 'package:gi_tg/extension.dart';
import 'package:flutter/material.dart';
import 'package:gi_tg/network/model/index.dart';
import 'package:gi_tg/view/common/rate_icon.dart';
import 'package:gi_tg/view/movie/detail.dart';
import 'package:palette_generator/palette_generator.dart';

class PosterItme extends StatefulWidget {
  final ArtWork? movie;

  const PosterItme({required this.movie, super.key});

  @override
  State<PosterItme> createState() => _PosterItmeState();
}

class _PosterItmeState extends State<PosterItme> {
  Color palcolor = Colors.transparent;
  Color darkMutedColor = Colors.transparent;
  Color darkVibrantColor = Colors.transparent;
  Color lightMutedColor = Colors.transparent;
  Color lightVibrantColor = Colors.transparent;
  Color mutedColor = Colors.transparent;

  @override
  initState() {
    // updateColor();
    super.initState();
  }

  updateColor() {
    PaletteGenerator.fromImageProvider(
      NetworkImage(widget.movie!.posterPath!.getPosterURL(PosterImageURL.w92)),
      // size: const Size(100, 150),
      // region: const Rect.fromLTWH(0, 0, 100, 150)
    ).then((gen) {
      setState(() {
        palcolor = gen.dominantColor?.color ?? Colors.transparent;
        darkMutedColor = gen.darkMutedColor?.color ?? Colors.transparent;
        darkVibrantColor = gen.darkVibrantColor?.color ?? Colors.transparent;
        lightMutedColor = gen.lightMutedColor?.color ?? Colors.transparent;
        lightVibrantColor = gen.lightVibrantColor?.color ?? Colors.transparent;
        mutedColor = gen.mutedColor?.color ?? Colors.transparent;
        // palcolor = gen.dominantColor!;
      });
    });
  }

  Color get bgColr => lightVibrantColor != Colors.transparent
      ? lightVibrantColor
      : lightMutedColor;

  @override
  Widget build(BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5),
          child: Stack(
            fit: StackFit.expand,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push<void>(
                      context,
                      MaterialPageRoute(
                          builder: (ctc) => Detail(mItem: widget.movie!)));
                },
                child: Container(
                    height: 700,
                    padding:
                        const EdgeInsets.only(bottom: 11, left: 5, right: 5),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          widget.movie!.posterPath!
                              .getPosterURL(PosterImageURL.w780),
                        ),
                      ),
                    )),
              ),
              Positioned(
                  bottom: 0, child: RateIcon(widget.movie!.voteAverage!)),
              // Expanded(
              //     child: Column(
              //   children: [
              //     Text(widget.movie?.title ?? "",
              //         overflow: TextOverflow.clip,
              //         maxLines: 2,
              //         softWrap: false,
              //         style: TextStyle(fontSize: 30, color: Colors.white)),
              //     Text(
              //       widget.desc!,
              //       overflow: TextOverflow.clip,
              //       maxLines: 5,
              //       softWrap: true,
              //     )
              //   ],
              // ))
            ],
          ),
        ),
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
