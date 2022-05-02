// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const Flag = 'flag';

enum ChooseLoading { Page }

class AppLoading extends StatelessWidget {
  const AppLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SpinKitSquareCircle(
      size: 45,
      color: Colors.blueGrey,
    );
  }
}
