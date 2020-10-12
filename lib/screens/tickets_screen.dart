import 'package:flutter/material.dart';
import 'package:supercines/framework/animations.dart';

import 'package:supercines/framework/colors.dart';
import 'package:supercines/models/movie_model.dart';
import 'package:supercines/models/seats_row_model.dart';
import 'package:supercines/utils/utils.dart' as utils;
import 'package:supercines/widgets/background_image.dart';
import 'package:supercines/widgets/bottom_item.dart';
import 'package:supercines/widgets/calendar_button.dart';
import 'package:supercines/widgets/custom_app_bar.dart';
import 'package:supercines/widgets/horizontal_scroll_list.dart';
import 'package:supercines/widgets/movie_seats/movie_seats_widget.dart';
import 'package:supercines/widgets/poster_imagen.dart';
import 'package:supercines/widgets/screen_painter.dart';
import 'package:supercines/widgets/time_button.dart';

class TicketsScreen extends StatefulWidget {
  final Movie movie;

  const TicketsScreen({Key key, this.movie}) : super(key: key);
  @override
  _TicketsScreenState createState() => _TicketsScreenState();
}

class _TicketsScreenState extends State<TicketsScreen> {
  final _avatar =
      'https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg-1024x683.jpg';
  Movie _movie;
  int selectedCalendarIndex;
  int selectedPriceIndex;
  List<SeatsRow> listOfSeatsRow = utils.getMockSeatsList();
  double total = 0.0;

  @override
  Widget build(BuildContext context) {
    _movie = ModalRoute.of(context).settings.arguments != null
        ? ModalRoute.of(context).settings.arguments
        : widget.movie;

    return Scaffold(
      body: Stack(
        children: [
          BackgroundImage(color: backgroundBlue, backgroundImage: null, animatedOpacity: 1.0,),
          _buildMovieContent(context),
          BottomItem(
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 36,
            ),
            size: 36,
            alignment: MainAxisAlignment.start,
            onPressed: () => Navigator.of(context).pop(),
          ),
          BottomItem(
            child: Text(
              "\$$total",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            size: 48,
            alignment: MainAxisAlignment.center,
          ),
          BottomItem(
            child: _buildPayButton(context),
            size: 36,
            alignment: MainAxisAlignment.end,
          ),
        ],
      ),
    );
  }

  Widget _buildPayButton(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.062,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        color: yellow,
        onPressed: () => Navigator.of(context).pop(),
        child: Text('PAY',
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500)),
      ),
    );
  }

  SafeArea _buildMovieContent(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CustomAppBar(avatar: _avatar),
            SizedBox(height: 10),
            PosterImage(movie: _movie),
            SizedBox(height: 10),
            _buildHorizontalCalendarView(),
            SizedBox(height: 10),
            _buildHorizontalPriceView(),
            SizedBox(height: 40),
            _buildCinemaScreen(),
            SizedBox(height: 20),
            _buildSeatsArea(MediaQuery.of(context).size),
          ],
        ),
      ),
    );
  }

  Widget _buildHorizontalPriceView() {
    final data = utils.getMockTimeAndPrice();

    return HorizontalScrollList(
      height: 80,
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 7.5, vertical: 8),
          child: TimeButton(
            timeData: data[index],
            selected: selectedPriceIndex == index ? true : false,
            onPressed: () {
              print('Selected out');
              setState(() => selectedPriceIndex = index);
            },
          ),
        );
      },
    );
  }

  Widget _buildHorizontalCalendarView() {
    final data = utils.getMockCalendar();

    return HorizontalScrollList(
      height: 85,
      backgroundColor: Color(0xFF021333),
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 7.5, vertical: 8),
          child: CalendarButton(
            calendar: data[index],
            selected: selectedCalendarIndex == index ? true : false,
            onPressed: () {
              print('Selected out');
              setState(() => selectedCalendarIndex = index);
            },
          ),
        );
      },
    );
  }

  Widget _buildSeatsArea(Size size) {
    return TranslateAnimation(
      duration: Duration(milliseconds: 1500),
      child: Container(
        height: size.height * 0.3,
        child: MovieSeats(
          seats: listOfSeatsRow,
          onItemSelected: (row, index) => _checkReservedSeats(row, index),
        ),
      ),
    );
  }

  _checkReservedSeats(int row, int index) {
    print('ROW: $row, INDEX: $index');
    setState(() {
      if (!listOfSeatsRow[row].reservedSeats.contains(index + 1)) {
        if (listOfSeatsRow[row].selectedSeats.contains(index + 1)) {
          listOfSeatsRow[row].selectedSeats.remove(index + 1);
          total -= 3.75;
        } else {
          listOfSeatsRow[row].selectedSeats.add(index + 1);
          total += 3.75;
        }
      }
    });
  }

  Widget _buildCinemaScreen() {
    return TranslateAnimation(
      duration: Duration(milliseconds: 1000),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        child: CustomPaint(
          size: Size(double.infinity, 30),
          painter: ScreenPainter(),
        ),
      ),
    );
  }
}
