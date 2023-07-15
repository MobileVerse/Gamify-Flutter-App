import 'package:flutter/material.dart';
import 'package:gamify_app/widgets/scrollable_games_widget.dart';

import '../constants/data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double _deviceWidth = 0;
  late double _deviceHeight = 0;
  int _selectedGame = 0;

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
          _topLayoutWidget(),
        ],
      ),
    );
  }

  Widget _featuredGamesWidget() {
    return SizedBox(
        width: _deviceWidth,
        height: _deviceHeight * 0.5,
        child: PageView(
          onPageChanged: (index) {
            setState(() {
              _selectedGame = index;
            });
          },
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

  Widget _topLayoutWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: _deviceHeight * 0.005,
        horizontal: _deviceWidth * 0.025,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _topBarWidget(),
          SizedBox(height: _deviceHeight * 0.13),
          _featuredGamesInfoWidget(),
          // First Scroll View Games Widget
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: _deviceHeight * 0.01,
            ),
            child: ScrollableGamesWidget(
              _deviceWidth,
              _deviceHeight * 0.24,
              true,
              games,
            ),
          ),
          _featuredGameBannerWidget(),
          // Second Scroll View Games Widget
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: _deviceHeight * 0.01,
            ),
            child: ScrollableGamesWidget(
              _deviceWidth,
              _deviceHeight * 0.20,
              false,
              games,
            ),
          ),
        ],
      ),
    );
  }

  Widget _topBarWidget() {
    return SizedBox(
      width: _deviceWidth,
      height: _deviceHeight * 0.13,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.menu,
            color: Colors.white,
            size: 30,
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.search,
                color: Colors.white,
                size: 30,
              ),
              SizedBox(width: _deviceWidth * 0.03),
              Icon(
                Icons.notifications_none,
                color: Colors.white,
                size: 30,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _featuredGamesInfoWidget() {
    return SizedBox(
      width: _deviceWidth,
      height: _deviceHeight * 0.12,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            featuredGames[_selectedGame].title,
            maxLines: 2,
            style: TextStyle(
              color: Colors.white,
              fontSize: _deviceHeight * 0.040,
            ),
          ),
          SizedBox(height: _deviceHeight * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: featuredGames.map((game) {
              bool isActive = game.title == featuredGames[_selectedGame].title;
              double circleRadius = _deviceHeight * 0.008;
              return Container(
                height: circleRadius,
                width: circleRadius,
                margin: EdgeInsets.symmetric(horizontal: _deviceWidth * 0.0050),
                decoration: BoxDecoration(
                  color: isActive ? Colors.white : Colors.grey,
                  borderRadius: BorderRadius.circular(circleRadius / 2),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _featuredGameBannerWidget() {
    return Container(
      width: _deviceWidth,
      height: _deviceHeight * 0.13,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(featuredGames[2].coverImage.url),
        ),
        borderRadius: BorderRadius.circular(6.0),
      ),
    );
  }
}
