import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gi_tg/localStorage/sharePreference.dart';
import 'package:gi_tg/network/service.dart';
import 'package:gi_tg/router/navigationCubit.dart';
import 'package:gi_tg/router/pageConfig.dart';
import 'package:gi_tg/view/ePage.dart';
import 'package:gi_tg/view/login.dart';
import 'package:gi_tg/view/movie/popular.dart';

class MyHomePage extends StatefulWidget {
  static EPage getPage(String title) =>
      EPage((ctx) => MyHomePage(title: title));

  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Service server;
  bool isLogin = false;
  int _selectedIndex = 0;

  void getLogin() async {
    final result = await SharePreference.isLogin();
    setState(() {
      isLogin = result;
    });
  }

  void setLogin() async {
    final res = await Navigator.push<bool?>(
        context, MaterialPageRoute(builder: (ctc) => const Login()));
    print("--$res");
    if (res != null) {
      setState(() {
        isLogin = res;
      });
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    server = Service.create();
    getLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(
                onPressed: () {
                  BlocProvider.of<NavigationCubit>(context)
                      .pushPage(PageConfig.setting());
                },
                icon: const Icon(Icons.settings))
          ],
        ),
        body: IndexedStack(index: _selectedIndex, children: const [
          Popular(),
          Popular(
            isTV: true,
          ),
          Popular(
            isLatest: true,
          )
        ]),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).bottomAppBarColor,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.movie_sharp),
              label: 'Movie',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.tv_sharp),
              label: 'TvShow',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.trending_up),
              label: 'Trending',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
        floatingActionButton: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blueAccent,
            ),
            child: TextButton.icon(
                onPressed: () {
                  BlocProvider.of<NavigationCubit>(context)
                      .pushPage(PageConfig.login());
                  // setLogin();
                },
                icon: Icon(
                  (isLogin ? Icons.logout_sharp : Icons.login_sharp),
                  color: Colors.black,
                ),
                label: Text(
                  isLogin ? "out" : "In",
                  style: const TextStyle(color: Colors.black),
                ))),
      );
}
