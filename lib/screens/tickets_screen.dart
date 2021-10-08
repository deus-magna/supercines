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
  const TicketsScreen({Key? key, this.movie}) : super(key: key);

  final Movie? movie;

  @override
  _TicketsScreenState createState() => _TicketsScreenState();
}

class _TicketsScreenState extends State<TicketsScreen> {
  final _avatar =
      'https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg-1024x683.jpg';
  Movie? _movie;
  int? selectedCalendarIndex;
  int? selectedPriceIndex;
  List<SeatsRow> listOfSeatsRow = utils.getMockSeatsList();
  double total = 0;

  @override
  Widget build(BuildContext context) {
    _movie = ModalRoute.of(context)!.settings.arguments != null
        ? ModalRoute.of(context)!.settings.arguments as Movie?
        : widget.movie;

    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImage(
            color: backgroundBlue,
            animatedOpacity: 1,
          ),
          _buildMovieContent(context),
          BottomItem(
            size: 36,
            alignment: MainAxisAlignment.start,
            onPressed: () => Navigator.of(context).pop(),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 36,
            ),
          ),
          BottomItem(
            size: 48,
            alignment: MainAxisAlignment.center,
            child: Text(
              '\$$total',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 25,
              ),
            ),
          ),
          BottomItem(
            size: 36,
            alignment: MainAxisAlignment.end,
            child: _buildPayButton(context),
          ),
        ],
      ),
    );
  }

  Widget _buildPayButton(BuildContext context) {
    final raisedButtonStyle = ElevatedButton.styleFrom(
      onPrimary: Colors.black87,
      primary: yellow,
      minimumSize: const Size(88, 36),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    );
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.062,
      child: ElevatedButton(
        style: raisedButtonStyle,
        onPressed: () => Navigator.of(context).pop(),
        child: const Text('PAY',
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
        margin: const EdgeInsets.only(top: 5),
        child: Column(
          children: <Widget>[
            CustomAppBar(avatar: _avatar),
            const SizedBox(height: 10),
            PosterImage(movie: _movie!),
            const SizedBox(height: 10),
            _buildHorizontalCalendarView(),
            const SizedBox(height: 10),
            _buildHorizontalPriceView(),
            const SizedBox(height: 40),
            _buildCinemaScreen(),
            const SizedBox(height: 20),
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
          padding: const EdgeInsets.symmetric(horizontal: 7.5, vertical: 8),
          child: TimeButton(
            timeData: data[index],
            selected: selectedPriceIndex == index,
            onPressed: () => setState(() => selectedPriceIndex = index),
          ),
        );
      },
    );
  }

  Widget _buildHorizontalCalendarView() {
    final data = utils.getMockCalendar();

    return HorizontalScrollList(
      height: 85,
      backgroundColor: const Color(0xFF021333),
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7.5, vertical: 8),
          child: CalendarButton(
            calendar: data[index],
            selected: selectedCalendarIndex == index,
            onPressed: () => setState(() => selectedCalendarIndex = index),
          ),
        );
      },
    );
  }

  Widget _buildSeatsArea(Size size) {
    return TranslateAnimation(
      duration: const Duration(milliseconds: 1500),
      child: SizedBox(
        height: size.height * 0.3,
        child: MovieSeats(
          seats: listOfSeatsRow,
          onItemSelected: _checkReservedSeats,
        ),
      ),
    );
  }

  void _checkReservedSeats(int row, int index) {
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
      duration: const Duration(milliseconds: 1000),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: CustomPaint(
          size: const Size(double.infinity, 30),
          painter: ScreenPainter(),
        ),
      ),
    );
  }
}
