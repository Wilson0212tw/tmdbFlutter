import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gi_tg/network/model/index.dart';
import 'package:gi_tg/network/service.dart';

import 'package:gi_tg/view/common/poster_itme.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:rxdart/subjects.dart';

class Popular extends StatefulWidget {
  final bool isTV;
  final bool isLatest;
  const Popular({super.key, this.isTV = false, this.isLatest = false});

  @override
  State<Popular> createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  BehaviorSubject<List<ArtWork>> moviesSubj = BehaviorSubject.seeded([]);
  ScrollController _ctrl = ScrollController();
  int page = 1;

  @override
  void initState() {
    fetchPage();

    _ctrl.addListener(() {
      if (_ctrl.offset >= _ctrl.position.maxScrollExtent &&
          !_ctrl.position.outOfRange) {
        fetchPage();
      }
    });
    super.initState();
  }

  fetchPage() {
    debugPrint("loading next page :$page");
    if (widget.isLatest) {
      client.getMovieLatest(page).then((value) {
        if (value.page == page) {
          setState(() {
            page++;
          });
          moviesSubj.value.addAll(value.results ?? []);
        }
      });
    } else if (widget.isTV) {
      client.getTVShowPopulars(page).then((value) {
        if (value.page == page) {
          setState(() {
            page++;
          });
          moviesSubj.value.addAll(value.results ?? []);
        }
      });
    } else {
      client.getMoviePopulars(page).then((value) {
        if (value.page == page) {
          setState(() {
            page++;
          });
          moviesSubj.value.addAll(value.results ?? []);
        }
      });
    }
  }

  @override
  void dispose() {
    _ctrl.dispose();
    moviesSubj.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => StreamBuilder(
      stream: moviesSubj,
      builder: (context, AsyncSnapshot<List<ArtWork>> snapshot) =>
          snapshot.hasData && snapshot.data!.isNotEmpty
              ? GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.7, crossAxisCount: 3),
                  controller: _ctrl,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: moviesSubj.value.length + 1,
                  itemBuilder: (ctx, idex) => idex == moviesSubj.value.length
                      ? const LoadingIndicator(
                          colors: [Colors.black],

                          /// 必须, 颜色集合
                          indicatorType: Indicator.ballBeat,

                          /// 可选, loading的类型
                          strokeWidth: 2,

                          /// 可选, 线条宽度，只对含有线条的组件有效
                          backgroundColor: Colors.transparent,

                          /// 可选, 组件背景色
                          pathBackgroundColor: Colors.black

                          /// 可选, 线条背景色
                          )
                      : PosterItme(movie: moviesSubj.value[idex]))
              : Container());
}
