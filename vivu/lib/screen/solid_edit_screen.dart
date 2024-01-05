import 'package:flutter/material.dart';
import 'package:vivu/core/app_export.dart';

class SolidEditScreen extends StatelessWidget {
  const SolidEditScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: 512.v,
          width: 576.h,
        ),
      ),
    );
  }
}
