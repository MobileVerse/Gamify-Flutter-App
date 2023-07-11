import 'package:flutter/material.dart';
import '../constants/data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double _deviceWidth;
  late double _deviceHeight;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          _featuredGamesWidget(),
          _gradientBoxWidget(),
        ],
      ),
    );
  }

  Widget _featuredGamesWidget() {
    return SizedBox(
        width: _deviceWidth,
        height: _deviceHeight * 0.5,
        child: PageView(
          children: featuredGames.map(
            (game) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(game.coverImage.url),
                  ),
                ),
              );
            },
          ).toList(),
        ));
  }

  Widget _gradientBoxWidget() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: _deviceWidth,
        height: _deviceHeight * 0.8,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromRGBO(35, 45, 59, 1.0), Colors.transparent],
            stops: [
              0.65,
              1.0,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
      ),
    );
  }
}
