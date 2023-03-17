import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:tapptic_challenge/model/number_model.dart';

class NumberDetails extends StatelessWidget {
  const NumberDetails({super.key, required this.number});

  final NumberModel number;

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) => Drawer(
        width: ResponsiveValue<double>(
          context,
          defaultValue: orientation == Orientation.portrait
              ? MediaQuery.of(context).size.width
              : MediaQuery.of(context).size.width * 0.5,
          valueWhen: [],
        ).value,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(number.image),
            const SizedBox(
              height: 16,
            ),
            Text(number.name),
          ],
        ),
      ),
    );
  }
}
