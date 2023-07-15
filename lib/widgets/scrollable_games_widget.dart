import 'package:flutter/material.dart';

import '../constants/data.dart';

class ScrollableGamesWidget extends StatelessWidget {
  final double _width;
  final double _height;
  final bool _showTitle;
  final List<Game> _gamesData;

  ScrollableGamesWidget(
    this._width,
    this._height,
    this._showTitle,
    this._gamesData,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _width,
      height: _height,
      child: ListView(
        physics: const BouncingScrollPhysics(
          decelerationRate: ScrollDecelerationRate.normal,
        ),
        scrollDirection: Axis.horizontal,
        children: _gamesData.map((_game) {
          return Container(
            width: _width * 0.30,
            height: _height,
            padding: EdgeInsets.only(right: _width * 0.03),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: _width * 0.45,
                  height: _height * 0.80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(_game.coverImage.url),
                    )
                  ),
                ),
                if (_showTitle)
                  Text(
                    _game.title,
                    maxLines: 2,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: _height * 0.08,
                    ),
                  ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
