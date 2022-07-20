import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gi_tg/constant.dart';
import 'package:gi_tg/network/model/index.dart';
import 'package:gi_tg/extension.dart';
import 'package:gi_tg/view/ePage.dart';

class Detail extends StatelessWidget {
  static EPage getPage(ArtWork mItem) => EPage((ctx) => Detail(mItem: mItem));
  final ArtWork mItem;
  const Detail({super.key, required this.mItem});

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text(mItem.title ?? ""),
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            color: Colors.black54,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text(
              mItem.overview!,
              softWrap: true,
              style: const TextStyle(fontSize: 28, color: Colors.white),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Image.network(
                  mItem.posterPath!.getPosterURL(PosterImageURL.ori),
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              }))
        ]),
      ));
}
