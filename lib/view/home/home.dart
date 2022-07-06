import 'package:flutter/material.dart';
import 'package:gi_tg/localStorage/sharePreference.dart';
import 'package:gi_tg/network/service.dart';
import 'package:gi_tg/view/movie/popular.dart';

class MyHomePage extends StatefulWidget {
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
    await SharePreference.setLogin(!isLogin);
    setState(() {
      isLogin = !isLogin;
    });
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
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            TextButton.icon(
                onPressed: setLogin,
                icon: Icon(
                  (isLogin ? Icons.logout_sharp : Icons.login_sharp),
                  color: Colors.black,
                ),
                label: Text(
                  isLogin ? "out        |" : "In        |",
                  style: const TextStyle(color: Colors.black),
                ))
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
              icon: Icon(Icons.movie_filter),
              label: 'Movie Latest',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      );
}
