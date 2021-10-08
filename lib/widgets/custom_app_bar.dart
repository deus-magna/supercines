import 'package:flutter/material.dart';
import 'package:supercines/framework/custom_icons.dart';
import 'package:supercines/widgets/theater_selector.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.avatar,
  }) : super(key: key);

  final String avatar;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          CustomIcons.menu,
          color: Colors.white,
        ),
        Column(
          children: [
            Text('SUPERCINES', style: Theme.of(context).textTheme.headline1),
            const TheaterSelector()
          ],
        ),
        CircleAvatar(
          backgroundImage: NetworkImage(avatar),
          backgroundColor: Colors.red,
        ),
      ],
    );
  }
}
