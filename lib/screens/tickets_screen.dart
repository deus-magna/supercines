import 'package:flutter/material.dart';
import 'package:supercines/framework/colors.dart';
import 'package:supercines/models/movie_model.dart';
import 'package:supercines/widgets/background_image.dart';
import 'package:supercines/widgets/bottom_item.dart';
import 'package:supercines/widgets/custom_app_bar.dart';
import 'package:supercines/widgets/horizontal_scroll_list.dart';

class TicketsScreen extends StatefulWidget {
  @override
  _TicketsScreenState createState() => _TicketsScreenState();
}

class _TicketsScreenState extends State<TicketsScreen> {
  final _avatar =
      'https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg-1024x683.jpg';
  Movie _movie;
  int selectedCalendarIndex;
  int selectedPriceIndex;

  @override
  Widget build(BuildContext context) {
    _movie = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Stack(
        children: [
          BackgroundImage(color: backgroundBlue, backgroundImage: null),
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
              "\$3.75",
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
        onPressed: () {},
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
          ],
        ),
      ),
    );
  }

  Widget _buildHorizontalPriceView() {

    final List<TimeData> data = [
      TimeData('17:25', 'FROM \$3,75'),
      TimeData('19:55', 'FROM \$3,75'),
      TimeData('20:25', 'FROM \$3,75'),
      TimeData('21:05', 'FROM \$3,75')
    ];
    
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

    final List<Calendar> data = [
      Calendar(11, 'SA'),
      Calendar(12, 'SU'),
      Calendar(13, 'MO'),
      Calendar(14, 'TU'),
      Calendar(15, 'WE'),
      Calendar(16, 'TH'),
      Calendar(17, 'FR'),
    ];

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
}

class PosterImage extends StatelessWidget {
  const PosterImage({
    Key key,
    @required Movie movie,
    this.padding = 18.0,
  })  : _movie = movie,
        super(key: key);

  final Movie _movie;
  final double padding;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Row(
        children: [
          Hero(
            tag: _movie.id,
            child: Container(
              width: 54,
              height: size.height * 0.085,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: FadeInImage(
                  image: NetworkImage(_movie.getPosterImg()),
                  placeholder: AssetImage('assets/img/no-image.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              _movie.title.toUpperCase(),
              maxLines: 2,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
