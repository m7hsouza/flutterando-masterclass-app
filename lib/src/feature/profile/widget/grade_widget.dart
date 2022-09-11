import 'package:flutter/material.dart';

class GradeWidget extends StatelessWidget {
  const GradeWidget({Key? key, this.grade = 0}) : super(key: key);

  final int grade;

  @override
  Widget build(BuildContext context) {
    assert(grade >= 0 && grade <= 10, 'The grade must be >= 0 and <= 10');
    double percent = grade / 10;

    var width = MediaQuery.of(context).size.width * 3 / 5;

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: ColoredBox(
        color: Theme.of(context).backgroundColor,
        child: SizedBox(
          width: width,
          height: 12,
          child: Align(
            alignment: Alignment.centerLeft,
            child: ColoredBox(
              color: Theme.of(context).primaryColor,
              child: SizedBox(
                width: width * percent,
                height: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
