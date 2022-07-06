import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gi_tg/network/model/movieItem.dart';
import 'package:gi_tg/network/service.dart';
import 'package:gi_tg/view/Common/home_itme.dart';
import 'package:gi_tg/view/common/poster_itme.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:rxdart/subjects.dart';

class HomeMovie extends StatefulWidget {
  const HomeMovie({super.key});

  @override
  State<HomeMovie> createState() => _HomeMovieState();
}

class _HomeMovieState extends State<HomeMovie> {
  late Service server;
  BehaviorSubject<List<MovieItem>> moviesSubj = BehaviorSubject.seeded([]);
  ScrollController _ctrl = ScrollController();
  int page = 1;

  @override
  void initState() {
    server = Service.create();
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
    server.getPopularMovies(page).then((value) {
      if (value.isSuccessful) {
        if (value.body!.page == page) {
          setState(() {
            page++;
          });
          moviesSubj.value.addAll(value.body?.results ?? []);
        }
      }
    });
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
      builder: (context, AsyncSnapshot<List<MovieItem>> snapshot) =>
          snapshot.hasData && snapshot.data!.isNotEmpty
              ? GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
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
