import 'package:flutter/material.dart';

import 'package:app_arch/shared/const/sizes.dart';

class HeightGap extends StatelessWidget {
  const HeightGap([
    this.size = Sizes.defaultSpacing,
    Key? key,
  ]) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) => SizedBox(width: size);
}

class WidthGap extends StatelessWidget {
  const WidthGap([
    this.size = Sizes.defaultSpacing,
    Key? key,
  ]) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) => SizedBox(height: size);
}
